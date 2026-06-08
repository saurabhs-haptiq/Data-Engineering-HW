-- You are given two tables, teams
-- content_copy
--  and matches
-- content_copy
-- , with the following structures:

--   create table teams (
--       team_id integer not null,
--       team_name varchar(30) not null,
--       unique(team_id)
--   );

--   create table matches (
--       match_id integer not null,
--       host_team integer not null,
--       guest_team integer not null,
--       host_goals integer not null,
--       guest_goals integer not null,
--       unique(match_id)
--   );

-- content_copy
-- Each record in the table teams
-- content_copy
--  represents a single soccer team. Each record in the table matches
-- content_copy
--  represents a finished match between two teams. Teams (host_team
-- content_copy
-- , guest_team
-- content_copy
-- ) are represented by their IDs in the teams
-- content_copy
--  table (team_id
-- content_copy
-- ). No team plays a match against itself. You know the result of each match (that is, the number of goals scored by each team).

-- You would like to compute the total number of points each team has scored after all the matches described in the table. The scoring rules are as follows:

-- If a team wins a match (scores strictly more goals than the other team), it receives three points.
-- If a team draws a match (scores exactly the same number of goals as the opponent), it receives one point.
-- If a team loses a match (scores fewer goals than the opponent), it receives no points.
-- Write an SQL query that returns a ranking of all teams (team_id
-- content_copy
-- ) described in the table teams
-- content_copy
-- . For each team you should provide its name and the number of points it received after all described matches (num_points
-- content_copy
-- ). The table should be ordered by num_points
-- content_copy
--  (in decreasing order). In case of a tie, order the rows by team_id
-- content_copy
--  (in increasing order).

-- For example, for:

--   teams:

--    team_id | team_name
--   ---------+---------------
--    10      | Give
--    20      | Never
--    30      | You
--    40      | Up
--    50      | Gonna


--   matches:

--    match_id | host_team | guest_team | host_goals | guest_goals
--   ----------+-----------+------------+------------+-------------
--    1        | 30        | 20         | 1          | 0
--    2        | 10        | 20         | 1          | 2
--    3        | 20        | 50         | 2          | 2
--    4        | 10        | 30         | 1          | 0
--    5        | 30        | 50         | 0          | 1

-- content_copy
-- your query should return:

--    team_id | team_name | num_points
--   ---------+-----------+------------
--    20      | Never     | 4
--    50      | Gonna     | 4
--    10      | Give      | 3
--    30      | You       | 3
--    40      | Up        | 0




WITH team_points AS (
    SELECT
        host_team AS team_id,
        CASE
            WHEN host_goals > guest_goals THEN 3
            WHEN host_goals = guest_goals THEN 1
            ELSE 0
        END AS points
    FROM matches

    UNION ALL

    SELECT
        guest_team AS team_id,
        CASE
            WHEN guest_goals > host_goals THEN 3
            WHEN guest_goals = host_goals THEN 1
            ELSE 0
        END AS points
    FROM matches
)

SELECT
    t.team_id,
    t.team_name,
    COALESCE(SUM(tp.points), 0) AS num_points
FROM teams t
LEFT JOIN team_points tp
    ON t.team_id = tp.team_id
GROUP BY
    t.team_id,
    t.team_name
ORDER BY
    num_points DESC,
    t.team_id ASC;
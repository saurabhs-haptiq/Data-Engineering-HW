-- Given a table events
-- content_copy
--  with the following structure:

--   create table events (
--       event_type integer not null,
--       value integer not null,
--       time timestamp not null,
--       unique(event_type, time)
--   );

-- content_copy
-- write an SQL query that, for each event_type
-- content_copy
--  that has been registered more than once, returns the difference between the latest (i.e. the most recent in terms of time
-- content_copy
-- ) and the second latest value
-- content_copy
-- . The table should be ordered by event_type
-- content_copy
--  (in ascending order).

-- For example, given the following data:

--    event_type | value      | time
--   ------------+------------+--------------------
--    2          | 5          | 2015-05-09 12:42:00
--    4          | -42        | 2015-05-09 13:19:57
--    2          | 2          | 2015-05-09 14:48:30
--    2          | 7          | 2015-05-09 12:54:39
--    3          | 16         | 2015-05-09 13:19:57
--    3          | 20         | 2015-05-09 15:01:09

-- content_copy
-- your query should return the following rowset:

--    event_type | value
--   ------------+-----------
--    2          | -5
--    3          | 4

-- content_copy
-- For the event_type
-- content_copy
--  2, the latest value
-- content_copy
--  is 2 and the second latest value
-- content_copy
--  is 7, so the difference between them is −5.

-- The names of the columns in the rowset don't matter, but their order does.

WITH ranked_events AS (
    SELECT
        event_type,
        value,
        ROW_NUMBER() OVER (
            PARTITION BY event_type
            ORDER BY time DESC
        ) AS rn
    FROM events
)
SELECT
    event_type,
    MAX(CASE WHEN rn = 1 THEN value END) -
    MAX(CASE WHEN rn = 2 THEN value END) AS value
FROM ranked_events
WHERE rn <= 2
GROUP BY event_type
HAVING COUNT(*) = 2
ORDER BY event_type;
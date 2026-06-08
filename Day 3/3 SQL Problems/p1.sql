-- Given a table elements
-- content_copy
--  with the following structure:

--   create table elements (
--       v integer not null
--   );

-- content_copy
-- write an SQL query that returns the sum of the numbers in column v
-- content_copy
-- .

-- For example, given:

--   v
--   ---
--   2
--   10
--   20
--   10

-- content_copy
-- your query should return 42.

SELECT SUM(v) AS total
FROM elements;
-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change
-- Select Avg(daily_count) AS before_update from
-- (
--     SELECT date, count(date) AS daily_count
--     FROM 
--         (
--             SELECT  
--             strftime('%Y-%m-%d', datetime(login_timestamp , 'unixepoch')) as date
--             FROM login_history 
--         )
--     WHERE date < '2018-06-02'
--     GROUP BY date
-- )
-- WHERE date <'2018-06-02' 
-- AND date >='2018-02-03'

SELECT 
    AVG(CASE WHEN date < '2018-06-02' THEN daily_count END) AS before,
    AVG(CASE WHEN date >= '2018-06-02' THEN daily_count END) AS after
FROM
(
    SELECT date, count(date) AS daily_count
    FROM 
        (
            SELECT  
            strftime('%Y-%m-%d', datetime(login_timestamp , 'unixepoch')) as date
            FROM login_history 
        )
    GROUP BY date
)
-- WHERE date <'2018-06-02' 




-- PART 2: Create a SQL query that indicates the number of status changes by card

-- SELECT cardId, count(*) from card_change_history 
-- Group by cardID




-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change

SELECT 
    AVG(CASE WHEN date < '2018-06-02' THEN daily_count END) AS before_update,
    AVG(CASE WHEN date >= '2018-06-02' THEN daily_count END) AS after_update
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


-- PART 2: Create a SQL query that indicates the number of status changes by card
SELECT cardId, count(*) 
    FROM card_change_history 
    GROUP BY cardID






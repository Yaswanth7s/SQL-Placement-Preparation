SELECT
    visited_on,
    amount,
    ROUND(average_amount,2) AS average_amount
FROM(
    SELECT
        *,
        ROW_NUMBER() OVER(ORDER BY visited_on) AS rn
    FROM (
        SELECT
            visited_on,
            SUM(total_daily_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
            AVG(total_daily_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS average_amount
        FROM (
            SELECT 
                visited_on,
                SUM(amount) as total_daily_amount
            FROM Customer
            GROUP BY visited_on
        )t
    )rm
)x
WHERE rn>=7;

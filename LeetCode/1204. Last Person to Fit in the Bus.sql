SELECT
    person_name
    FROM(
        SELECT
            person_name,
            turn,
            SUM(Weight) OVER(ORDER BY turn) AS last_weight
        FROM Queue
    )t
WHERE last_weight<=1000
ORDER BY turn DESC
LIMIT 1;
SELECT
    Id
FROM(
    SELECT
        id AS Id,
        temperature,
        recordDate,
        LAG(temperature) OVER(ORDER BY recordDate) AS previous_temp,
        LAG(recordDate) OVER(ORDER BY recordDate) AS previous_date
    FROM Weather
)t
WHERE previous_temp<temperature AND DATEDIFF(recordDate,previous_date)=1;
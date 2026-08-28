SELECT
CONCAT(sum1,' ',sum2)
FROM(
    SELECT
        ROUND(SUM(LAT_N),2) AS sum1,
        ROUND(SUM(LONG_W),2) AS sum2
    FROM STATION
)t
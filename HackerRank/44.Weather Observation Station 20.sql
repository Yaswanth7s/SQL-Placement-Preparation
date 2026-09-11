SELECT
    ROUND(AVG(LAT_N),4)
FROM(
    SELECT
        LAT_N,
        ROW_NUMBER() OVER(ORDER BY LAT_N) AS rn,
        COUNT(*) OVER() AS total
    FROM STATION
) AS t
WHERE rn IN ((total+1)/2,(total+2)/2);
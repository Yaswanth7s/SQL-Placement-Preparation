SELECT
    ROUND(ABS(a-c)+ABS(b-d),4)
FROM(
    SELECT
        MIN(LAT_N) AS a,
        MIN(LONG_W) AS b,
        MAX(LAT_N) AS c,
        MAX(LONG_W) AS d
    FROM STATION
)t;
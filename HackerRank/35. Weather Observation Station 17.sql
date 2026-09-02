SELECT  
    ROUND(s.LONG_W,4)
FROM STATION AS s
JOIN(
    SELECT
        MIN(LAT_N) AS smallest
    FROM STATION
    WHERE LAT_N > 38.7780
)t
ON s.LAT_N=t.smallest;
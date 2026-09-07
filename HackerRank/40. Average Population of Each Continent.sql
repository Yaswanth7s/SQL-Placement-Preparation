SELECT
    co.Continent,
    FLOOR(AVG(c.Population))
FROM CITY AS c
JOIN COUNTRY AS co
ON c.CountryCode=co.Code
GROUP BY co.Continent;
SELECT 
    name 
FROM(
    SELECT
        m.name,
        COUNT(e.id)
    FROM Employee AS e
    INNER JOIN Employee AS m
    ON e.managerId=m.id
    GROUP BY e.managerId
    HAVING COUNT(e.id)>=5
)t
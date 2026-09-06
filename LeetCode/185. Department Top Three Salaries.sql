SELECT
    Department,
    Employee,
    Salary
FROM (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER(PARTITION BY e.departmentId ORDER BY salary DESC) AS rnk
    FROM Employee AS e
    LEFT JOIN Department AS d
    ON e.departmentId=d.id
)t
WHERE rnk<=3;
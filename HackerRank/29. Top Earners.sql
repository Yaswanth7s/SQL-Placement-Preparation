SELECT
    MAX(earnings),
    COUNT(employee_id)
FROM(
    SELECT
        employee_id,
        months*salary AS earnings
    FROM Employee
)t
WHERE earnings=(SELECT MAX(months*salary) FROM Employee);
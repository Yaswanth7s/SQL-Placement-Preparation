SELECT
    name,
    balance
FROM(
    SELECT
        u.name AS name,
        SUM(t.amount) AS balance
    FROM Users AS u
    INNER JOIN Transactions AS t
    ON u.account=t.account
    GROUP BY t.account
)t
WHERE balance>10000;
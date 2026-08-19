SELECT
    u.user_id AS buyer_id,
    u.join_date,
    COUNT(CASE 
            WHEN YEAR(order_date)=2019 THEN ''
            END) AS orders_in_2019
FROM Users AS u
LEFT JOIN Orders AS o
ON u.user_id=o.buyer_id
GROUP BY u.user_id
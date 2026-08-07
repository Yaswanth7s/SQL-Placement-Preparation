SELECT
    p.product_id,
    COALESCE(ROUND((SUM(units*price))/SUM(units),2),0) AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS u
ON p.product_id=u.product_id AND purchase_date BETWEEN start_date AND end_date
GROUP BY p.product_id
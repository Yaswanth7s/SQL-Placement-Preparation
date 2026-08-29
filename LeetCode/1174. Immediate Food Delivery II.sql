SELECT
    ROUND(SUM(d.order_date=d.customer_pref_delivery_date)*100.0/COUNT(*),2) AS immediate_percentage
FROM (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
)t
JOIN Delivery d
    ON t.customer_id = d.customer_id
    AND t.first_order_date = d.order_date;
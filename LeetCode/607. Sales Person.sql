SELECT
    DISTINCT s.name
FROM SalesPerson AS s
LEFT JOIN Orders AS o
ON s.sales_id=o.sales_id
LEFT JOIN Company AS c
ON o.com_id=c.com_id
GROUP BY s.name,s.sales_id
HAVING COALESCE(sum(c.name='RED'),0)=0;
SELECT
    name As Customers
FROM Customers
LEFT JOIN Orders
ON Customers.id=Orders.customerId
WHERE Orders.customerId IS NULL;
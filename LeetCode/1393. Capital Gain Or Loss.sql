SELECT
    stock_name,
    SUM(
        CASE WHEN operation='Buy' then -price
             WHEN operation='Sell' then price
        END 
    ) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name
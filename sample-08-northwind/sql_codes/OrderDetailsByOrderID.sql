SELECT
    d.[Order ID]
    , d.[Product ID]
    , p.[Product Name]
    , p.[English Name]
    , p.[Quantity Per Unit]
    , d.[Unit Price]
    , d.[Quantity]
    , d.[Quantity] * d.[Quantity] AS [Sum]
    , CAST(d.[Discount] AS money) AS [Discount]
FROM
    [Order Details] d
    INNER JOIN [Products] p ON p.[Product ID] = d.[Product ID]
WHERE
    d.[Order ID] = @OrderID

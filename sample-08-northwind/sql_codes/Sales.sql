SELECT
    d.[Order ID]
    , o.[Order Date]
    , o.[Required Date]
    , o.[Shipped Date]
    , CASE WHEN o.[Shipped Date] IS NULL THEN 0 ELSE 1 END AS Shipped
    , o.[Ship Name]
    , o.[Ship Country]
    , o.[Ship Region]
    , o.[Ship Address]
    , o.[Ship Postal Code]
    , o.[Ship Via]
    , o.Freight

    , c.[Company Name] AS [Customer Company Name]
    , c.Country AS [Customer Country]
    , c.Region AS [Customer Region]
    , c.City AS [Customer City]
    , c.[Address] AS [Customer Address]
    , c.[Postal Code] AS [Customer Postal Code]
    , c.[Contact Title] AS [Customer Contact Title]
    , c.[Contact Name] AS [Customer Contact Name]

    , d.[Product ID]
    , p.[Product Name]
    , p.Discontinued
    , p.[Quantity Per Unit]
    , d.[Unit Price]

    , d.Quantity
    , ROUND(d.[Unit Price] * d.Quantity, 2) AS [Total Sum]
    , ROUND(d.[Unit Price] * d.Quantity * (1 - d.Discount), 2) - ROUND(d.[Unit Price] * d.Quantity, 2) AS [Discount Sum]
    , ROUND(d.[Unit Price] * d.Quantity * (1 - d.Discount), 2) AS [Net Sum]
    , CAST(d.Discount AS money) AS Discount

    , o.[Employee ID]
    , e.[First Name] + ' ' + e.[Last Name] AS [Sales Person Name]
    , e.[First Name] AS [Sales Person First Name]
    , e.[Last Name] AS [Sales Person Last Name]
    , e.Country AS [Sales Person Country]
    , e.Region AS [Sales Person Region]
    , e.City AS [Sales Person City]

    , p.[Supplier ID]
    , s.[Company Name] AS [Supplier Company Name]
    , s.Country AS [Supplier Country]
    , s.Region AS [Supplier Region]
    , s.City AS [Supplier City]
    , s.[Contact Title] AS [Supplier Contact Title]
    , s.[Contact Name] AS [Supplier Contact Name]

    , h.[Shipper ID]
    , h.[Company Name] AS [Shipper Company Name]
FROM
    [Order Details] d
    INNER JOIN Orders o ON o.[Order ID] = d.[Order ID]
    INNER JOIN Customers c ON c.[Customer ID] = o.[Customer ID]
    INNER JOIN Products p ON p.[Product ID] = d.[Product ID]
    LEFT OUTER JOIN Suppliers s ON s.[Supplier ID] = p.[Supplier ID]
    LEFT OUTER JOIN Employees e ON e.[Employee ID] = o.[Employee ID]
    LEFT OUTER JOIN Shippers h ON h.[Shipper ID] = o.[Ship Via]

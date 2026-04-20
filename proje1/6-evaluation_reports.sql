USE BLM4522;
GO

SELECT
    COUNT(*) AS TotalRecord,
    SUM(CASE WHEN IsValid = 1 THEN 1 ELSE 0 END) AS ValidRecord,
    SUM(CASE WHEN IsValid = 0 THEN 1 ELSE 0 END) AS InvalidRecord
FROM StgOrders;
GO

SELECT
    ErrorType,
    COUNT(*) AS ErrorCount
FROM DataQualityLog_Orders
GROUP BY ErrorType
ORDER BY ErrorCount DESC;
GO

SELECT
    ColumnName,
    COUNT(*) AS ErrorCount
FROM DataQualityLog_Orders
GROUP BY ColumnName
ORDER BY ErrorCount DESC;
GO

SELECT
    RawOrderID,
    OrderNo,
    CustomerName,
    Email,
    ProductCode,
    Quantity,
    UnitPrice,
    OrderDate,
    ErrorMessage
FROM StgOrders
WHERE IsValid = 0;
GO

SELECT *
FROM FactOrders;
GO
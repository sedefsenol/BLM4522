
USE PerformanceDB;
GO


SELECT COUNT(*) AS RecordCountBeforeSimulation
FROM OnlineRetail;
GO

INSERT INTO OnlineRetail (
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
)
SELECT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    DATEADD(DAY, 1, InvoiceDate),
    UnitPrice,
    CustomerID,
    Country
FROM OnlineRetail;
GO

SELECT COUNT(*) AS RecordCountAfterSimulation
FROM OnlineRetail;
GO

SELECT Country, SUM(UnitPrice * Quantity) AS TotalSales
FROM OnlineRetail
GROUP BY Country
ORDER BY TotalSales DESC;
GO


USE PerformanceDB;
GO

EXEC sp_helpindex 'OnlineRetail';
GO

CREATE NONCLUSTERED INDEX IX_OnlineRetail_InvoiceDate
ON OnlineRetail (InvoiceDate);
GO

CREATE NONCLUSTERED INDEX IX_OnlineRetail_Country
ON OnlineRetail (Country);
GO

CREATE NONCLUSTERED INDEX IX_OnlineRetail_Description
ON OnlineRetail (Description);
GO

SELECT Country, SUM(UnitPrice * Quantity) AS TotalSales
FROM OnlineRetail
GROUP BY Country
ORDER BY TotalSales DESC;
GO

SELECT *
FROM OnlineRetail
ORDER BY InvoiceDate DESC;
GO

SELECT Description, COUNT(*) AS ProductCount
FROM OnlineRetail
GROUP BY Description
ORDER BY ProductCount DESC;
GO

EXEC sp_helpindex 'OnlineRetail';
GO
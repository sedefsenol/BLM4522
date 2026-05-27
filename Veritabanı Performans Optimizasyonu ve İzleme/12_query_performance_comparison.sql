
USE PerformanceDB;
GO

SET STATISTICS TIME ON;
SET STATISTICS IO ON;
GO



SELECT Country, SUM(UnitPrice * Quantity) AS TotalSales
FROM OnlineRetail
GROUP BY Country
ORDER BY TotalSales DESC;
GO



SELECT Description, COUNT(*) AS ProductCount
FROM OnlineRetail
GROUP BY Description
ORDER BY ProductCount DESC;
GO



SELECT TOP 5000 *
FROM OnlineRetail
ORDER BY InvoiceDate DESC;
GO

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
GO

USE PerformanceDB;
GO



SELECT *
FROM OnlineRetail
WHERE Description LIKE '%HEART%';
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
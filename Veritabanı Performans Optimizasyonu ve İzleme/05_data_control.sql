USE PerformanceDB;
GO

SELECT TOP 10 *
FROM OnlineRetail;
GO

SELECT COUNT(*) AS StagingRecordCount
FROM OnlineRetail_Staging;
GO

SELECT COUNT(*) AS CleanRecordCount
FROM OnlineRetail;
GO

SELECT Country, COUNT(*) AS OrderCount
FROM OnlineRetail
GROUP BY Country
ORDER BY OrderCount DESC;
GO


SELECT COUNT(*) AS MissingCustomerIDCount
FROM OnlineRetail
WHERE CustomerID IS NULL OR CustomerID = '';
GO
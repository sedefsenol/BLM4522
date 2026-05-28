USE BankSecurityDB;
GO

SELECT COUNT(*) AS StagingRecordCount
FROM Customers_Staging;
GO

SELECT COUNT(*) AS CleanRecordCount
FROM Customers;
GO

SELECT TOP 10 *
FROM Customers;
GO

SELECT Card_Category, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY Card_Category
ORDER BY CustomerCount DESC;
GO

SELECT Attrition_Flag, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY Attrition_Flag;
GO
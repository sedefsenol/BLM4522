
USE BankSecurityDB;
GO


EXECUTE AS USER = 'BankEmployeeUser';
GO

SELECT TOP 5 *
FROM Customers;
GO


UPDATE Customers
SET Customer_Age = Customer_Age + 1
WHERE CustomerRowID = 1;
GO

DELETE FROM Customers
WHERE CustomerRowID = 1;
GO

SELECT TOP 5 *
FROM CustomerSensitiveInfo;
GO

REVERT;
GO


EXECUTE AS USER = 'AuditorUser';
GO

SELECT TOP 5 *
FROM Customers;
GO

UPDATE Customers
SET Customer_Age = Customer_Age + 1
WHERE CustomerRowID = 2;
GO

REVERT;
GO
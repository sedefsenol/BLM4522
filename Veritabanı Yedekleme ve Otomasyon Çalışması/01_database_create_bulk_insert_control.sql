USE master;
GO

IF DB_ID('OnlineRetailBackupDB') IS NOT NULL
BEGIN
    ALTER DATABASE OnlineRetailBackupDB
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE OnlineRetailBackupDB;
END
GO

CREATE DATABASE OnlineRetailBackupDB;
GO

USE OnlineRetailBackupDB;
GO

CREATE TABLE dbo.OnlineRetail (
    InvoiceNo NVARCHAR(100),
    StockCode NVARCHAR(100),
    Description NVARCHAR(500),
    Quantity NVARCHAR(50),
    InvoiceDate NVARCHAR(100),
    UnitPrice NVARCHAR(50),
    CustomerID NVARCHAR(100),
    Country NVARCHAR(200)
);
GO

BULK INSERT dbo.OnlineRetail
FROM "C:\Users\SEDEF\Desktop\DBS\BLM4522\Veritabanı Yedekleme ve Otomasyon Çalışması\Online Retail.csv"
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    TABLOCK
);
GO

SELECT TOP 10 *
FROM dbo.OnlineRetail;
GO

SELECT COUNT(*) AS TotalRecordCount
FROM dbo.OnlineRetail;
GO

SELECT Country, COUNT(*) AS OrderCount
FROM dbo.OnlineRetail
GROUP BY Country
ORDER BY OrderCount DESC;
GO

USE PerformanceDB;
GO

CREATE TABLE OnlineRetail_Staging (
    InvoiceNo NVARCHAR(100),
    StockCode NVARCHAR(100),
    Description NVARCHAR(500),
    Quantity NVARCHAR(100),
    InvoiceDate NVARCHAR(100),
    UnitPrice NVARCHAR(100),
    CustomerID NVARCHAR(100),
    Country NVARCHAR(200)
);
GO

CREATE TABLE OnlineRetail (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    InvoiceNo NVARCHAR(50),
    StockCode NVARCHAR(50),
    Description NVARCHAR(500),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID NVARCHAR(50),
    Country NVARCHAR(100)
);
GO
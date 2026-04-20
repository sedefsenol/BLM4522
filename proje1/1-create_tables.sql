USE BLM4522;
GO

CREATE TABLE RawOrders (
    RawOrderID INT IDENTITY(1,1) PRIMARY KEY,
    OrderNo NVARCHAR(50),
    CustomerName NVARCHAR(150),
    Email NVARCHAR(150),
    ProductCode NVARCHAR(50),
    ProductName NVARCHAR(150),
    Quantity NVARCHAR(20),
    UnitPrice NVARCHAR(30),
    OrderDate NVARCHAR(30),
    City NVARCHAR(100),
    SourceSystem NVARCHAR(50),
    LoadDate DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE StgOrders (
    StgOrderID INT IDENTITY(1,1) PRIMARY KEY,
    RawOrderID INT,
    OrderNo NVARCHAR(50),
    CustomerName NVARCHAR(150),
    Email NVARCHAR(150),
    ProductCode NVARCHAR(50),
    ProductName NVARCHAR(150),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    OrderDate DATE,
    City NVARCHAR(100),
    SourceSystem NVARCHAR(50),
    TotalAmount DECIMAL(12,2),
    IsValid BIT DEFAULT 1,
    ErrorMessage NVARCHAR(500),
    ProcessDate DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE FactOrders (
    FactOrderID INT IDENTITY(1,1) PRIMARY KEY,
    OrderNo NVARCHAR(50) UNIQUE,
    CustomerName NVARCHAR(150),
    Email NVARCHAR(150),
    ProductCode NVARCHAR(50),
    ProductName NVARCHAR(150),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    TotalAmount DECIMAL(12,2),
    OrderDate DATE,
    City NVARCHAR(100),
    SourceSystem NVARCHAR(50),
    InsertDate DATETIME DEFAULT GETDATE(),
    UpdateDate DATETIME
);
GO

CREATE TABLE DataQualityLog_Orders (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    RawOrderID INT,
    ColumnName NVARCHAR(100),
    ErrorType NVARCHAR(100),
    ErrorDetail NVARCHAR(500),
    LogDate DATETIME DEFAULT GETDATE()
);
GO
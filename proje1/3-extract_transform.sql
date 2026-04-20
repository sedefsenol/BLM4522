USE BLM4522;
GO

INSERT INTO StgOrders
(
    RawOrderID,
    OrderNo,
    CustomerName,
    Email,
    ProductCode,
    ProductName,
    Quantity,
    UnitPrice,
    OrderDate,
    City,
    SourceSystem,
    TotalAmount
)
SELECT
    RawOrderID,
    UPPER(LTRIM(RTRIM(OrderNo))) AS OrderNo,
    LTRIM(RTRIM(CustomerName)) AS CustomerName,
    LOWER(LTRIM(RTRIM(Email))) AS Email,
    UPPER(LTRIM(RTRIM(ProductCode))) AS ProductCode,
    LTRIM(RTRIM(ProductName)) AS ProductName,
    TRY_CONVERT(INT, Quantity) AS Quantity,
    TRY_CONVERT(DECIMAL(10,2), UnitPrice) AS UnitPrice,
    TRY_CONVERT(DATE, OrderDate, 104) AS OrderDate,
    UPPER(LTRIM(RTRIM(City))) AS City,
    UPPER(LTRIM(RTRIM(SourceSystem))) AS SourceSystem,
    TRY_CONVERT(INT, Quantity) * TRY_CONVERT(DECIMAL(10,2), UnitPrice) AS TotalAmount
FROM RawOrders;
GO

SELECT * 
FROM StgOrders;
GO
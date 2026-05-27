USE PerformanceDB;
GO

INSERT INTO OnlineRetail (
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
)
SELECT
    InvoiceNo,
    StockCode,
    Description,
    TRY_CONVERT(INT, Quantity),
    TRY_CONVERT(DATETIME, InvoiceDate),
    TRY_CONVERT(DECIMAL(10,2), UnitPrice),
    CustomerID,
    Country
FROM OnlineRetail_Staging
WHERE TRY_CONVERT(INT, Quantity) IS NOT NULL
  AND TRY_CONVERT(DECIMAL(10,2), UnitPrice) IS NOT NULL;
GO
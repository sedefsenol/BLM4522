USE BLM4522;
GO

INSERT INTO DataQualityLog_Orders (RawOrderID, ColumnName, ErrorType, ErrorDetail)
SELECT RawOrderID, 'CustomerName', 'Missing Data', 'CustomerName boş'
FROM StgOrders
WHERE ErrorMessage LIKE '%CustomerName boş%';

INSERT INTO DataQualityLog_Orders (RawOrderID, ColumnName, ErrorType, ErrorDetail)
SELECT RawOrderID, 'Email', 'Invalid Format', 'Geçersiz email formatı'
FROM StgOrders
WHERE ErrorMessage LIKE '%Geçersiz email formatı%';

INSERT INTO DataQualityLog_Orders (RawOrderID, ColumnName, ErrorType, ErrorDetail)
SELECT RawOrderID, 'ProductCode', 'Missing Data', 'ProductCode eksik'
FROM StgOrders
WHERE ErrorMessage LIKE '%ProductCode eksik%';

INSERT INTO DataQualityLog_Orders (RawOrderID, ColumnName, ErrorType, ErrorDetail)
SELECT RawOrderID, 'Quantity', 'Invalid Data', 'Quantity değeri hatalı'
FROM StgOrders
WHERE ErrorMessage LIKE '%Quantity değeri hatalı%';

INSERT INTO DataQualityLog_Orders (RawOrderID, ColumnName, ErrorType, ErrorDetail)
SELECT RawOrderID, 'UnitPrice', 'Invalid Data', 'UnitPrice değeri hatalı'
FROM StgOrders
WHERE ErrorMessage LIKE '%UnitPrice değeri hatalı%';

INSERT INTO DataQualityLog_Orders (RawOrderID, ColumnName, ErrorType, ErrorDetail)
SELECT RawOrderID, 'OrderDate', 'Invalid Format', 'OrderDate formatı geçersiz'
FROM StgOrders
WHERE ErrorMessage LIKE '%OrderDate formatı geçersiz%';

INSERT INTO DataQualityLog_Orders (RawOrderID, ColumnName, ErrorType, ErrorDetail)
SELECT RawOrderID, 'OrderNo', 'Duplicate', 'Duplicate OrderNo'
FROM StgOrders
WHERE ErrorMessage LIKE '%Duplicate OrderNo%';
GO

INSERT INTO FactOrders
(
    OrderNo, CustomerName, Email, ProductCode, ProductName,
    Quantity, UnitPrice, TotalAmount, OrderDate, City, SourceSystem
)
SELECT
    s.OrderNo, s.CustomerName, s.Email, s.ProductCode, s.ProductName,
    s.Quantity, s.UnitPrice, s.TotalAmount, s.OrderDate, s.City, s.SourceSystem
FROM StgOrders s
WHERE s.IsValid = 1
  AND NOT EXISTS
  (
      SELECT 1
      FROM FactOrders f
      WHERE f.OrderNo = s.OrderNo
  );
GO

SELECT * FROM DataQualityLog_Orders;
SELECT * FROM FactOrders;
GO
USE BLM4522;
GO

UPDATE StgOrders
SET
    IsValid = 0,
    ErrorMessage = COALESCE(ErrorMessage + '; ', '') + 'CustomerName boş'
WHERE CustomerName IS NULL OR CustomerName = '';
GO

UPDATE StgOrders
SET
    IsValid = 0,
    ErrorMessage = COALESCE(ErrorMessage + '; ', '') + 'Geçersiz email formatı'
WHERE Email IS NULL
   OR Email NOT LIKE '%_@_%._%';
GO

UPDATE StgOrders
SET
    IsValid = 0,
    ErrorMessage = COALESCE(ErrorMessage + '; ', '') + 'ProductCode eksik'
WHERE ProductCode IS NULL OR ProductCode = '';
GO

UPDATE StgOrders
SET
    IsValid = 0,
    ErrorMessage = COALESCE(ErrorMessage + '; ', '') + 'Quantity değeri hatalı'
WHERE Quantity IS NULL OR Quantity <= 0;
GO

UPDATE StgOrders
SET
    IsValid = 0,
    ErrorMessage = COALESCE(ErrorMessage + '; ', '') + 'UnitPrice değeri hatalı'
WHERE UnitPrice IS NULL OR UnitPrice <= 0;
GO

UPDATE StgOrders
SET
    IsValid = 0,
    ErrorMessage = COALESCE(ErrorMessage + '; ', '') + 'OrderDate formatı geçersiz'
WHERE OrderDate IS NULL;
GO

;WITH DuplicateCTE AS
(
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY OrderNo ORDER BY StgOrderID) AS rn
    FROM StgOrders
    WHERE OrderNo IS NOT NULL
)
UPDATE DuplicateCTE
SET
    IsValid = 0,
    ErrorMessage = COALESCE(ErrorMessage + '; ', '') + 'Duplicate OrderNo'
WHERE rn > 1;
GO

SELECT * FROM StgOrders;
GO
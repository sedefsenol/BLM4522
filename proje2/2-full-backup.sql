USE BLM4522;
GO

IF OBJECT_ID('dbo.BackupTestTable', 'U') IS NOT NULL
    DROP TABLE dbo.BackupTestTable;
GO

CREATE TABLE dbo.BackupTestTable
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100),
    OperationType NVARCHAR(50),
    Amount DECIMAL(10,2),
    CreatedDate DATETIME DEFAULT GETDATE()
);
GO

INSERT INTO dbo.BackupTestTable (CustomerName, OperationType, Amount)
VALUES 
('Ali Yılmaz', 'Purchase', 1250.50),
('Ayşe Demir', 'Purchase', 890.00),
('Mehmet Kaya', 'Refund', 300.00);
GO

SELECT * FROM dbo.BackupTestTable;
GO

USE master;
GO

BACKUP DATABASE BLM4522
TO DISK = 'C:\Backup\BLM4522_full.bak'
WITH FORMAT, INIT, STATS = 10;
GO
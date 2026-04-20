USE [4522];
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
('Ali Yılmaz', 'Purchase', 500),
('Ayşe Demir', 'Refund', 120),
('Mehmet Kaya', 'Purchase', 850);
GO

SELECT * FROM dbo.BackupTestTable;
GO

USE master;
GO

BACKUP DATABASE [4522]
TO DISK = 'C:\Backup\4522_full.bak'
WITH INIT, FORMAT, STATS = 10;
GO

RESTORE VERIFYONLY
FROM DISK = 'C:\Backup\4522_full.bak';
GO
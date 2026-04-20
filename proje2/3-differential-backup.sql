USE BLM4522;
GO

INSERT INTO dbo.BackupTestTable (CustomerName, OperationType, Amount)
VALUES 
('Zeynep Arslan', 'Purchase', 2100.00),
('Can Kaya', 'Refund', 450.00);
GO

SELECT * 
FROM dbo.BackupTestTable;
GO

USE master;
GO

BACKUP DATABASE BLM4522
TO DISK = 'C:\Backup\BLM4522_diff.bak'
WITH DIFFERENTIAL, INIT, STATS = 10;
GO
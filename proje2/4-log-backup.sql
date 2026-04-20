USE BLM4522;
GO

INSERT INTO dbo.BackupTestTable (CustomerName, OperationType, Amount)
VALUES 
('Elif Koç', 'Purchase', 1750.00);
GO

SELECT * 
FROM dbo.BackupTestTable;
GO

USE master;
GO

BACKUP LOG BLM4522
TO DISK = 'C:\Backup\BLM4522_log_1.trn'
WITH INIT, STATS = 10;
GO
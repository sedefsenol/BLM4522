USE [4522];
GO

SELECT SYSDATETIME() AS PointInTime;
GO

WAITFOR DELAY '00:00:05';
GO

INSERT INTO dbo.BackupTestTable (CustomerName, OperationType, Amount)
VALUES ('Elif Koç', 'Purchase', 1750);
GO

SELECT * FROM dbo.BackupTestTable;
GO

USE master;
GO

BACKUP LOG [4522]
TO DISK = 'C:\Backup\4522_log.trn'
WITH INIT, STATS = 10;
GO

RESTORE VERIFYONLY
FROM DISK = 'C:\Backup\4522_log.trn';
GO
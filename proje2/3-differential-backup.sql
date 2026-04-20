USE [4522];
GO

INSERT INTO dbo.BackupTestTable (CustomerName, OperationType, Amount)
VALUES
('Zeynep Arslan', 'Purchase', 920),
('Can Özkan', 'Refund', 75);
GO

SELECT * FROM dbo.BackupTestTable;
GO

USE master;
GO

BACKUP DATABASE [4522]
TO DISK = 'C:\Backup\4522_diff.bak'
WITH DIFFERENTIAL, INIT, STATS = 10;
GO

RESTORE VERIFYONLY
FROM DISK = 'C:\Backup\4522_diff.bak';
GO
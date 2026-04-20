USE master;

GO

RESTORE LOG [4522]


FROM DISK = 'C:\Backup\4522_log.trn'


WITH 
    STOPAT = '2026-04-20 23:48:12',
    RECOVERY,
    STATS = 10;
    

GO

USE [4522];


GO

SELECT * 
FROM dbo.BackupTestTable
ORDER BY Id;


GO
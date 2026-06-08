
USE master;
GO

BACKUP DATABASE OnlineRetailBackupDB
TO DISK = 'C:\SQLBackups\OnlineRetailBackupDB_FULL.bak'
WITH FORMAT,
     INIT,
     NAME = 'Full Backup of OnlineRetailBackupDB',
     STATS = 10;
GO
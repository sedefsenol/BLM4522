

BACKUP DATABASE OnlineRetailBackupDB
TO DISK = 'C:\WrongFolder\OnlineRetailBackupDB_ERROR.bak'
WITH INIT,
     NAME = 'Failed Backup Test',
     STATS = 10;
GO
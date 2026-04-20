USE master;
GO

RESTORE DATABASE [4522]
FROM DISK = 'C:\Backup\4522_full.bak'
WITH 
    MOVE '4522' TO 'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER01\MSSQL\DATA\4522.mdf',
    MOVE '4522_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER01\MSSQL\DATA\4522_log.ldf',
    NORECOVERY,
    REPLACE,
    STATS = 10;
GO
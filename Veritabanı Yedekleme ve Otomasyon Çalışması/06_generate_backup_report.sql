USE OnlineRetailBackupDB;
GO

INSERT INTO dbo.BackupReport (
    DatabaseName,
    LastBackupDate,
    HoursSinceLastBackup,
    BackupStatus
)
SELECT
    'OnlineRetailBackupDB',
    MAX(backup_finish_date),
    DATEDIFF(HOUR, MAX(backup_finish_date), GETDATE()),
    CASE
        WHEN MAX(backup_finish_date) >= DATEADD(DAY,-1,GETDATE())
        THEN 'Successful'
        ELSE 'Warning'
    END
FROM msdb.dbo.backupset
WHERE database_name = 'OnlineRetailBackupDB';
GO

SELECT *
FROM dbo.BackupReport
ORDER BY ReportDate DESC;
GO
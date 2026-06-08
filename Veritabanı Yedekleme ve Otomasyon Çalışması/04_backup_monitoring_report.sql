
SELECT
    database_name AS DatabaseName,
    MAX(backup_finish_date) AS LastBackupDate,
    DATEDIFF(HOUR,
             MAX(backup_finish_date),
             GETDATE()) AS HoursSinceLastBackup
FROM msdb.dbo.backupset
WHERE database_name = 'OnlineRetailBackupDB'
GROUP BY database_name;
GO
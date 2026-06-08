

SELECT
    bs.database_name AS DatabaseName,
    bs.backup_start_date AS BackupStartDate,
    bs.backup_finish_date AS BackupFinishDate,

    CASE bs.type
        WHEN 'D' THEN 'Full Backup'
        WHEN 'I' THEN 'Differential Backup'
        WHEN 'L' THEN 'Transaction Log Backup'
    END AS BackupType,

    bmf.physical_device_name AS BackupFilePath

FROM msdb.dbo.backupset bs
INNER JOIN msdb.dbo.backupmediafamily bmf
ON bs.media_set_id = bmf.media_set_id

WHERE bs.database_name = 'OnlineRetailBackupDB'

ORDER BY bs.backup_finish_date DESC;
GO
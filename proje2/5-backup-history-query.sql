USE msdb;
GO

SELECT
    bs.database_name,
    bs.backup_start_date,
    bs.backup_finish_date,
    CASE bs.type
        WHEN 'D' THEN 'Full Backup'
        WHEN 'I' THEN 'Differential Backup'
        WHEN 'L' THEN 'Log Backup'
    END AS backup_type,
    bmf.physical_device_name
FROM msdb.dbo.backupset bs
JOIN msdb.dbo.backupmediafamily bmf
    ON bs.media_set_id = bmf.media_set_id
WHERE bs.database_name = 'BLM4522'
ORDER BY bs.backup_finish_date DESC;
GO
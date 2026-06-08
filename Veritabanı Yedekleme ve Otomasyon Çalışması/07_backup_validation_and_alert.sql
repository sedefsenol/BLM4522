

IF NOT EXISTS (
    SELECT 1
    FROM msdb.dbo.backupset
    WHERE database_name = 'OnlineRetailBackupDB'
      AND backup_finish_date >= DATEADD(DAY, -1, GETDATE())
)
BEGIN
    PRINT 'UYARI: Son 24 saat içinde yedek alınmamış!';
END
ELSE
BEGIN
    PRINT 'Yedekleme kontrolü başarılı: Son 24 saat içinde yedek alınmış.';
END
GO
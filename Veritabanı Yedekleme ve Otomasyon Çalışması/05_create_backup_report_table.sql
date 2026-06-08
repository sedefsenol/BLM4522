USE OnlineRetailBackupDB;
GO

CREATE TABLE dbo.BackupReport (
    ReportID INT IDENTITY(1,1) PRIMARY KEY,
    DatabaseName NVARCHAR(100),
    LastBackupDate DATETIME,
    HoursSinceLastBackup INT,
    BackupStatus NVARCHAR(50),
    ReportDate DATETIME DEFAULT GETDATE()
);
GO
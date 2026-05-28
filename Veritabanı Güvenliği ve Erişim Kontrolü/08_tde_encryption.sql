
USE master;
GO


IF NOT EXISTS (
    SELECT * 
    FROM sys.symmetric_keys
    WHERE symmetric_key_id = 101
)
BEGIN
    CREATE MASTER KEY
    ENCRYPTION BY PASSWORD = 'StrongMasterKeyPassword123!';
END
GO



IF NOT EXISTS (
    SELECT *
    FROM sys.certificates
    WHERE name = 'BankSecurityCertificate'
)
BEGIN
    CREATE CERTIFICATE BankSecurityCertificate
    WITH SUBJECT = 'Certificate for BankSecurityDB TDE';
END
GO

USE BankSecurityDB;
GO


IF NOT EXISTS (
    SELECT *
    FROM sys.dm_database_encryption_keys
    WHERE database_id = DB_ID('BankSecurityDB')
)
BEGIN
    CREATE DATABASE ENCRYPTION KEY
    WITH ALGORITHM = AES_256
    ENCRYPTION BY SERVER CERTIFICATE BankSecurityCertificate;
END
GO



ALTER DATABASE BankSecurityDB
SET ENCRYPTION ON;
GO

SELECT
    DB_NAME(database_id) AS DatabaseName,
    encryption_state,
    key_algorithm,
    key_length
FROM sys.dm_database_encryption_keys;
GO
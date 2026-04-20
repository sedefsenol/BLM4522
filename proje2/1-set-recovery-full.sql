USE master;
GO

ALTER DATABASE BLM4522
SET RECOVERY FULL;
GO

SELECT name, recovery_model_desc
FROM sys.databases
WHERE name = 'BLM4522';
GO
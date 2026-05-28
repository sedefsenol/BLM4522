USE master;
GO

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'BankEmployeeLogin')
    CREATE LOGIN BankEmployeeLogin WITH PASSWORD = 'BankEmployee123!';
GO

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'AuditorLogin')
    CREATE LOGIN AuditorLogin WITH PASSWORD = 'Auditor123!';
GO

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'SecurityOfficerLogin')
    CREATE LOGIN SecurityOfficerLogin WITH PASSWORD = 'SecurityOfficer123!';
GO

USE BankSecurityDB;
GO



IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'AdminRole')
    CREATE ROLE AdminRole;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'BankEmployeeRole')
    CREATE ROLE BankEmployeeRole;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'AuditorRole')
    CREATE ROLE AuditorRole;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'BankEmployeeUser')
    CREATE USER BankEmployeeUser FOR LOGIN BankEmployeeLogin;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'AuditorUser')
    CREATE USER AuditorUser FOR LOGIN AuditorLogin;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'SecurityOfficerUser')
    CREATE USER SecurityOfficerUser FOR LOGIN SecurityOfficerLogin;
GO




ALTER ROLE BankEmployeeRole ADD MEMBER BankEmployeeUser;
GO

ALTER ROLE AuditorRole ADD MEMBER AuditorUser;
GO

ALTER ROLE AdminRole ADD MEMBER SecurityOfficerUser;
GO



GRANT SELECT, UPDATE ON Customers TO BankEmployeeRole;
DENY DELETE ON Customers TO BankEmployeeRole;
GO

GRANT SELECT ON Customers TO AuditorRole;
DENY INSERT, UPDATE, DELETE ON Customers TO AuditorRole;
GO

DENY SELECT ON CustomerSensitiveInfo TO BankEmployeeRole;
DENY SELECT ON CustomerSensitiveInfo TO AuditorRole;
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON Customers TO AdminRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON CustomerSensitiveInfo TO AdminRole;
GO

SELECT 
    SYSTEM_USER AS WindowsAuthenticationLogin,
    USER_NAME() AS CurrentDatabaseUser;
GO

SELECT 
    dp.name AS UserName,
    rp.name AS RoleName
FROM sys.database_role_members drm
JOIN sys.database_principals rp 
    ON drm.role_principal_id = rp.principal_id
JOIN sys.database_principals dp 
    ON drm.member_principal_id = dp.principal_id
ORDER BY RoleName;
GO

SELECT 
    USER_NAME(grantee_principal_id) AS RoleName,
    permission_name,
    state_desc,
    OBJECT_NAME(major_id) AS TableName
FROM sys.database_permissions
WHERE OBJECT_NAME(major_id) IN ('Customers', 'CustomerSensitiveInfo')
ORDER BY RoleName, TableName, permission_name;
GO
USE master;
GO

IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'readonly_user')
    DROP LOGIN readonly_user;
GO

IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'admin_user')
    DROP LOGIN admin_user;
GO

USE PerformanceDB;
GO

IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'readonly_user')
    DROP USER readonly_user;
GO

IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'admin_user')
    DROP USER admin_user;
GO


CREATE LOGIN readonly_user
WITH PASSWORD = 'ReadOnly123!';
GO

CREATE USER readonly_user
FOR LOGIN readonly_user;
GO

ALTER ROLE db_datareader
ADD MEMBER readonly_user;
GO

CREATE LOGIN admin_user
WITH PASSWORD = 'Admin123!';
GO

CREATE USER admin_user
FOR LOGIN admin_user;
GO

ALTER ROLE db_owner
ADD MEMBER admin_user;
GO

SELECT
    dp1.name AS DatabaseRoleName,
    dp2.name AS DatabaseUserName
FROM sys.database_role_members drm
JOIN sys.database_principals dp1
    ON drm.role_principal_id = dp1.principal_id
JOIN sys.database_principals dp2
    ON drm.member_principal_id = dp2.principal_id
ORDER BY DatabaseRoleName;
GO
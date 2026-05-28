
USE master;
GO

SELECT 
    SYSTEM_USER AS WindowsAuthenticationLogin,
    USER_NAME() AS CurrentDatabaseUser;
GO



IF EXISTS (SELECT * FROM sys.server_audits WHERE name = 'BankSecurityAudit')
BEGIN
    ALTER SERVER AUDIT BankSecurityAudit
    WITH (STATE = OFF);
END
GO

IF NOT EXISTS (SELECT * FROM sys.server_audits WHERE name = 'BankSecurityAudit')
BEGIN
    CREATE SERVER AUDIT BankSecurityAudit
    TO FILE (
        FILEPATH = 'C:\SQLAudit\'
    );
END
GO

ALTER SERVER AUDIT BankSecurityAudit
WITH (STATE = ON);
GO



USE BankSecurityDB;
GO

IF NOT EXISTS (
    SELECT * 
    FROM sys.database_audit_specifications
    WHERE name = 'BankSecurityDatabaseAudit'
)
BEGIN
    CREATE DATABASE AUDIT SPECIFICATION BankSecurityDatabaseAudit
    FOR SERVER AUDIT BankSecurityAudit
    ADD (SELECT ON dbo.Customers BY public),
    ADD (UPDATE ON dbo.Customers BY public),
    ADD (DELETE ON dbo.Customers BY public)
    WITH (STATE = ON);
END
GO

SELECT 
    name,
    is_state_enabled
FROM sys.database_audit_specifications;
GO
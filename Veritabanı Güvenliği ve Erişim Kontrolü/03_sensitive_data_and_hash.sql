USE BankSecurityDB;
GO

CREATE TABLE CustomerSensitiveInfo (
    SensitiveInfoID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerRowID INT,
    CLIENTNUM BIGINT,
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    CardNumber NVARCHAR(30),
    PasswordHash NVARCHAR(200)
);
GO

INSERT INTO CustomerSensitiveInfo
(
    CustomerRowID,
    CLIENTNUM,
    Email,
    Phone,
    CardNumber,
    PasswordHash
)
SELECT TOP 100
    CustomerRowID,
    CLIENTNUM,
    CONCAT('customer', CustomerRowID, '@bank.com'),
    CONCAT('0555', RIGHT(CLIENTNUM, 7)),
    CONCAT('4532-9876-', RIGHT(CLIENTNUM, 4), '-0000'),
    CONVERT(NVARCHAR(200),
        HASHBYTES(
            'SHA2_256',
            CONCAT(CLIENTNUM, 'BankPass123')
        ), 2)
FROM Customers;
GO

SELECT TOP 10 *
FROM CustomerSensitiveInfo;
GO
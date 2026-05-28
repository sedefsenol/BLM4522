USE BankSecurityDB;
GO


SELECT *
FROM Customers
WHERE CLIENTNUM = 768805383
   OR 1 = 1;
GO

CREATE PROCEDURE GetCustomerByClientNum
    @ClientNum BIGINT
AS
BEGIN
    SELECT
        CustomerRowID,
        CLIENTNUM,
        Attrition_Flag,
        Customer_Age,
        Gender,
        Income_Category,
        Card_Category
    FROM Customers
    WHERE CLIENTNUM = @ClientNum;
END;
GO

EXEC GetCustomerByClientNum
    @ClientNum = 768805383;
GO
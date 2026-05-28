
CREATE DATABASE BankSecurityDB;
GO

USE BankSecurityDB;
GO

CREATE TABLE Customers_Staging (
    CLIENTNUM BIGINT,
    Attrition_Flag NVARCHAR(50),
    Customer_Age INT,
    Gender NVARCHAR(10),
    Dependent_count INT,
    Education_Level NVARCHAR(50),
    Marital_Status NVARCHAR(50),
    Income_Category NVARCHAR(50),
    Card_Category NVARCHAR(50),
    Months_on_book INT,
    Total_Relationship_Count INT,
    Months_Inactive_12_mon INT,
    Contacts_Count_12_mon INT,
    Credit_Limit FLOAT,
    Total_Revolving_Bal INT,
    Avg_Open_To_Buy FLOAT,
    Total_Amt_Chng_Q4_Q1 FLOAT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Total_Ct_Chng_Q4_Q1 FLOAT,
    Avg_Utilization_Ratio FLOAT,
    Naive_Bayes_1 FLOAT,
    Naive_Bayes_2 FLOAT
);
GO

CREATE TABLE Customers (
    CustomerRowID INT IDENTITY(1,1) PRIMARY KEY,
    CLIENTNUM BIGINT,
    Attrition_Flag NVARCHAR(50),
    Customer_Age INT,
    Gender NVARCHAR(10),
    Dependent_count INT,
    Education_Level NVARCHAR(50),
    Marital_Status NVARCHAR(50),
    Income_Category NVARCHAR(50),
    Card_Category NVARCHAR(50),
    Months_on_book INT,
    Total_Relationship_Count INT,
    Months_Inactive_12_mon INT,
    Contacts_Count_12_mon INT,
    Credit_Limit FLOAT,
    Total_Revolving_Bal INT,
    Avg_Open_To_Buy FLOAT,
    Total_Amt_Chng_Q4_Q1 FLOAT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Total_Ct_Chng_Q4_Q1 FLOAT,
    Avg_Utilization_Ratio FLOAT
);
GO

BULK INSERT Customers_Staging
FROM "C:\Users\SEDEF\Desktop\DBS\BLM4522\Veritabanı Güvenliği ve Erişim Kontrolü\BankChurners.csv"
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

INSERT INTO Customers (
    CLIENTNUM,
    Attrition_Flag,
    Customer_Age,
    Gender,
    Dependent_count,
    Education_Level,
    Marital_Status,
    Income_Category,
    Card_Category,
    Months_on_book,
    Total_Relationship_Count,
    Months_Inactive_12_mon,
    Contacts_Count_12_mon,
    Credit_Limit,
    Total_Revolving_Bal,
    Avg_Open_To_Buy,
    Total_Amt_Chng_Q4_Q1,
    Total_Trans_Amt,
    Total_Trans_Ct,
    Total_Ct_Chng_Q4_Q1,
    Avg_Utilization_Ratio
)
SELECT
    CLIENTNUM,
    Attrition_Flag,
    Customer_Age,
    Gender,
    Dependent_count,
    Education_Level,
    Marital_Status,
    Income_Category,
    Card_Category,
    Months_on_book,
    Total_Relationship_Count,
    Months_Inactive_12_mon,
    Contacts_Count_12_mon,
    Credit_Limit,
    Total_Revolving_Bal,
    Avg_Open_To_Buy,
    Total_Amt_Chng_Q4_Q1,
    Total_Trans_Amt,
    Total_Trans_Ct,
    Total_Ct_Chng_Q4_Q1,
    Avg_Utilization_Ratio
FROM Customers_Staging;
GO
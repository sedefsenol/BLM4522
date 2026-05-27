
USE PerformanceDB;
GO

BULK INSERT OnlineRetail_Staging
FROM "C:\Users\SEDEF\Desktop\DBS\BLM4522\Veritabanı Performans Optimizasyonu ve İzleme\OnlineRetail.csv"
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    TABLOCK,
    MAXERRORS = 100000
);
GO
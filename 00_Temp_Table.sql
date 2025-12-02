CREATE TABLE SalesTemp (
    Store NVARCHAR(10),
    Date_ NVARCHAR(20),
    Weekly_Sales NVARCHAR(20),
    Holiday_Flag NVARCHAR(5),
    Temperature NVARCHAR(20),
    Fuel_Price NVARCHAR(20),
    CPI NVARCHAR(20),
    Unemployment NVARCHAR(20)
);

BULK INSERT SalesTemp
FROM 'C:\Temp\Walmart_Sales.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- Temizleyip asýl tabloya aktar
INSERT INTO Sales (Store, Dept, Date, Weekly_Sales, Holiday_Flag, Temperature, Fuel_Price, CPI, Unemployment)
SELECT
    CAST(Store AS INT),
    CAST(Dept AS INT),
    TRY_CONVERT(DATE, Date, 105), -- 105 = DD-MM-YYYY
    CAST(Weekly_Sales AS DECIMAL(18,2)),
    CAST(Holiday_Flag AS BIT),
    CAST(Temperature AS DECIMAL(5,2)),
    CAST(Fuel_Price AS DECIMAL(5,3)),
    CAST(CPI AS DECIMAL(10,7)),
    CAST(Unemployment AS DECIMAL(5,2))
FROM SalesTemp
WHERE TRY_CONVERT(DATE, Date, 105) IS NOT NULL;

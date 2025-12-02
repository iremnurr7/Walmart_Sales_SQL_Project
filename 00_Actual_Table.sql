CREATE TABLE Sales (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Store INT,
    Date_ DATE,
    Weekly_Sales DECIMAL(18,2),
    Holiday_Flag BIT,
    Temperature DECIMAL(5,2),
    Fuel_Price DECIMAL(5,3),
    CPI DECIMAL(10,7),
    Unemployment DECIMAL(5,2)
);

INSERT INTO Sales (Store, [Date_], Weekly_Sales, Holiday_Flag, Temperature, Fuel_Price, CPI, Unemployment)
SELECT
    CAST(Store AS INT),
    TRY_CONVERT(DATE, [Date_], 105),
    CAST([Weekly_Sales] AS DECIMAL(18,2)),
    CAST(Holiday_Flag AS BIT),
    CAST(Temperature AS DECIMAL(5,2)),
    CAST(Fuel_Price AS DECIMAL(5,3)),
    CAST(CPI AS DECIMAL(10,7)),
    CAST(Unemployment AS DECIMAL(5,2))
FROM SalesTemp
WHERE TRY_CONVERT(DATE, [Date_], 105) IS NOT NULL;
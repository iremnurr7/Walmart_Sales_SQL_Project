-- Tabloyu ve kolonlarý incele
SELECT TOP 10 * FROM Sales;

-- Satýr sayýsý
SELECT COUNT(*) AS TotalRows FROM Sales;

-- NULL deðer kontrolü
SELECT 
    SUM(CASE WHEN Weekly_Sales IS NULL THEN 1 ELSE 0 END) AS MissingWeeklySales,
    SUM(CASE WHEN [Date_] IS NULL THEN 1 ELSE 0 END) AS MissingDates
FROM Sales;






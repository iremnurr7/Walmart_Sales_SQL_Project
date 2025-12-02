-- Haftalýk satýþlarýn temel istatistikleri
SELECT 
    MIN(Weekly_Sales) AS MinSales,
    MAX(Weekly_Sales) AS MaxSales,
    AVG(Weekly_Sales) AS AvgSales,
    SUM(Weekly_Sales) AS TotalSales
FROM Sales;

-- Tatil haftalarýnda toplam satýþ
SELECT Holiday_Flag, SUM(Weekly_Sales) AS TotalSales
FROM Sales
GROUP BY Holiday_Flag;

-- 2010 yýlýndaki satýþlar
SELECT SUM(Weekly_Sales) AS Sales2010
FROM Sales
WHERE YEAR([Date_]) = 2010;

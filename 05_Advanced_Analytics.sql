-- Maðaza bazýnda kümülatif satýþ
SELECT 
    Store,
    [Date_],
    Weekly_Sales,
    SUM(Weekly_Sales) OVER (PARTITION BY Store ORDER BY [Date_]) AS CumulativeSales
FROM Sales;

-- Bir önceki haftaya göre satýþ farký
SELECT 
    Store,
    [Date_],
    Weekly_Sales,
    LAG(Weekly_Sales) OVER (PARTITION BY Store ORDER BY [Date_]) AS PreviousWeekSales,
    Weekly_Sales - LAG(Weekly_Sales) OVER (PARTITION BY Store ORDER BY [Date_]) AS WeeklyChange
FROM Sales;

-- Haftalýk satýþ kategorileri
SELECT 
    [Date_],
    Weekly_Sales,
    CASE 
        WHEN Weekly_Sales < 500000 THEN 'Low'
        WHEN Weekly_Sales BETWEEN 500000 AND 1500000 THEN 'Medium'
        ELSE 'High'
    END AS SalesCategory
FROM Sales;

-- Tatil haftalarýnýn ortalama satýþa etkisi
SELECT 
    Holiday_Flag,
    AVG(Weekly_Sales) AS AvgSales,
    COUNT(*) AS Weeks
FROM Sales
GROUP BY Holiday_Flag;

-- Her maðaza için en yüksek 3 haftalýk satýþ
SELECT *
FROM (
    SELECT Store, [Date_], Weekly_Sales,
           RANK() OVER (PARTITION BY Store ORDER BY Weekly_Sales DESC) AS SalesRank
    FROM Sales
) t
WHERE SalesRank <= 3;

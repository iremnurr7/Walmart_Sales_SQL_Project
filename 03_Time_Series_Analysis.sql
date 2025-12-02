-- Aylýk toplam satýþlar
SELECT 
    YEAR([Date_]) AS SaleYear,
    MONTH([Date_]) AS SaleMonth,
    SUM(Weekly_Sales) AS MonthlySales
FROM Sales
GROUP BY YEAR([Date_]), MONTH([Date_])
ORDER BY SaleYear, SaleMonth;

-- Haftalýk ortalama satýþ trendi (3 haftalýk hareketli ortalama)
SELECT 
    [Date_],
    AVG(Weekly_Sales) OVER (ORDER BY [Date_] ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS MovingAvgSales
FROM Sales;

-- 4 haftalýk hareketli ortalama (opsiyonel tekrar)
SELECT 
    [Date_],
    AVG(Weekly_Sales) OVER (ORDER BY [Date_] ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS MovingAvg4Weeks
FROM Sales;

-- Yýllýk büyüme oraný (YoY)
SELECT 
    YEAR([Date_]) AS SaleYear,
    SUM(Weekly_Sales) AS TotalSales,
    LAG(SUM(Weekly_Sales)) OVER (ORDER BY YEAR([Date_])) AS PreviousYearSales,
    (SUM(Weekly_Sales) - LAG(SUM(Weekly_Sales)) OVER (ORDER BY YEAR([Date_]))) / 
    LAG(SUM(Weekly_Sales)) OVER (ORDER BY YEAR([Date_])) AS YoYGrowth
FROM Sales
GROUP BY YEAR([Date_]);

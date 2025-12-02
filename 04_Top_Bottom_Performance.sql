-- En yüksek satýþ yapan 5 hafta
SELECT TOP 5 [Date_], Weekly_Sales
FROM Sales
ORDER BY Weekly_Sales DESC;

-- En düþük 5 hafta
SELECT TOP 5 [Date_], Weekly_Sales
FROM Sales
ORDER BY Weekly_Sales ASC;

-- Ortalama satýþýn üstünde olan haftalar
SELECT *
FROM Sales
WHERE Weekly_Sales > (SELECT AVG(Weekly_Sales) FROM Sales);

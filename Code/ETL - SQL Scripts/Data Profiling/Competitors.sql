SELECT [No]
      ,[Brand]
      ,[City]
      ,[Year]
      ,[StoreCount]
  FROM [HighlandCoffee].[Bronze].[CompetitorDatabase]
  ORDER BY [No]

-- Check duplicates
SELECT [No], [Brand], [City], [Year], [StoreCount], COUNT(*) AS DuplicateCount
FROM [HighlandCoffee].[Bronze].[CompetitorDatabase]
GROUP BY [No], [Brand], [City], [Year], [StoreCount]
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;
-- No duplicates

-- Check Nulls 
SELECT 
    'No' AS ColumnName,
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN [No] IS NULL THEN 1 ELSE 0 END) AS NullCount,
    CAST(100.0 * SUM(CASE WHEN [No] IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS NullPercentage
FROM [HighlandCoffee].[Bronze].[CompetitorDatabase]
UNION ALL
SELECT 
    'Brand',
    COUNT(*),
    SUM(CASE WHEN [Brand] IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN [Brand] IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[CompetitorDatabase]
UNION ALL
SELECT 
    'City',
    COUNT(*),
    SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[CompetitorDatabase]
UNION ALL
SELECT 
    'Year',
    COUNT(*),
    SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[CompetitorDatabase]
UNION ALL
SELECT 
    'StoreCount',
    COUNT(*),
    SUM(CASE WHEN [StoreCount] IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN [StoreCount] IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[CompetitorDatabase];
-- No nulls 

-- The list Competitors
SELECT DISTINCT 
    Brand
FROM [HighlandCoffee].[Bronze].[CompetitorDatabase] WHERE Brand NOT LIKE 'High%'
-- Highland coffee have 5 direct competiors

-- Check BrandHealth and Competitors
SELECT DISTINCT  
    Brand 
FROM [HighlandCoffee].[Silver].[BrandHealth]
WHERE Brand NOT IN (SELECT DISTINCT 
    Brand
FROM [HighlandCoffee].[Bronze].[CompetitorDatabase])
-- There are coffee chains that not in the competitor database 

SELECT DISTINCT City
FROM [HighlandCoffee].[Bronze].[CompetitorDatabase]
-- There are provinces, and also foreign Cities => focus only on 6 major cities 



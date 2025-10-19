SELECT * FROM Bronze.Companion
GO

SELECT DISTINCT CompanionGroup FROM Bronze.Companion
GO

SELECT 
	COUNT(*),
	ID 
FROM Bronze.Companion
GROUP BY ID
HAVING ID NOT IN (SELECT ID FROM Bronze.SAVar)
-- ALl ID in Companion included in SAVar

-- Count nulls 
WITH null_statistic AS (
SELECT 
    'ID' AS ColumnName,
    SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) AS NullCount,
    CAST(100.0 * SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS NullPercent
FROM [HighlandCoffee].[Bronze].[Companion]

UNION ALL
SELECT 
    'Year',
    SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[Companion]

UNION ALL
SELECT 
    'City',
    SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[Companion]

UNION ALL
SELECT 
    'CompanionGroup',
    SUM(CASE WHEN CompanionGroup IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN CompanionGroup IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[Companion]
)
SELECT * FROM null_statistic ORDER BY NullPercent 
GO
-- No null values 
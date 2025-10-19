SELECT TOP (1000) [ID]
      ,[Year]
      ,[City]
      ,[Awareness]
      ,[Attribute]
      ,[BrandImage]
  FROM [HighlandCoffee].[Bronze].[BrandImage];


--Check nulls 
SELECT 
    'ID' AS ColumnName,
    SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) AS NullCount,
    CAST(100.0 * SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS NullPercent
FROM [HighlandCoffee].[Bronze].[BrandImage]

UNION ALL
SELECT 
    'Year',
    SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[BrandImage]

UNION ALL
SELECT 
    'City',
    SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[BrandImage]

UNION ALL
SELECT 
    'Awareness',
    SUM(CASE WHEN [Awareness] IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN [Awareness] IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[BrandImage]

UNION ALL
SELECT 
    'Attribute',
    SUM(CASE WHEN [Attribute] IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN [Attribute] IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[BrandImage]

UNION ALL
SELECT 
    'BrandImage',
    SUM(CASE WHEN [BrandImage] IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN [BrandImage] IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[BrandImage];
GO

--Check ID uniqueness
SELECT 
    ID, 
    COUNT(*) 
FROM [HighlandCoffee].[Bronze].[BrandImage]
GROUP BY ID 
HAVING COUNT(*) > 1
-- =>The ID column refer to the ID of respondent

-- Check ID [Attribute]
SELECT 
    Awareness
FROM [HighlandCoffee].[Bronze].[BrandImage]
WHERE Awareness <> BrandImage
-- => No difference found, the data in both columns is 100% identical => In practice, people just echoed the brand they were aware of as their brand image.
-- Remove one of them

--Check null awarenss and BrandImage
SELECT 
    Awareness, 
    BrandImage
FROM [HighlandCoffee].[Bronze].[BrandImage]
WHERE Awareness IS NULL 


-- Check Attribute
SELECT 
    DISTINCT
    Attribute
FROM [HighlandCoffee].[Bronze].[BrandImage]
-- There are 28 distinct attributes, but they overlap in terms of meaning => need to standardise

SELECT TOP (1000) [ID]
      ,[City]
      ,[Daypart]
      ,[VisitDayPart]
      ,[Year]
  FROM [HighlandCoffee].[Bronze].[DayPart]
GO

WITH Total AS (
    SELECT COUNT(*) * 1.0 AS total_rows
    FROM [HighlandCoffee].[Bronze].[DayPart]
)
SELECT 'ID' AS ColumnName,
       SUM(CASE WHEN [ID] IS NULL THEN 1 ELSE 0 END) AS NullCount,
       CAST(SUM(CASE WHEN [ID] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2)) AS NullPercent
FROM [HighlandCoffee].[Bronze].[DayPart], Total
UNION ALL
SELECT 'City',
       SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[DayPart], Total
UNION ALL
SELECT 'Daypart',
       SUM(CASE WHEN [Daypart] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Daypart] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[DayPart], Total
UNION ALL
SELECT 'VisitDayPart',
       SUM(CASE WHEN [VisitDayPart] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [VisitDayPart] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[DayPart], Total
UNION ALL
SELECT 'Year',
       SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[DayPart], Total;



SELECT [ID]
      ,[City]
      ,[Daypart]
      ,[VisitDayPart]
      ,[Year]
FROM [Bronze].[DayPart]
WHERE Daypart IS NULL OR VisitDayPart IS NULL 
SELECT [ID]
      ,[City]
      ,[DayOfWeek]
      ,[VisitDayOfWeek]
      ,[Year]
      ,[WeekdayEnd]
  FROM [HighlandCoffee].[Bronze].[DayOfWeek]
  ORDER BY ID;

--Check duplicates
SELECT [ID]
      ,[City]
      ,[DayOfWeek]
      ,[VisitDayOfWeek]
      ,[Year]
      ,[WeekdayEnd]
      ,COUNT(*)
FROM [HighlandCoffee].[Bronze].[DayOfWeek]
GROUP BY [ID]
      ,[City]
      ,[DayOfWeek]
      ,[VisitDayOfWeek]
      ,[Year]
      ,[WeekdayEnd]
HAVING COUNT(*) > 1
GO
-- 18 Rows duplicates

-- Check nulls 
WITH Total AS (
    SELECT COUNT(*) * 1.0 AS total_rows
    FROM [HighlandCoffee].[Bronze].[DayOfWeek]
)
SELECT 'ID' AS ColumnName,
       SUM(CASE WHEN [ID] IS NULL THEN 1 ELSE 0 END) AS NullCount,
       CAST(SUM(CASE WHEN [ID] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2)) AS NullPercent
FROM [HighlandCoffee].[Bronze].[DayOfWeek], Total
UNION ALL
SELECT 'City',
       SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[DayOfWeek], Total
UNION ALL
SELECT 'DayOfWeek',
       SUM(CASE WHEN [DayOfWeek] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [DayOfWeek] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[DayOfWeek], Total
UNION ALL
SELECT 'VisitDayOfWeek',
       SUM(CASE WHEN [VisitDayOfWeek] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [VisitDayOfWeek] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[DayOfWeek], Total
UNION ALL
SELECT 'Year',
       SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[DayOfWeek], Total
UNION ALL
SELECT 'WeekdayEnd',
       SUM(CASE WHEN [WeekdayEnd] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [WeekdayEnd] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[DayOfWeek], Total;
GO

-- DateOfWeek and VisitDayOfWeek have null values 

SELECT DISTINCT [Year] FROM [Bronze].[DayOfWeek]
--right years
SELECT DISTINCT [City] FROM [Bronze].[DayOfWeek]
--right cities
SELECT DISTINCT [DayOfWeek] FROM [Bronze].[DayOfWeek]

SELECT [VisitDayOfWeek] FROM [Bronze].[DayOfWeek] 
WHERE [VisitDayOfWeek] < 0 
-- no frequency < 0
GO

SELECT [ID]
      ,[City]
      ,[DayOfWeek]
      ,[VisitDayOfWeek]
      ,[Year]
      ,[WeekdayEnd]
  FROM [HighlandCoffee].[Bronze].[DayOfWeek]
  WHERE [DayOfWeek] IS NULL OR [VisitDayOfWeek] IS NULL 
  ORDER BY ID
  
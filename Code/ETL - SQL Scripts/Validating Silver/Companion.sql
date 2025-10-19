SELECT TOP (1000) [CompanionKey]
      ,[RespondentID]
      ,[CompanionGroup]
      ,[dwh_create_date]
  FROM [HighlandCoffee].[Silver].[Companion]
;
WITH Total AS (
    SELECT COUNT(*) * 1.0 AS total_rows
    FROM [HighlandCoffee].[Silver].[Companion]
)
SELECT 'CompanionKey' AS ColumnName,
       SUM(CASE WHEN [CompanionKey] IS NULL THEN 1 ELSE 0 END) AS NullCount,
       CAST(SUM(CASE WHEN [CompanionKey] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2)) AS NullPercent
FROM [HighlandCoffee].[Silver].[Companion], Total
UNION ALL
SELECT 'RespondentID',
       SUM(CASE WHEN [RespondentID] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [RespondentID] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[Companion], Total
UNION ALL
SELECT 'CompanionGroup',
       SUM(CASE WHEN [CompanionGroup] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [CompanionGroup] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[Companion], Total;

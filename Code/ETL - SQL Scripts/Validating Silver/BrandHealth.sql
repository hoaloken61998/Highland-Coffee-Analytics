SELECT [BrandHealthKey]
      ,[RespondentID]
      ,[Year]
      ,[CityID]
      ,[Brand]
      ,[Segmentation]
      ,[Is_Spontaneous_Aware]
      ,[Is_Aware]
      ,[Is_Trial]
      ,[Has_Brand_Likability]
      ,[Comprehension]
      ,[Used_P3M]
      ,[Used_P1M]
      ,[Frequency_Visits]
      ,[Spending]
      ,[NPS_Score]
      ,[NPS_Group]
      ,[dwh_create_date]
  FROM [HighlandCoffee].[Silver].[BrandHealth]


WITH Total AS (
    SELECT COUNT(*) * 1.0 AS total_rows
    FROM [HighlandCoffee].[Silver].[BrandHealth]
)
SELECT 'BrandHealthKey' AS ColumnName,
       SUM(CASE WHEN [BrandHealthKey] IS NULL THEN 1 ELSE 0 END) AS NullCount,
       CAST(SUM(CASE WHEN [BrandHealthKey] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2)) AS NullPercent
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'RespondentID',
       SUM(CASE WHEN [RespondentID] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [RespondentID] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'Year',
       SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'CityID',
       SUM(CASE WHEN [CityID] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [CityID] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'Brand',
       SUM(CASE WHEN [Brand] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Brand] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'Segmentation',
       SUM(CASE WHEN [Segmentation] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Segmentation] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'Is_Spontaneous_Aware',
       SUM(CASE WHEN [Is_Spontaneous_Aware] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Is_Spontaneous_Aware] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'Is_Aware',
       SUM(CASE WHEN [Is_Aware] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Is_Aware] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'Is_Trial',
       SUM(CASE WHEN [Is_Trial] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Is_Trial] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'Has_Brand_Likability',
       SUM(CASE WHEN [Has_Brand_Likability] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Has_Brand_Likability] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'Comprehension',
       SUM(CASE WHEN [Comprehension] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Comprehension] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'Used_P3M',
       SUM(CASE WHEN [Used_P3M] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Used_P3M] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'Used_P1M',
       SUM(CASE WHEN [Used_P1M] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Used_P1M] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'Frequency_Visits',
       SUM(CASE WHEN [Frequency_Visits] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Frequency_Visits] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'Spending',
       SUM(CASE WHEN [Spending] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Spending] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'NPS_Score',
       SUM(CASE WHEN [NPS_Score] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [NPS_Score] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
UNION ALL
SELECT 'NPS_Group',
       SUM(CASE WHEN [NPS_Group] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [NPS_Group] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Silver].[BrandHealth], Total
-- No Percentage


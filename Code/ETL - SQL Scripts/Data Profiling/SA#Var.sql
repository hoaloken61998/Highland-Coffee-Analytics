SELECT [ID]
      ,[City]
      ,[Group_size]
      ,[Age]
      ,[MPI_Mean]
      ,[TOM]
      ,[BUMO]
      ,[BUMO_Previous]
      ,[MostFavourite]
      ,[Gender]
      ,[MPI_Detail]
      ,[AgeGroup]
      ,[AgeGroup2]
      ,[MPI]
      ,[MPI_2]
      ,[Occupation]
      ,[OccupationGroup]
      ,[Year]
      ,[MPI_Mean_Use]
      ,[Col]
  FROM [HighlandCoffee].[Bronze].[SAVar]
GO 

--Check duplicates
SELECT [ID]
      ,[City]
      ,[Group_size]
      ,[Age]
      ,[MPI_Mean]
      ,[TOM]
      ,[BUMO]
      ,[BUMO_Previous]
      ,[MostFavourite]
      ,[Gender]
      ,[MPI_Detail]
      ,[AgeGroup]
      ,[AgeGroup2]
      ,[MPI]
      ,[MPI_2]
      ,[Occupation]
      ,[OccupationGroup]
      ,[Year]
      ,[MPI_Mean_Use]
      ,[Col]
      ,COUNT(*)
 FROM [HighlandCoffee].[Bronze].[SAVar]
 GROUP BY [ID]
          ,[City]
          ,[Group_size]
          ,[Age]
          ,[MPI_Mean]
          ,[TOM]
          ,[BUMO]
          ,[BUMO_Previous]
          ,[MostFavourite]
          ,[Gender]
          ,[MPI_Detail]
          ,[AgeGroup]
          ,[AgeGroup2]
          ,[MPI]
          ,[MPI_2]
          ,[Occupation]
          ,[OccupationGroup]
          ,[Year]
          ,[MPI_Mean_Use]
          ,[Col]
HAVING COUNT(*) > 1
GO
--No duplicates 

WITH Total AS (
    SELECT COUNT(*) * 1.0 AS total_rows
    FROM [HighlandCoffee].[Bronze].[SAVar]
)
SELECT 'ID' AS ColumnName,
       SUM(CASE WHEN [ID] IS NULL THEN 1 ELSE 0 END) AS NullCount,
       CAST(SUM(CASE WHEN [ID] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2)) AS NullPercent
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'City',
       SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'Group_size',
       SUM(CASE WHEN [Group_size] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Group_size] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'Age',
       SUM(CASE WHEN [Age] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Age] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'MPI_Mean',
       SUM(CASE WHEN [MPI_Mean] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [MPI_Mean] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'TOM',
       SUM(CASE WHEN [TOM] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [TOM] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'BUMO',
       SUM(CASE WHEN [BUMO] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [BUMO] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'BUMO_Previous',
       SUM(CASE WHEN [BUMO_Previous] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [BUMO_Previous] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'MostFavourite',
       SUM(CASE WHEN [MostFavourite] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [MostFavourite] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'Gender',
       SUM(CASE WHEN [Gender] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Gender] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'MPI_Detail',
       SUM(CASE WHEN [MPI_Detail] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [MPI_Detail] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'AgeGroup',
       SUM(CASE WHEN [AgeGroup] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [AgeGroup] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'AgeGroup2',
       SUM(CASE WHEN [AgeGroup2] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [AgeGroup2] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'MPI',
       SUM(CASE WHEN [MPI] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [MPI] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'MPI_2',
       SUM(CASE WHEN [MPI_2] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [MPI_2] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'Occupation',
       SUM(CASE WHEN [Occupation] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Occupation] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'OccupationGroup',
       SUM(CASE WHEN [OccupationGroup] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [OccupationGroup] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'Year',
       SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'MPI_Mean_Use',
       SUM(CASE WHEN [MPI_Mean_Use] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [MPI_Mean_Use] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total
UNION ALL
SELECT 'Col',
       SUM(CASE WHEN [Col] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Col] IS NULL THEN 1 ELSE 0 END) * 100.0 / MAX(total_rows) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[SAVar], Total;
GO

SELECT 
    TOM, 
    BUMO,
    BUMO_Previous,
    MostFavourite
FROM [Bronze].[SAVar]
WHERE BUMO <> BUMO_Previous

SELECT 
    TOM, 
    BUMO,
    BUMO_Previous,
    MostFavourite
FROM [Bronze].[SAVar]
WHERE TOM <> MostFavourite

SELECT 
    TOM, 
    BUMO,
    BUMO_Previous,
    MostFavourite
FROM [Bronze].[SAVar]
WHERE BUMO <> MostFavourite



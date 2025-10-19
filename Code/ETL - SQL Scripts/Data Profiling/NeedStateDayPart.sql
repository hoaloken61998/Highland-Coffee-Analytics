SELECT [ID]
      ,[City]
      ,[Year]
      ,[Needstates]
      ,[DayDayPart]
      ,[NeedstateGroup]
  FROM [HighlandCoffee].[Bronze].[NeedstateDayDaypart]

SELECT 
    'ID' AS ColumnName,
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) AS NullCount,
    CAST(100.0 * SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS NullPercentage
FROM [HighlandCoffee].[Bronze].[NeedstateDayDaypart]

UNION ALL
SELECT 
    'City',
    COUNT(*),
    SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[NeedstateDayDaypart]

UNION ALL
SELECT 
    'Year',
    COUNT(*),
    SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[NeedstateDayDaypart]

UNION ALL
SELECT 
    'Needstates',
    COUNT(*),
    SUM(CASE WHEN Needstates IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN Needstates IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[NeedstateDayDaypart]

UNION ALL
SELECT 
    'DayDayPart',
    COUNT(*),
    SUM(CASE WHEN DayDayPart IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN DayDayPart IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[NeedstateDayDaypart]

UNION ALL
SELECT 
    'NeedstateGroup',
    COUNT(*),
    SUM(CASE WHEN NeedstateGroup IS NULL THEN 1 ELSE 0 END),
    CAST(100.0 * SUM(CASE WHEN NeedstateGroup IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2))
FROM [HighlandCoffee].[Bronze].[NeedstateDayDaypart];
    
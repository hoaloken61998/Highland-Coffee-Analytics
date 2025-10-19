SELECT [RespondentKey]
      ,[RespondentID]
      ,[CityID]
      ,[GroupSize]
      ,[Age]
      ,[Gender]
      ,[TopOfMind]
      ,[BrandUseMostOften]
      ,[BrandUseMostOften_Previous]
      ,[MostFavourite]
      ,[AgeGroup]
      ,[MPI]
      ,[Occupation]
      ,[OccupationGroup]
      ,[Year]
      ,[MPI_Mean_Use]
      ,[dwh_create_date]
  FROM [HighlandCoffee].[Silver].[Respondent]

GO

SELECT 
    COUNT(CASE WHEN RespondentID IS NULL THEN 1 END) AS Null_RespondentID,
    COUNT(CASE WHEN CityID IS NULL THEN 1 END) AS Null_CityID,
    COUNT(CASE WHEN GroupSize IS NULL THEN 1 END) AS Null_GroupSize,
    COUNT(CASE WHEN Age IS NULL THEN 1 END) AS Null_Age,
    COUNT(CASE WHEN Gender IS NULL THEN 1 END) AS Null_Gender,
    COUNT(CASE WHEN TopOfMind IS NULL THEN 1 END) AS Null_TopOfMind,
    COUNT(CASE WHEN BrandUseMostOften IS NULL THEN 1 END) AS Null_BUMO,
    COUNT(CASE WHEN BrandUseMostOften_Previous IS NULL THEN 1 END) AS Null_BUMOPrevious,
    COUNT(CASE WHEN MostFavourite IS NULL THEN 1 END) AS Null_MostFavourite,
    COUNT(CASE WHEN MPI IS NULL THEN 1 END) AS Null_MPI,
    COUNT(CASE WHEN Occupation IS NULL THEN 1 END) AS Null_Occupation,
    COUNT(CASE WHEN OccupationGroup IS NULL THEN 1 END) AS Null_OccupationGroup,
    COUNT(CASE WHEN Year IS NULL THEN 1 END) AS Null_Year,
    COUNT(CASE WHEN dwh_create_date IS NULL THEN 1 END) AS Null_CreateDate
FROM [HighlandCoffee].[Silver].[Respondent];

SELECT DISTINCT AgeGroup FROM [HighlandCoffee].[Silver].[Respondent];
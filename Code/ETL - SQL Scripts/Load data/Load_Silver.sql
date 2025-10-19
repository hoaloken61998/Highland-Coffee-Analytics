--Insert Attribute Mapping
INSERT INTO Silver.AttributeMapping (Attribute, GeneralizedAttribute) VALUES
-- Category: Ambiance & Environment
('Comfortable and relaxing environment', 'Ambiance & Environment'),
('Good place for relaxing', 'Ambiance & Environment'),
('Nice environment design', 'Ambiance & Environment'),
('Good music', 'Ambiance & Environment'),
('Clean', 'Ambiance & Environment'),

-- Category: Product Quality & Variety
('Good ice-blended taste', 'Product Quality & Variety'),
('Good coffee taste', 'Product Quality & Variety'),
('Diversified menu', 'Product Quality & Variety'),
('Good other beverages (other than coffee, tea & ice-blended)', 'Product Quality & Variety'),
('Good tea taste', 'Product Quality & Variety'),
('Delicious food', 'Product Quality & Variety'),
('Have new product regularly', 'Product Quality & Variety'),

-- Category: Service & Operations
('High speed of internet', 'Service & Operations'),
('Quick speed of service', 'Service & Operations'),
('Friendly staff', 'Service & Operations'),
('Convenient location', 'Service & Operations'),

-- Category: Social & Functional Purpose
('Good place for socializing', 'Social & Functional Purpose'),
('Good place for socializing with family', 'Social & Functional Purpose'),
('Good place for socializing with colleagues', 'Social & Functional Purpose'),
('Good place for socializing with friends', 'Social & Functional Purpose'),
('Good place for working / studying', 'Social & Functional Purpose'),
('Good place for studying', 'Social & Functional Purpose'),
('Good place for working / business meeting', 'Social & Functional Purpose'),

-- Category: Brand Perception & Value
('Recommended by others', 'Brand Perception & Value'),
('Popular brand', 'Brand Perception & Value'),
('Trusted brand', 'Brand Perception & Value'),
('Good value for money', 'Brand Perception & Value'),
('Feel I belong here', 'Brand Perception & Value');
GO

INSERT INTO Silver.Segmentation_Lookup (SegmentCode, SegmentName, SpendingRange, MinSpending, MaxSpending)
VALUES
('Seg.01', 'Mass', '<VND 25K', 0, 24999),
('Seg.02', 'Mass Asp', 'VND 25K - VND 59K', 25000, 59000),
('Seg.03', 'Premium', 'VND 60K - VND 99K', 60000, 99000),
('Seg.04', 'Super Premium', 'VND 100K+', 100000, NULL);
GO

--2017 Segmentation
TRUNCATE TABLE Silver.[2017SegmentationCase];
INSERT INTO Silver.[2017SegmentationCase] (
    [2017SegmentationCaseKey],
    RespondentID,
    SegmentCode,
    CustomerType,
    SpendingRange,
    Visit,
    Spending,
    BrandType,
    PPA,
    dwh_create_date
)
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY s.ID) AS SegmentationKey,
    s.ID AS RespondentID,

    -- SegmentCode
    LTRIM(RTRIM(SUBSTRING(s.Segmentation, 1, CHARINDEX(' -', s.Segmentation) - 1))) AS SegmentCode,

    -- CustomerType
    LTRIM(RTRIM(
        SUBSTRING(
            s.Segmentation,
            CHARINDEX(' - ', s.Segmentation) + 3,
            CHARINDEX('(', s.Segmentation + '(') - (CHARINDEX(' - ', s.Segmentation) + 3)
        )
    )) AS CustomerType,
    
    -- SpendingRange
    CASE
        WHEN s.Segmentation LIKE '%<VND%' 
            THEN '0 - ' + REPLACE(REPLACE(
                        SUBSTRING(
                            s.Segmentation,
                            CHARINDEX('<VND', s.Segmentation) + 4,
                            CHARINDEX('K', s.Segmentation) - (CHARINDEX('<VND', s.Segmentation) + 4) + 1
                        ), 'K','000'),' ', '')
        WHEN s.Segmentation LIKE '%+%' 
            THEN REPLACE(REPLACE(
                        SUBSTRING(
                            s.Segmentation,
                            CHARINDEX('(VND', s.Segmentation) + 4,
                            CHARINDEX('K', s.Segmentation) - (CHARINDEX('(VND', s.Segmentation) + 4) + 1
                        ), 'K','000'),' ', '') + '+'
        ELSE 
            REPLACE(REPLACE(
                        SUBSTRING(
                            s.Segmentation,
                            CHARINDEX('(VND', s.Segmentation) + 4,
                            CHARINDEX('K', s.Segmentation) - (CHARINDEX('(VND', s.Segmentation) + 4) + 1
                        ), 'K','000'),' ', '')
            + ' - ' +
            REPLACE(REPLACE(
                        SUBSTRING(
                            s.Segmentation,
                            CHARINDEX('- VND', s.Segmentation) + 5,
                            CHARINDEX('K)', s.Segmentation) - (CHARINDEX('- VND', s.Segmentation) + 5) + 1
                        ), 'K','000'),' ', '')
    END AS SpendingRange,

    s.Visit,
    CAST(s.Spending AS INT) * 1000 AS Spending,

    -- Standardize Brand
    CASE 
        WHEN s.Brand = 'Indepentdent' THEN 'Independent'
        ELSE s.Brand
    END AS BrandType,

    CAST(s.PPA AS INT) * 1000 AS PPA,
    GETDATE()
FROM Bronze.Segmentation3685case2017 s
LEFT JOIN Silver.Segmentation_Lookup es 
    ON s.Segmentation = es.SegmentCode;
GO 

-- Insert BrandImage
TRUNCATE TABLE Silver.BrandImage
INSERT INTO Silver.BrandImage (
	BrandImageKey,
	RespondentID, 
	[Year], 
	CityID, 
	Attribute,
	Awareness
)
SELECT 
	ROW_NUMBER() OVER (ORDER BY ID) as BrandImageKey,
	ID, 
	[Year],
	COALESCE(c.CityID, 1) AS CityID,
	Attribute,
	BrandImage
FROM Bronze.BrandImage bi 
LEFT JOIN Silver.City c ON bi.City = c.CityName
ORDER BY BrandImageKey


--Insert BrandHealth
TRUNCATE TABLE Silver.BrandHealth
INSERT INTO Silver.BrandHealth (
    BrandHealthKey,
    RespondentID,
    [Year],
    CityID,
    Brand,
    Segmentation,
    Is_Spontaneous_Aware,
    Is_Aware,
    Is_Trial,
    Has_Brand_Likability,
    Comprehension,
    Used_P3M,
    Used_P1M,
    Frequency_Visits,
    Spending,
    PPA,
    NPS_Score,
    NPS_Group
)
SELECT
    ROW_NUMBER() OVER (ORDER BY bh.ID) AS BrandHealthKey,
    bh.ID AS RespondentID,
    bh.[Year],

    CASE WHEN c.CityID IS NULL THEN 1 ELSE c.CityID END AS CityID,

    -- Standardize Brand
    CASE 
        WHEN Brand IN ('Street', 'Street / Half street coffee (including carts)') THEN 'Street Coffee'
        WHEN Brand IN ('Indepedent Cafe', 'Independent Cafe') THEN 'Independent Cafe'
        WHEN Brand IN ('Other 1','Other 2','Other 3','Other Branded Cafe Chain') THEN 'Other'
        WHEN Brand = 'KOI cafe' THEN 'KOI Cafe'
        WHEN Brand = 'Runam cafe' THEN 'Runam Cafe'
        WHEN Brand = N'Đen Đá' THEN N'Đen Đá Coffee'
        ELSE Brand
    END AS Brand,

    CASE 
        WHEN bh.Trial IS NULL OR bh.Segmentation IS NULL THEN 'N/A'
        WHEN TRY_CAST(bh.Spending AS INT) < 25 THEN 'Seg.01'
        WHEN TRY_CAST(bh.Spending AS INT) BETWEEN 25 AND 59 THEN 'Seg.02'
        WHEN TRY_CAST(bh.Spending AS INT) BETWEEN 60 AND 99 THEN 'Seg.03'
        WHEN TRY_CAST(bh.Spending AS INT) >= 100 THEN 'Seg.04'
        ELSE seg.SegmentCode
    END AS SegmentCode,

    CASE WHEN bh.Spontaneous IS NOT NULL THEN 1 ELSE 0 END AS Is_Spontaneous_Aware,
    CASE WHEN bh.Awareness IS NOT NULL AND bh.Brand IS NOT NULL THEN 1 ELSE 0 END AS Is_Aware,
    CASE WHEN bh.Trial IS NOT NULL THEN 1 ELSE 0 END AS Is_Trial,
    CASE WHEN bh.Brand_Likability IS NOT NULL THEN 1 ELSE 0 END AS Has_Brand_Likability,
    CASE WHEN bh.Comprehension IS NULL THEN 'Did not answer' ELSE bh.Comprehension END AS Comprehension,

    CASE WHEN bh.P3M IS NOT NULL THEN 1 ELSE 0 END AS Used_P3M,
    CASE WHEN bh.P1M IS NOT NULL THEN 1 ELSE 0 END AS Used_P1M,

    CASE 
        WHEN bh.Trial IS NULL THEN '0'
        WHEN bh.FreqVisit IS NOT NULL THEN CAST(bh.FreqVisit AS NVARCHAR(50)) 
        ELSE 'N/A'
    END AS Frequency_Visits,

    -- Format Spending: numeric * 1000, else 'N/A'
    CASE 
        WHEN bh.Spending IS NULL THEN 'N/A'
        WHEN TRY_CAST(bh.Spending AS INT) IS NOT NULL THEN CAST(TRY_CAST(bh.Spending AS INT) * 1000 AS NVARCHAR(50))
        ELSE 'N/A'
    END AS Spending,

    -- Format PPA: numeric * 1000, else 'N/A'
    CASE 
        WHEN bh.Spending IS NULL OR bh.FreqVisit IS NULL THEN 'N/A'
        WHEN TRY_CAST(bh.Spending AS INT) IS NOT NULL 
             AND TRY_CAST(bh.FreqVisit AS INT) IS NOT NULL 
             AND bh.FreqVisit <> 0
            THEN CAST((TRY_CAST(bh.Spending AS INT) / TRY_CAST(bh.FreqVisit AS INT)) * 1000 AS NVARCHAR(50))
        ELSE 'N/A'
    END AS PPA,

    CASE WHEN bh.[NPS_P3M] IS NULL THEN 'N/A' ELSE CAST(bh.[NPS_P3M] AS NVARCHAR(50)) END AS NPS_Score,
    CASE WHEN bh.[NPS_P3M_Group] IS NULL AND bh.[NPS_P3M] IS NULL THEN 'N/A' ELSE bh.[NPS_P3M_Group] END AS NPS_Group

FROM Bronze.BrandHealth bh
LEFT JOIN Silver.City c ON bh.City = c.CityName
LEFT JOIN Silver.Segmentation_Lookup seg ON LEFT(bh.Segmentation, 6) = seg.SegmentCode;



-- Companion
INSERT INTO Silver.Companion (
    CompanionKey,
    RespondentID,
    CompanionGroup
)
SELECT
    ROW_NUMBER() OVER (ORDER BY ID) AS CompanionKey,
    ID AS RespondentID,
    CompanionGroup
FROM Bronze.Companion;

--Competitor
TRUNCATE TABLE Silver.Competitor
INSERT INTO Silver.Competitor (
    CompetitorKey,
    Brand,
    CityID,
    [Year],
    StoreCount
)
SELECT
    ROW_NUMBER() OVER (ORDER BY b.NO),
    b.Brand,
    c.CityID,
    b.[Year],
    b.StoreCount
FROM HighlandCoffee.Bronze.CompetitorDatabase b
JOIN Silver.City c ON b.City = c.CityName  
GO

--DayOfWeek
TRUNCATE TABLE Silver.[DayOfWeek]
INSERT INTO Silver.[DayOfWeek] (
    DayOfWeekKey,
    RespondentID,
    c.CityID,
    [DayOfWeek],
    VisitFreq,
    [Year],
    WeekdayEnd
)
SELECT 
      ROW_NUMBER() OVER (ORDER BY ID),
      ID as RespondentID
      ,CityID
      ,COALESCE([DayOfWeek], 'N/A') AS [DayOfWeek]
      ,COALESCE(VisitDayOfWeek, 'N/A') AS [VisitFreq]
      ,[Year]
      ,SUBSTRING(WeekdayEnd, 2, LEN(WeekdayEnd)) AS WeekDayEnd
FROM [Bronze].[DayOfWeek] d LEFT JOIN Silver.City c 
ON d.City = c.CityName
ORDER BY ID;
GO

--DayPart
TRUNCATE TABLE Silver.[DayPart];
INSERT INTO Silver.[DayPart] (
    DayPartKey,
    RespondentID,
    CityID,
    DayPart,
    VisitFreq,
    [Year]
)
SELECT 
      ROW_NUMBER() OVER (ORDER BY ID) AS DayPartKey,
      ID AS RespondentID,
      COALESCE(c.CityID, 1) as CityID,
      COALESCE(d.DayPart, 'N/A') AS DayPart,
      COALESCE(d.VisitDayPart, 'N/A') AS VisitFreq,
      d.[Year]
FROM [Bronze].[DayPart] d
LEFT JOIN Silver.City c ON d.City = c.CityName
GO

--NeedstateDayPart
TRUNCATE TABLE Silver.[NeedstateDayDaypart];
INSERT INTO Silver.[NeedstateDayDaypart] (
    NeedstateDayDaypartKey,
    RespondentID,
    CityID,
    [Year],
    Needstates,
    DowDayPart,
    NeedstateGroup
)
SELECT 
      ROW_NUMBER() OVER (ORDER BY d.ID) AS NeedstateDayDaypartKey,
      d.ID AS RespondentID,
      COALESCE(c.CityID, 1) AS CityID,
      d.[Year],
      COALESCE(d.Needstates, 'N/A') AS Needstates,
      COALESCE(d.DayDayPart, 'N/A') AS DayDayPart,
      COALESCE(d.NeedstateGroup, 'N/A') AS NeedstateGroup
FROM [Bronze].[NeedstateDayDaypart] d
LEFT JOIN Silver.City c 
    ON d.City = c.CityName
GO

TRUNCATE TABLE Silver.[Respondent];
INSERT INTO Silver.[Respondent] (
    RespondentKey,
    RespondentID,
    CityID,
    GroupSize,
    Age,
    TopOfMind,
    BrandUseMostOften,
    BrandUseMostOften_Previous,
    MostFavourite,
    Gender,
    AgeGroup,
    MPI,
    Occupation,
    OccupationGroup,
    [Year],
    MPI_Mean_Use
)
SELECT 
    ROW_NUMBER() OVER (ORDER BY s.ID) AS RespondentKey,
    s.ID AS RespondentID,
    COALESCE(c.CityID, 1) AS CityID,
    s.Group_size AS GroupSize,
    s.Age,
    -- Standardize TOM
    CASE 
        WHEN s.TOM IN ('Street', 'Street / Half street coffee (including carts)') THEN 'Street Coffee'
        WHEN s.TOM IN ('Indepedent Cafe', 'Independent Cafe') THEN 'Independent Cafe'
        WHEN s.TOM IN ('Other 1','Other 2','Other 3','Other Branded Cafe Chain') THEN 'Other'
        WHEN s.TOM = 'KOI cafe' THEN 'KOI Cafe'
        WHEN s.TOM = 'Runam cafe' THEN 'Runam Cafe'
        WHEN s.TOM = N'Đen Đá' THEN N'Đen Đá Coffee'
        ELSE s.TOM
    END AS TOM,
    -- Standardize BUMO
    CASE 
        WHEN s.BUMO IN ('Street', 'Street / Half street coffee (including carts)') THEN 'Street Coffee'
        WHEN s.BUMO IN ('Indepedent Cafe', 'Independent Cafe') THEN 'Independent Cafe'
        WHEN s.BUMO IN ('Other 1','Other 2','Other 3','Other Branded Cafe Chain') THEN 'Other'
        WHEN s.BUMO = 'KOI cafe' THEN 'KOI Cafe'
        WHEN s.BUMO = 'Runam cafe' THEN 'Runam Cafe'
        WHEN s.BUMO = N'Đen Đá' THEN N'Đen Đá Coffee'
        ELSE s.BUMO
    END AS BUMO,
    -- Standardize BUMO_Previous, fill null as 'N/A'
    CASE 
        WHEN s.BUMO_Previous IS NULL THEN 'N/A'
        WHEN s.BUMO_Previous IN ('Street', 'Street / Half street coffee (including carts)') THEN 'Street Coffee'
        WHEN s.BUMO_Previous IN ('Indepedent Cafe', 'Independent Cafe') THEN 'Independent Cafe'
        WHEN s.BUMO_Previous IN ('Other 1','Other 2','Other 3','Other Branded Cafe Chain') THEN 'Other'
        WHEN s.BUMO_Previous = 'KOI cafe' THEN 'KOI Cafe'
        WHEN s.BUMO_Previous = 'Runam cafe' THEN 'Runam Cafe'
        WHEN s.BUMO_Previous = N'Đen Đá' THEN N'Đen Đá Coffee'
        ELSE s.BUMO_Previous
    END AS BUMO_Previous,
    -- Standardize MostFavourite
    CASE 
        WHEN s.MostFavourite IN ('Street', 'Street / Half street coffee (including carts)') THEN 'Street Coffee'
        WHEN s.MostFavourite IN ('Indepedent Cafe', 'Independent Cafe') THEN 'Independent Cafe'
        WHEN s.MostFavourite IN ('Other 1','Other 2','Other 3','Other Branded Cafe Chain') THEN 'Other'
        WHEN s.MostFavourite = 'KOI cafe' THEN 'KOI Cafe'
        WHEN s.MostFavourite = 'Runam cafe' THEN 'Runam Cafe'
        WHEN s.MostFavourite = N'Đen Đá' THEN N'Đen Đá Coffee'
        ELSE s.MostFavourite
    END AS MostFavourite,
    s.Gender,
    SUBSTRING(s.AgeGroup2, 0, CHARINDEX('y.o.', s.AgeGroup2)) as AgeGroup,
    COALESCE(s.MPI, 'N/A') AS MPI, 
    s.Occupation,
    s.OccupationGroup,
    s.[Year],
    s.MPI_Mean_Use
FROM [Bronze].[SAVar] s
LEFT JOIN Silver.City c 
    ON s.City = c.CityName
WHERE s.Group_size IS NOT NULL AND s.Age IS NOT NULL ORDER BY s.ID;
GO

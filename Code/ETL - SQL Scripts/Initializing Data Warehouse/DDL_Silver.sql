-- Drop Attribute if exist 
IF OBJECT_ID('Silver.Attribute', 'U') IS NOT NULL
    DROP TABLE Silver.AttributeMapping;
GO
CREATE TABLE Silver.AttributeMapping (
    Attribute NVARCHAR(255) PRIMARY KEY,
    GeneralizedAttribute NVARCHAR(100)
);

-- Drop City table if exists
IF OBJECT_ID('Silver.City', 'U') IS NOT NULL
    DROP TABLE Silver.City;
GO

CREATE TABLE Silver.City (
    CityID INT,
    CityName NVARCHAR(100) NOT NULL UNIQUE

);
GO

IF OBJECT_ID('Silver.2017SegmentationCase', 'U') IS NOT NULL
    DROP TABLE Silver.[2017SegmentationCase];
GO
CREATE TABLE [Silver].[2017SegmentationCase] (
    [2017SegmentationCaseKey] INT, 
    RespondentID       INT             NOT NULL,
    SegmentCode      NVARCHAR(50)    NULL,
    CustomerType     NVARCHAR(100)   NULL,
    SpendingRange    NVARCHAR(100)   NULL,
    Visit            INT             NULL,
    Spending         INT             NULL,   -- CAST(Spending AS INT) * 1000
    BrandType        NVARCHAR(100)   NULL,   -- Standardized Brand
    PPA              INT             NULL,   -- CAST(PPA AS INT) * 1000
    dwh_create_date  DATETIME        DEFAULT GETDATE()
);


IF OBJECT_ID('Silver.Segmentation_Lookup', 'U') IS NOT NULL
    DROP TABLE Silver.Segmentation_Lookup;
GO

CREATE TABLE Silver.Segmentation_Lookup (
    SegmentCode NVARCHAR(10) PRIMARY KEY,
    SegmentName NVARCHAR(100),
    SpendingRange NVARCHAR(50),
    MinSpending INT,
    MaxSpending INT
);


IF OBJECT_ID('Silver.BrandImage', 'U') IS NOT NULL
    DROP TABLE Silver.BrandImage;
GO
CREATE TABLE Silver.BrandImage (
    BrandImageKey INT, 
    RespondentID INT,
    [Year] INT,
    CityID INT,
    Attribute NVARCHAR(255),
    Awareness NVARCHAR(255),
    dwh_create_date DATETIME DEFAULT GETDATE()
);

IF OBJECT_ID('Silver.BrandHealth', 'U') IS NOT NULL
    DROP TABLE Silver.BrandHealth;
GO

CREATE TABLE Silver.BrandHealth (
    BrandHealthKey INT,
    RespondentID INT,
    [Year] INT,
    CityID INT,
    Brand NVARCHAR(200),         -- Added Brand
    Segmentation NVARCHAR(100),
    
    -- Funnel Flags (0 = No/Null, 1 = Yes)
    Is_Spontaneous_Aware INT,
    Is_Aware INT,
    Is_Trial INT,
    Has_Brand_Likability INT,
    Comprehension NVARCHAR(100),

    -- Usage Flags
    Used_P3M INT,
    Used_P1M INT,

    -- Usage & Spending Metrics
    Frequency_Visits NVARCHAR(50),  -- Changed to NVARCHAR to allow 'N/A'
    PPA NVARCHAR(50),
    Spending NVARCHAR(50),          -- Changed to NVARCHAR to allow 'N/A'

    -- NPS Metrics
    NPS_Score NVARCHAR(50),         -- Changed to NVARCHAR to allow 'N/A'
    NPS_Group NVARCHAR(50),

    dwh_create_date DATETIME DEFAULT GETDATE()
);

-- Companion
IF OBJECT_ID('Silver.Companion', 'U') IS NOT NULL
    DROP TABLE Silver.Companion;
GO

CREATE TABLE Silver.Companion (
    CompanionKey INT PRIMARY KEY,   
    RespondentID INT,              
    CompanionGroup NVARCHAR(255),  
    dwh_create_date DATETIME DEFAULT GETDATE()
);

-- Competitor
IF OBJECT_ID('Silver.Competitor', 'U') IS NOT NULL
    DROP TABLE Silver.Competitor;
GO

CREATE TABLE Silver.Competitor (
    CompetitorKey INT PRIMARY KEY,
    Brand NVARCHAR(50),
    CityID INT,
    [Year] INT,
    StoreCount INT,
    dwh_create_date DATETIME DEFAULT GETDATE()
);

IF OBJECT_ID('Silver.DayOfWeek', 'U') IS NOT NULL
    DROP TABLE Silver.[DayOfWeek];
GO
CREATE TABLE Silver.[DayOfWeek] (
    DayOfWeekKey INT PRIMARY KEY,
    RespondentID INT,
    CityID INT,
    [DayOfWeek] NVARCHAR(50),
    VisitFreq NVARCHAR(50),
    Year INT,
    WeekdayEnd NVARCHAR(50),
    dwh_create_date DATETIME DEFAULT GETDATE()
);

IF OBJECT_ID('Silver.DayPart', 'U') IS NOT NULL
    DROP TABLE Silver.[DayPart];
GO

CREATE TABLE Silver.[DayPart] (
    DayPartKey INT PRIMARY KEY,         
    RespondentID INT,                   
    CityID INT,                  
    DayPart NVARCHAR(50),               
    VisitFreq NVARCHAR(50),           
    Year INT,                            
    dwh_create_date DATETIME DEFAULT GETDATE()  -- ETL timestamp
);


IF OBJECT_ID('Silver.NeedstateDaypart', 'U') IS NOT NULL
    DROP TABLE Silver.NeedstateDaypart;
GO

CREATE TABLE Silver.NeedstateDaypart (
    NeedstateDayDaypartKey INT PRIMARY KEY,  
    RespondentID INT,                       
    CityID INT,                             
    [Year] INT,
    Needstates NVARCHAR(255),
    DowDayPart NVARCHAR(255),
    NeedstateGroup NVARCHAR(255),
    dwh_create_date DATETIME DEFAULT GETDATE()
);
GO


IF OBJECT_ID('Silver.Respondent', 'U') IS NOT NULL
    DROP TABLE Silver.[Respondent];
GO

CREATE TABLE Silver.[Respondent] (
    RespondentKey INT PRIMARY KEY,          
    RespondentID INT,                      
    CityID INT,                             
    GroupSize NVARCHAR(50),                 
    Age INT,    
    Gender NVARCHAR(50),
    TopOfMind NVARCHAR(255),                      
    BrandUseMostOften NVARCHAR(255),                     
    BrandUseMostOften_Previous NVARCHAR(255),            
    MostFavourite NVARCHAR(255),                        
    AgeGroup NVARCHAR(100),                
    MPI NVARCHAR(255),                     
    Occupation NVARCHAR(255),
    OccupationGroup NVARCHAR(255),
    [Year] INT,
    MPI_Mean_Use NVARCHAR(255),                               
    dwh_create_date DATETIME DEFAULT GETDATE()
);
GO

/*
Overview:

This script creates the foundational tables in the Bronze layer of the Medallion architecture within the AnalyticsVault database. 

The Bronze schema represents the raw data ingestion layer, designed to store data as close to the source format as possible, before transformation and cleaning.
*/

-- DDL for Bronze.Segmentation3685case2017
IF OBJECT_ID('Bronze.Segmentation3685case2017', 'U') IS NOT NULL
    DROP TABLE Bronze.Segmentation3685case2017;
GO

CREATE TABLE Bronze.Segmentation3685case2017 (
    ID INT,
    Segmentation NVARCHAR(255),
    Visit INT,
    Spending DECIMAL(18, 2),
    Brand NVARCHAR(255),
    PPA DECIMAL(18, 2)
);
GO

-- DDL for Bronze.BrandImage
IF OBJECT_ID('Bronze.BrandImage', 'U') IS NOT NULL
    DROP TABLE Bronze.BrandImage;
GO

CREATE TABLE Bronze.BrandImage (
    ID INT,
    Year INT,
    City NVARCHAR(255),
    Awareness NVARCHAR(255),
    Attribute NVARCHAR(255),
    BrandImage NVARCHAR(255)
);
GO

-- DDL for Bronze.BrandHealth
IF OBJECT_ID('Bronze.BrandHealth', 'U') IS NOT NULL
    DROP TABLE Bronze.BrandHealth;
CREATE TABLE Bronze.BrandHealth (
    ID INT,
    Year INT,
    City NVARCHAR(255),
    Brand NVARCHAR(255),
    Spontaneous NVARCHAR(255),
    Awareness NVARCHAR(255),
    Trial NVARCHAR(255),
    P3M NVARCHAR(255),
    P1M NVARCHAR(255),
    Comprehension NVARCHAR(255),
    Brand_Likability NVARCHAR(255),
    Weekly NVARCHAR(50),
    Daily NVARCHAR(50),
    FreqVisit NVARCHAR(50),
    PPA NVARCHAR(50),
    Spending NVARCHAR(50),
    Segmentation NVARCHAR(255),
    NPS_P3M NVARCHAR(50),
    NPS_P3M_Group NVARCHAR(50), 
    Spending_use NVARCHAR(50)
);
GO


-- DDL for Bronze.Companion
IF OBJECT_ID('Bronze.Companion', 'U') IS NOT NULL
    DROP TABLE Bronze.Companion;
GO

CREATE TABLE Bronze.Companion (
    ID INT,
    City NVARCHAR(255),
    CompanionGroup NVARCHAR(255),
    Year INT
);
GO

-- DDL for Bronze.CompetitorDatabase
IF OBJECT_ID('Bronze.CompetitorDatabase', 'U') IS NOT NULL
    DROP TABLE Bronze.CompetitorDatabase;
GO

CREATE TABLE Bronze.CompetitorDatabase (
    No INT,
    Brand NVARCHAR(255),
    City NVARCHAR(255),
    Year INT,
    StoreCount INT
);
GO

-- DDL for Bronze.DayOfWeek
IF OBJECT_ID('Bronze.DayOfWeek', 'U') IS NOT NULL
    DROP TABLE Bronze.DayOfWeek;
GO

CREATE TABLE Bronze.DayOfWeek (
    ID INT,
    City NVARCHAR(255),
    DayOfWeek NVARCHAR(50),
    VisitDayOfWeek NVARCHAR(50),
    Year INT,
    WeekdayEnd NVARCHAR(50)
);
GO

-- DDL for Bronze.DayPart
IF OBJECT_ID('Bronze.DayPart', 'U') IS NOT NULL
    DROP TABLE Bronze.DayPart;
GO

CREATE TABLE Bronze.DayPart (
    ID INT,
    City NVARCHAR(255),
    Daypart NVARCHAR(255),
    VisitDayPart NVARCHAR(50),
    Year INT
);
GO

-- DDL for Bronze.NeedstateDayDaypart
IF OBJECT_ID('Bronze.NeedstateDayDaypart', 'U') IS NOT NULL
    DROP TABLE Bronze.NeedstateDayDaypart;
GO

CREATE TABLE Bronze.NeedstateDayDaypart (
    ID INT,
    City NVARCHAR(255),
    Year INT,
    Needstates NVARCHAR(255),
    DayDayPart NVARCHAR(255),
    NeedstateGroup NVARCHAR(255)
);
GO

-- DDL for Bronze.SAVar (Demographics)
IF OBJECT_ID('Bronze.SAVar', 'U') IS NOT NULL
    DROP TABLE Bronze.SAVar;
GO

CREATE TABLE Bronze.SAVar (
    ID INT,
    City NVARCHAR(255),
    Group_size INT,
    Age INT,
    MPI_Mean DECIMAL(18, 2),
    TOM NVARCHAR(255),
    BUMO NVARCHAR(255),
    BUMO_Previous NVARCHAR(255),
    MostFavourite NVARCHAR(255),
    Gender NVARCHAR(50),
    MPI_Detail NVARCHAR(255),
    AgeGroup NVARCHAR(50),
    AgeGroup2 NVARCHAR(50),
    MPI NVARCHAR(255),
    MPI_2 NVARCHAR(255),
    Occupation NVARCHAR(255),
    OccupationGroup NVARCHAR(255),
    Year INT,
    MPI_Mean_Use DECIMAL(18, 2),
    Col NVARCHAR(255)
);
GO


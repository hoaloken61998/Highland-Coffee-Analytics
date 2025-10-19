USE HighlandCoffee
GO 

TRUNCATE TABLE Bronze.Segmentation3685case2017;
BULK INSERT Bronze.Segmentation3685case2017
FROM 'D:\BI project\Data\2017Segmentation3685case.csv'
WITH (
	FIRST_ROW = 2,
	FIELDTERMINATOR = ';', 
	TABLOCK
)

TRUNCATE TABLE Bronze.BrandHealth;
BULK INSERT Bronze.BrandHealth
FROM 'D:\BI project\Data\Brandhealth.csv'
WITH (
	FIRST_ROW = 2,
	FIELDTERMINATOR = ';',
	CODEPAGE = '65001',
	TABLOCK
)

TRUNCATE TABLE Bronze.BrandImage;
BULK INSERT Bronze.BrandImage
FROM 'D:\BI project\Data\Brand_Image.csv'
WITH (
	FIRST_ROW = 2,
	FIELDTERMINATOR = ';',
	CODEPAGE = '65001',
	TABLOCK
)

TRUNCATE TABLE Bronze.Companion;
BULK INSERT Bronze.Companion
FROM 'D:\BI project\Data\Companion.csv'
WITH (
	FIRST_ROW = 2,
	FIELDTERMINATOR = ';',
	CODEPAGE = '65001',
	TABLOCK
)

TRUNCATE TABLE Bronze.CompetitorDatabase;
BULK INSERT Bronze.CompetitorDatabase
FROM 'D:\BI project\Data\Competitor database_xlnm#_FilterDatabase.csv'
WITH (
	FIRST_ROW = 2,
	FIELDTERMINATOR = ';',
	CODEPAGE = '65001',
	TABLOCK
)

TRUNCATE TABLE Bronze.DayPart;
BULK INSERT Bronze.DayPart
FROM 'D:\BI project\Data\DayPart.csv'
WITH (
	FIRST_ROW = 2,
	FIELDTERMINATOR = ';',
	CODEPAGE = '65001',
	TABLOCK
)

TRUNCATE TABLE Bronze.DayOfWeek;
BULK INSERT Bronze.DayOfWeek
FROM 'D:\BI project\Data\DayOfWeek.csv'
WITH (
	FIRST_ROW = 2,
	FIELDTERMINATOR = ';',
	CODEPAGE = '65001',
	TABLOCK
)

TRUNCATE TABLE Bronze.NeedstateDayDaypart;
BULK INSERT Bronze.NeedstateDayDaypart
FROM 'D:\BI project\Data\NeedstateDayDaypart.csv'
WITH (
	FIRST_ROW = 2,
	FIELDTERMINATOR = ';',
	CODEPAGE = '65001',
	TABLOCK
)

TRUNCATE TABLE Bronze.SAVar;
BULK INSERT Bronze.SAVar
FROM 'D:\BI project\Data\unprocessed data\SA#var.csv'
WITH (
	FIRST_ROW = 2,
	CODEPAGE = '65001',
	FIELDTERMINATOR = ';',
	TABLOCK
)

WITH ExtractSegmentation as (
    SELECT 
        Segmentation, 

        -- Segment Code
        LTRIM(RTRIM(SUBSTRING(Segmentation, 1, CHARINDEX(' -', Segmentation) - 1))) AS SegmentCode,

        -- Customer Type
        LTRIM(RTRIM(
            SUBSTRING(
                Segmentation,
                CHARINDEX(' - ', Segmentation) + 3,
                CHARINDEX('(', Segmentation + '(') - (CHARINDEX(' - ', Segmentation) + 3)
            )
        )) AS CustomerType,
        
        -- Spending Range
    CASE
        WHEN Segmentation LIKE '%<VND%' 
            -- Example: "(<VND 25K)" → "0 - 25000"
            THEN '0 - ' + REPLACE(REPLACE(
                        SUBSTRING(
                            Segmentation,
                            CHARINDEX('<VND', Segmentation) + 4,
                            CHARINDEX('K', Segmentation) - (CHARINDEX('<VND', Segmentation) + 4) + 1
                        ), 'K','000'),' ', '')

        WHEN Segmentation LIKE '%+%' 
            -- Example: "(VND 100K+)" → "100000+"
            THEN REPLACE(REPLACE(
                        SUBSTRING(
                            Segmentation,
                            CHARINDEX('(VND', Segmentation) + 4,
                            CHARINDEX('K', Segmentation) - (CHARINDEX('(VND', Segmentation) + 4) + 1
                        ), 'K','000'),' ', '') + '+'

        ELSE 
            -- Example: "(VND 25K - VND 59K)" → "25000 - 59000"
            REPLACE(REPLACE(
                        SUBSTRING(
                            Segmentation,
                            CHARINDEX('(VND', Segmentation) + 4,
                            CHARINDEX('K', Segmentation) - (CHARINDEX('(VND', Segmentation) + 4) + 1
                        ), 'K','000'),' ', '')
            + ' - ' +
            REPLACE(REPLACE(
                        SUBSTRING(
                            Segmentation,
                            CHARINDEX('- VND', Segmentation) + 5,
                            CHARINDEX('K)', Segmentation) - (CHARINDEX('- VND', Segmentation) + 5) + 1
                        ), 'K','000'),' ', '')
    END AS SpendingRange

    FROM Bronze.Segmentation3685case2017
)

SELECT 
    DISTINCT
    ID AS CustomerID, 
    SegmentCode,
    CustomerType,
    SpendingRange,
	Visit,
	CAST(Spending AS INT) * 1000 AS Spending,
	CASE 
		WHEN Brand = 'Indepentdent' THEN 'Independent'
		ELSE Brand
	END as BrandType,
	CAST(PPA AS INT) * 1000 AS PPA
FROM Bronze.Segmentation3685case2017 s
LEFT JOIN ExtractSegmentation es 
ON S.Segmentation = ES.Segmentation
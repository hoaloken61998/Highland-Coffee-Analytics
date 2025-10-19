SELECT * FROM Bronze.BrandHealth

-- Check ID uniqueness 
SELECT 
	ID,
	COUNT(*)
FROM Bronze.BrandHealth
GROUP BY ID
HAVING COUNT(*) > 1
-- The ID column is not unique 

-- Year and City (similar to BrandImage)

-- Check Brand
SELECT DISTINCT 
	Brand 
FROM Bronze.BrandHealth


-- Check null values
WITH null_statistic as (
SELECT 'ID' AS column_name,
       SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) AS null_count,
       CAST(SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS null_percent
FROM Bronze.BrandHealth

UNION ALL
SELECT 'Year',
       SUM(CASE WHEN Year IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN Year IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'City',
       SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'Brand',
       SUM(CASE WHEN Brand IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN Brand IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'Spontaneous',
       SUM(CASE WHEN Spontaneous IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN Spontaneous IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'Awareness',
       SUM(CASE WHEN Awareness IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN Awareness IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'Trial',
       SUM(CASE WHEN Trial IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN Trial IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'P3M',
       SUM(CASE WHEN P3M IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN P3M IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'P1M',
       SUM(CASE WHEN P1M IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN P1M IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'Comprehension',
       SUM(CASE WHEN Comprehension IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN Comprehension IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'Brand_Likability',
       SUM(CASE WHEN Brand_Likability IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN Brand_Likability IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'Weekly',
       SUM(CASE WHEN Weekly IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN Weekly IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'Daily',
       SUM(CASE WHEN Daily IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN Daily IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'Fre#visit',
       SUM(CASE WHEN [Freqvisit] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [Freqvisit] IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'PPA',
       SUM(CASE WHEN PPA IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN PPA IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'Spending',
       SUM(CASE WHEN Spending IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN Spending IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'Segmentation',
       SUM(CASE WHEN Segmentation IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN Segmentation IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'NPS#P3M',
       SUM(CASE WHEN [NPS_P3M] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [NPS_P3M] IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'NPS#P3M#Group',
       SUM(CASE WHEN [NPS_P3M_Group] IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN [NPS_P3M_Group] IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth

UNION ALL
SELECT 'Spending_use',
       SUM(CASE WHEN Spending_use IS NULL THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN Spending_use IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2))
FROM Bronze.BrandHealth
)
SELECT * FROM null_statistic ORDER BY null_percent;
--> Excluding columns:Weekly, Daily

SELECT 
    'Awareness_Num' as 'Column name', 
    COUNT(Awareness) FROM Bronze.BrandHealth 
UNION
SELECT 
    'Trial' as 'Column name', 
    COUNT(Trial) FROM Bronze.BrandHealth 
UNION
SELECT 
    'Spontaneous_num' as 'Column name', 
    COUNT(Spontaneous) FROM Bronze.BrandHealth 
UNION
SELECT 
    'Brand_Likability_Num' as 'Column name', 
    COUNT(Brand_Likability) AS Brand_Likability_Num FROM Bronze.BrandHealth 


-- Examine Spending and Spending_use
SELECT 
    Spending
FROM Bronze.BrandHealth
WHERE (Spending IS NOT NULL OR Spending_use IS NOT NULL) AND Spending NOT IN (SELECT Spending_use FROM Bronze.BrandHealth)
-- Spending and Spending_use is totally equal 
-- Overlaping => Remove 

--Check segmentation 
SELECT 
    DISTINCT [Year]
FROM Bronze.BrandHealth
WHERE Segmentation IS NOT NULL
-- Only in 2017, there was not data of segmentation

-- Check relationship between BrandHealth and BrandImage 
SELECT DISTINCT ID AS OnlyInBrandHealth
FROM Bronze.BrandHealth 
WHERE [Year] = 2017 AND ID NOT IN (SELECT DISTINCT ID FROM Bronze.Segmentation3685case2017)
-- That means almost all BrandHealth 2017 IDs are present in Segmentation2017, with just a tiny mismatch
-- Fill data in 2017 with data from 2017 Segmentation 


SELECT 
    COUNT(*) AS Total,
    SUM(CASE WHEN Trial IS NOT NULL AND P3M IS NOT NULL THEN 1 ELSE 0 END) AS TrialAndP3M,
    SUM(CASE WHEN Trial IS NULL AND P3M IS NULL THEN 1 ELSE 0 END) AS BothNull
FROM Bronze.BrandHealth;

--Validate comprehension versus Awareness and Trial
SELECT 
    COUNT(*) AS InconsistenComprehension,
    Comprehension
FROM Bronze.BrandHealth
WHERE Awareness IS NULL AND Trial IS NULL AND Comprehension IS NOT NULL
GROUP BY Comprehension;
-- Maybe do not know it is justifiable => Valid

--Validate P1M, P3M with Trial 
-- If Trial = NULL, then P1M and P3M should also be NULL (because the respondent never reported trying).
SELECT 
    COUNT(*) AS InconsistentCount
FROM Bronze.BrandHealth
WHERE Trial IS NULL AND (P1M IS NOT NULL OR P3M IS NOT NULL);


 SELECT DISTINCT Segmentation FROM Bronze.BrandHealth
 -- There are some incorrect segmentations when spending not in the defined range
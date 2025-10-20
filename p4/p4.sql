USE pandemic;

SELECT 
    Year,
    STR_TO_DATE(CONCAT(Year, '-01-01'), '%Y-%m-%d') AS first_jan,
    CURDATE() AS 'current_date',
    TIMESTAMPDIFF(
        YEAR,
        STR_TO_DATE(CONCAT(Year, '-01-01'), '%Y-%m-%d'),
        CURDATE()
    ) AS year_diff
FROM infectious_cases_normalized;
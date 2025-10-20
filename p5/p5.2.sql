USE pandemic;

-- -- The disease_periodic function calculates the average number of disease cases over
-- a specified period (e.g., a month) by dividing the yearly value by the specified divisor.
DROP FUNCTION IF EXISTS disease_periodic;

DELIMITER //
CREATE FUNCTION disease_periodic(cases_per_year DOUBLE, divisor INT)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    IF cases_per_year IS NULL OR cases_per_year = '' THEN
        RETURN NULL;
    END IF;
    RETURN cases_per_year / divisor;
END //
DELIMITER ;

-- Checking function operation.
SELECT 
    Year,
    Number_malaria,
    disease_periodic(Number_malaria, 12) AS per_month
FROM infectious_cases_normalized
WHERE Number_malaria <> ''
LIMIT 10;
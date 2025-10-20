USE pandemic;

-- The year_difference function calculates the number of years
-- that have passed from the specified year to the current date.
DROP FUNCTION IF EXISTS year_difference;

DELIMITER //
CREATE FUNCTION year_difference(year_value INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(
        YEAR,
        STR_TO_DATE(CONCAT(year_value, '-01-01'), '%Y-%m-%d'),
        CURDATE()
    );
END //
DELIMITER ;

-- Checking function operation.
SELECT 
    Year,
    year_difference(Year) AS diff_in_years
FROM infectious_cases_normalized
LIMIT 10;
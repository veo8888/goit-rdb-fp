USE pandemic;

-- Create a table with a list of unique entities
CREATE TABLE entities AS
SELECT DISTINCT Entity, Code
FROM infectious_cases;

-- Adding a primary key
ALTER TABLE entities
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

-- Create a table with data where Entity is replaced with a foreign key
CREATE TABLE infectious_cases_normalized AS
SELECT 
    e.id AS entity_id,
    ic.Year,
    ic.Number_yaws,
    ic.polio_cases,
    ic.cases_guinea_worm,
    ic.Number_rabies,
    ic.Number_malaria,
    ic.Number_hiv,
    ic.Number_tuberculosis,
    ic.Number_smallpox,
    ic.Number_cholera_cases
FROM infectious_cases ic
JOIN entities e ON ic.Entity = e.Entity AND ic.Code = e.Code;
USE pandemic;

SELECT 
    e.Entity,
    e.Code,
    AVG(ic.Number_rabies) AS avg_rabies,
    MIN(ic.Number_rabies) AS min_rabies,
    MAX(ic.Number_rabies) AS max_rabies,
    SUM(ic.Number_rabies) AS sum_rabies
FROM infectious_cases_normalized ic
JOIN entities e ON ic.entity_id = e.id
WHERE ic.Number_rabies IS NOT NULL AND ic.Number_rabies <> ''
GROUP BY e.Entity, e.Code
ORDER BY avg_rabies DESC
LIMIT 10;
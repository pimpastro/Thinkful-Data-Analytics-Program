SELECT COUNT(DISTINCT type)
FROM planes;

SELECT year, COUNT(year) AS number_of_records
FROM planes
GROUP BY year 
ORDER BY year DESC;

SELECT COUNT(*) AS number_of_records
FROM planes
WHERE engine = 'Turbo-jet';

SELECT engine, COUNT(engine) AS number_of_records
FROM planes
GROUP BY engine
ORDER BY number_of_records DESC;

SELECT COUNT(DISTINCT year)
FROM planes
WHERE model = '757-222' 
	AND manufacturer = 'BOEING';
	

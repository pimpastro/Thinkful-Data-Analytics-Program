SELECT * 
FROM planes
ORDER BY year;

SELECT *
FROM planes
ORDER BY manufacturer DESC;

SELECT *
FROM planes
ORDER BY manufacturer, model;

SELECT *
FROM planes
ORDER BY engines, seats DESC;

SELECT *
FROM planes
WHERE year < 2000 
ORDER BY engine;

SELECT *
FROM planes
ORDER BY seats DESC
LIMIT 10;

SELECT *
FROM planes
WHERE year < 1990
ORDER BY seats DESC
LIMIT 10;

SELECT COUNT (*) AS count_total,
		COUNT(speed) AS count_speed,
		COUNT(year) AS count_year
FROM planes;

SELECT COUNT(speed) AS count_speed
FROM planes
WHERE year < 1980;

SELECT DISTINCT engine
FROM planes;

SELECT DISTINCT year, manufacturer, model
FROM planes
ORDER BY manufacturer, year, model;







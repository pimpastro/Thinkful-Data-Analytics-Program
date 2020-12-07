SELECT COUNT(vehicles) AS count_vehicles
FROM vehicles;
-- 33,442 Records in Vehicles Table

SELECT COUNT(vehicles) AS count_vehicles
FROM vehicles
WHERE year Between 2010 AND 2015;

SELECT COUNT(*)
FROM vehicles
WHERE year Between 1987 AND 1989 OR
 year Between 1991 AND 1999 OR
 year Between 2001 AND 2005;
 
SELECT year, make, model, (hwy +cty)/2 AS average_mpg 
FROM vehicles;

SELECT Count(*)
FROM vehicles
WHERE make IN ('Ford', 'Chevrolet')
	AND class IN ('Compact Cars', 'Two Seaters');

SELECT *
FROM vehicles
WHERE year >= 2000 AND model LIKE 'X%'
ORDER BY make;


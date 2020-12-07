SELECT ROUND(AVG(temp),0)
FROM weather
WHERE month = 10;

SELECT MAX(precip) AS max_precip, origin
FROM weather
GROUP BY origin;

SELECT AVG(temp) = 39.0675 AS avg_temp, month, day
FROM weather
GROUP BY day, month
ORDER BY month;

SELECT MIN(visib) AS min_visib, month, origin
FROM weather
GROUP BY month, origin, visib
ORDER BY min_visib DESC;




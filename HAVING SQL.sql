SELECT birthyear, AVG(weight) as avg_weight
FROM people
WHERE bats = 'L' AND throws = 'L'
GROUP BY birthyear
HAVING (AVG(weight)) > 200
ORDER BY avg_weight DESC;

SELECT bats, AVG(height) as avg_height
FROM people
WHERE weight > 200
GROUP BY bats
ORDER BY AVG(height) DESC;

SELECT ROUND(avg(weight),0) AS avg_weight
FROM people
WHERE birthcountry = 'USA'
AND bats = 'L';

SELECT ROUND(MAX(height),0) AS max_height_david
FROM people
WHERE namefirst = 'David';






SELECT COUNT(DISTINCT(country))
FROM ksprojects;

SELECT main_category, ROUND(AVG(backers),0) as avg_backers
FROM ksprojects
GROUP BY main_category
ORDER BY avg_backers;

SELECT category, AVG(usd_pledged - goal) as avg_backing
FROM ksprojects
WHERE state ='successful'
GROUP BY category
ORDER BY avg_backing DESC;

SELECT main_category, backers
FROM ksprojects
WHERE state = 'successful' AND category = 'Publishing'
GROUP BY backers, main_category
HAVING backers BETWEEN 5 AND 10;

SELECT main_category, SUM(backers) AS total_backers
FROM ksprojects
WHERE state = 'successful' AND main_category NOT IN ('Games','Technology')
GROUP BY main_category
HAVING SUM(backers) > 100000
ORDER BY main_category;



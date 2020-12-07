SELECT COUNT(DISTINCT yearbuilt), COUNT(DISTINCT neighborhood)
FROM houseprices;

SELECT COUNT (DISTINCT yearbuilt), COUNT(DISTINCT neighborhood)
FROM houseprices
WHERE yearbuilt < 2000 AND neighborhood NOT LIKE 'G%';

SELECT COUNT(neighborhood), yearbuilt
FROM houseprices
GROUP BY yearbuilt;

SELECT COUNT(*) AS count_houses, neighborhood
FROM houseprices
WHERE saleprice > 100000 AND yearbuilt < 1950
GROUP BY neighborhood
ORDER BY count_houses DESC;



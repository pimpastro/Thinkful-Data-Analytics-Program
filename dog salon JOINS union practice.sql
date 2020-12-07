SELECT o.pet_id, date
FROM owners as o LEFT OUTER JOIN transactions as t
ON o.pet_id = t.pet_id
WHERE date is NULL;

SELECT DISTINCT date, Count(transaction_id) as Number_transactions
FROM transactions
GROUP BY date
ORDER BY Count(transaction_id) DESC;

SELECT owner_id, SUM(visits_count) as count_visits
FROM owners as o LEFT OUTER JOIN visits as v
ON o.pet_id = v.pet_id
GROUP BY owner_id;


SELECT t.pet_id, COUNT(visits_count) as Count_visits
FROM transactions as t LEFT OUTER JOIN visits as v
ON t.pet_id = v.pet_id
WHERE visits_count > 3
GROUP BY t.pet_id;

SELECT service, COUNT(transaction_id) as Service_Count
FROM transactions as t LEFT OUTER JOIN owners as o
ON t.pet_id = o.pet_id 
WHERE size = 'large'
GROUP BY service
ORDER BY COUNT(transaction_id);

SELECT owner_id, SUM(visits_count) as total_visits
FROM visits as v LEFT OUTER JOIN owners as o
ON v.pet_id = o.pet_id 
GROUP BY owner_id
HAVING SUM(visits_count) > 10;

SELECT MIN(owner_id), MAX(owner_id)
FROM (SELECT owner_id FROM owners
UNION
SELECT owner_id
FROM  owners_2) as Min_max_owners;


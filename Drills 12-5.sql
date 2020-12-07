SELECT *
FROM hof_inducted;

SELECT * 
FROM hof_not_inducted;

SELECT * 
FROM people;

SELECT *
FROM salaries;

-- 2. Write a query that returns the namefirst and namelast fields of the people table, along with the inducted field from the hof_inducted table. 
--All rows from the people table should be returned, and NULL values for the fields from hof_inducted should be returned when there is no match found.

SELECT namefirst, namelast, inducted
FROM people FULL JOIN hof_inducted
ON people.playerid = hof_inducted.playerid;

-- 3. Write a query that returns the yearid, playerid, teamid, and salary fields from the salaries table, along with the category field from the hof_inducted table. 
-- Keep only the records that are in both salaries and hof_inducted.

SELECT hof_inducted.yearid, salaries.playerid, teamid, salary, category
FROM salaries INNER JOIN hof_inducted 
ON salaries.playerid = hof_inducted.playerid;

-- 4. Write a query that returns the playerid, yearid, teamid, lgid, and salary fields from the salaries table and the inducted field from the hof_inducted table. 
-- Keep all records from both tables.

SELECT hof_inducted.playerid, salaries.yearid, teamid, lgid, salary, hof_inducted.inducted
FROM salaries JOIN hof_inducted ON salaries.playerid = hof_inducted.playerid; 

-- 5. Combine these two tables by all fields. Keep all records.
-- Get a distinct list of all player IDs for players who have been put up for HOF induction.

SELECT * 
FROM hof_inducted 
UNION 
SELECT * 
FROM hof_not_inducted;

SELECT DISTINCT * 
FROM hof_inducted 
UNION 
SELECT DISTINCT * 
FROM hof_not_inducted
WHERE category = 'Player';

-- 6. Write a query that returns the last name, first name (see the people table), 
-- and total recorded salaries for all players found in the salaries table.

SELECT namefirst, namelast, salary 
FROM people LEFT OUTER JOIN salaries 
ON people.playerid = salaries.playerid;

-- 7. Write a query that returns all records from the hof_inducted and hof_not_inducted tables 
-- that include playerid, yearid, namefirst, and namelast.

SELECT *
FROM hof_inducted LEFT OUTER JOIN hof_not_inducted
ON hof_inducted.playerid = hof_not_inducted.playerid;

-- 8. Return a table including all records from both hof_inducted and hof_not_inducted.
-- The query should also return the yearid and inducted fields. Include only records since 1980 from both tables. 

WITH hof AS(SELECT *
			FROM hof_inducted 
			UNION ALL 
			SELECT *
			FROM hof_not_inducted)
			SELECT CONCAT (p.namelast,', ',p.namefirst) 
			AS namefull, hof.yearid, hof.inducted FROM people as p 
			JOIN hof ON p.playerid = hof.playerid WHERE hof.yearid >= 1980 
			ORDER BY hof.yearid, hof.inducted DESC, namefull;
			
-- 9. Write a query that returns each year's highest annual salary for each team ID, 
-- ranked from high to low, along with the corresponding player ID.		

SELECT yearid, MAX(salary), teamid, namefirst, namelast, people.playerid
FROM people JOIN salaries 
ON people.playerid = salaries.playerid
GROUP BY salaries.salary, salaries.yearid, salaries.teamid, people.namefirst, people.namelast, people.playerid
ORDER BY salaries.salary DESC;

-- 10. Select birthyear, deathyear, namefirst, and namelast of all the players born since the birth year of Babe Ruth 
--  Sort the results by birth year from low to high

SELECT birthyear, deathyear, namefirst, namelast
FROM people
WHERE birthyear > ANY
	(SELECT	birthyear
	FROM people
	WHERE playerid = 'ruthba01')
ORDER BY birthyear; 

-- 11. Using the people table, write a query that returns namefirst, namelast, and a field called usaborn. 
-- Order the results by non-USA records first.

SELECT namefirst, namelast, 
	CASE
		WHEN birthcountry = 'USA' THEN 'USA'
		ELSE 'non-USA'
	END AS usaborn
FROM people
ORDER BY 3;

-- 12. Calculate the average height for players throwing with their right hand versus their left hand. 
-- Name these fields right_height and left_height, respectively.

SELECT 
AVG(CASE WHEN throws = 'R' THEN height END) AS right_height,
AVG(CASE WHEN throws = 'L' THEN height END) AS left_height
FROM people;

--13. Get the average of each team's maximum player salary since 2010.

WITH max_sal_by_team_by_year AS
(SELECT teamid, yearid, MAX(salary) AS max_sal
FROM salaries
GROUP BY teamid, yearid) 
SELECT teamid, AVG(max_sal) AS avg_max_sal_since_2010
FROM max_sal_by_team_by_year
WHERE yearid >= 2010
GROUP BY teamid;


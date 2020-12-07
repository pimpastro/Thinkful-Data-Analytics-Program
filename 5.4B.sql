SELECT MAX (salary)
FROM salaries;

SELECT MAX (salary) AS max_salary, yearid
FROM salaries
GROUP BY yearid, salary
ORDER BY MAX (salary) DESC;


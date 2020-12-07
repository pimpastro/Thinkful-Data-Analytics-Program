SELECT title, fine, return_date, name
FROM transactions
INNER JOIN books ON books.book_id = transactions.book_id
LEFT OUTER JOIN people ON people.person_id = transactions.person_id;

SELECT title, fine, checkout_date, name
FROM transactions
INNER JOIN books ON books.book_id = transactions.book_id
LEFT OUTER JOIN people ON people.person_id = transactions.person_id;

SELECT DISTINCT name
FROM people
INNER JOIN transactions ON people.person_id = transactions.person_id
RIGHT OUTER JOIN books ON books.book_id = transactions.book_id;

SELECT*
FROM people;

SELECT genre, fine, checkout_date, name, title, return_date
FROM transactions
INNER JOIN books ON books.book_id = transactions.book_id
LEFT OUTER JOIN people ON people.person_id = transactions.person_id
WHERE fine = '0';

SELECT genre, fine, checkout_date, name, title, return_date
FROM transactions
INNER JOIN books ON books.book_id = transactions.book_id
LEFT OUTER JOIN people ON people.person_id = transactions.person_id
WHERE title = 'The Hobbit';

SELECT genre, fine, checkout_date, name, title, return_date
FROM transactions
INNER JOIN books ON books.book_id = transactions.book_id
LEFT OUTER JOIN people ON people.person_id = transactions.person_id
WHERE fine > '0.01' AND title = 'Crazy Rich Asians';


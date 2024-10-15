USE sakila;

/* Question #11:
The music of Queen and Kris Kristofferson have seen an unlikely resurgence. 
As an unintended consequence, films starting with the letters K and Q have also soared in popularity. 
Use subqueries to display the titles of movies starting with the letters K and Q whose language is English. */

SELECT title 
FROM film 
WHERE (title LIKE 'K%' OR title LIKE 'Q%')
AND language_id IN
	(SELECT language_id FROM language
	 WHERE name = 'English');
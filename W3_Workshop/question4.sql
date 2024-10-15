USE sakila;

/* Question #4: 
Find all actors whose last names contain the letters LI. 
This time, order the rows by last name and first name, in that order. */
       
SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

-- Create a second version of this query that adds a count of the total number of movies each actor has been in.

SELECT actor_id, first_name, last_name, count(film_id) AS 'Total Number of Movies'
FROM actor
JOIN film_actor USING (actor_id)
WHERE last_name LIKE '%LI%'
GROUP BY actor_id
ORDER BY last_name, first_name;

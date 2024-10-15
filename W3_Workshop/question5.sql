USE sakila;

/* Question #5:
For last names that are shared by at least two actors, list those last names 
and the number of actors who have that last name */

SELECT last_name, count(actor_id) AS actor_count
FROM actor
GROUP BY last_name
Having actor_count >= 2
ORDER BY actor_count DESC;
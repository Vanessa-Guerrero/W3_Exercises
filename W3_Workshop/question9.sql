USE sakila;

/* Question #9:
List each film and the number of actors who are listed for that film. 
Use tables film_actor and film. Use inner join. */

SELECT title, count(actor_id) AS number_of_actors
FROM film
INNER JOIN film_actor USING (film_id)
GROUP BY title
ORDER BY number_of_actors DESC;

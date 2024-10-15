USE sakila;

/* Question #2:
You need to find the ID number, first name, and last name of an actor, 
where the only thing you know about him is his first name, Joe. */

SELECT actor_id, first_name, last_name 
FROM actor
WHERE first_name = 'Joe' ;

/* Question 2b:
Create an additional query to find all the movies that Joe has been in. */

-- Using Subqueries

SELECT title
FROM film
WHERE film_id IN (
	SELECT film_id 
    FROM film_actor 
	WHERE actor_id = (
		SELECT actor_id 
        FROM actor 
        WHERE first_name = 'Joe'
	)
);

-- Using Joins (preferred method of mine since it's clearner and simpler)

SELECT title
FROM film
JOIN film_actor USING (film_id)
JOIN actor USING (actor_id)
WHERE actor.first_name = 'Joe';
                                   
USE sakila;

/* Question #6:
The actor HARPO WlLLlAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. 
Write one query to fix the record, plus another to verify the change. */

-- Query to update name

UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = 'GROUCHO' AND last_name = 'Williams' ;

-- Query to verify change

SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name = 'Williams';
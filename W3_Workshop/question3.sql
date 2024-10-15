USE sakila;

/* Question #3: 
Find all actors whose last name contain the letters GEN. */

SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name LIKE '%GEN%';
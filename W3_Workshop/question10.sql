USE sakila;

/* Question #10:
How many copies of the film HUNCHBACK IMPOSSIBLE exist in the system? */

SELECT title, count(inventory_id) AS number_in_inventory
FROM film
JOIN inventory USING (film_id)
WHERE title = 'HUNCHBACK IMPOSSIBLE'
GROUP BY title;
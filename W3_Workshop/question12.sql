USE sakila;

/* Question #12:
Insert a record to represent Mary Smith renting the movie ACADEMY DINOSAUR 
from Mike Hillyer at store number 1 today. 
Then write a query to capture the exact row you entered into the rental table. */

INSERT INTO rental (inventory_id, customer_id, staff_id)
VALUES (
	(SELECT inventory_id 
     FROM inventory 
     WHERE film_id = (SELECT film_id FROM film WHERE title = 'ACADEMY DINOSAUR') 
     LIMIT 1),
	(SELECT customer_id 
     FROM customer 
     WHERE first_name = 'MARY' AND last_name ='SMITH'),
    (SELECT staff_id 
     FROM staff 
     WHERE first_name = 'MIKE' AND last_name = 'HILLYER' AND store_id = 1)
);

-- Query to check if record was added

SELECT * FROM rental 
ORDER BY rental_id DESC
LIMIT 1;
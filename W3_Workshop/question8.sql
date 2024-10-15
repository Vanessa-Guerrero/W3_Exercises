USE sakila;

/* Question #8:
Use JOIN to display the total amount rung up by each staff member 
in August of 2005, using tables staff and payment. */

SELECT first_name, last_name, SUM(amount)
FROM staff
JOIN payment USING (staff_id)
WHERE payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY first_name, last_name
ORDER BY SUM(amount);
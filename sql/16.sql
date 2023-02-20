/*
 * Use a JOIN to order the films by most profitable,
 * where the profit is the total amount that customer have payer for the film.
 * Use tables payment, rental, inventory, and film. 
 */

WITH filmtitle AS(
    SELECT 
        title, film_id
    FROM film
),

filmid AS(
    SELECT
        title, inventory_id
    FROM inventory
    JOIN filmtitle
    USING(film_id)
),

inv AS(
    SELECT
        title, rental_id
    FROM rental
    JOIN filmid
    USING(inventory_id)
),

rented AS( 
    SELECT
        title, SUM(amount) AS profit
    FROM payment
    JOIN inv
    USING(rental_id)
    GROUP BY title
)

SELECT 
    *
FROM rented
ORDER BY profit DESC;



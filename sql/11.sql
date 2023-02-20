/* 
 * Use a JOIN to list the number of copies of each film in the inventory system that begins with the letter h.
 * Use tables inventory and film.
 * Order by film title alphabetically.
 */

WITH t1 AS (
    SELECT film.film_id, film.title
FROM inventory inv
JOIN film
ON inv.film_id = film.film_id
WHERE film.title LIKE 'H%'),

t2 AS (
    SELECT film_id, COUNT(film_id)
FROM t1
GROUP BY 1)

SELECT 
    DISTINCT t2.film_id, t1.title, t2.count
FROM t2
JOIN t1
USING(film_id)
ORDER BY 2 DESC
;

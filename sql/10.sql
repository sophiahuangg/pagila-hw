/*
 * Use a JOIN to list each film and the number of actors who are listed for that film.
 * Use tables film and film_actor.
 */
SELECT 
    fm.title, fm.film_id, COUNT(*) AS "actor_count"
FROM film_actor act
LEFT JOIN film fm
ON fm.film_id=act.film_id
GROUP BY fm.film_id
ORDER BY actor_count, fm.film_id;

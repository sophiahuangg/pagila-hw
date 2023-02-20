/*
 * Use a JOIN to list each film and the number of actors who are listed for that film.
 * Use tables film and film_actor.
 */


WITH films AS(
    SELECT
        title, film_id
    FROM film
)

SELECT
    films.*, COUNT(*) AS actor_count
FROM films
JOIN film_actor
USING(film_id)
GROUP BY 1,2
ORDER BY 3,1;
         

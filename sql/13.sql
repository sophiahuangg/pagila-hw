/*
 * The music of Queen and Kris Kristofferson have seen an unlikely resurgence.
 * As an unintended consequence, films starting with the letters K and Q have also soared in popularity.
 * Use a JOIN to display the titles of movies starting with the letters K and Q whose language is English.
 * Use tables film and language, and order the results alphabetically by film title.
 */

WITH eng AS(
    SELECT
        language_id, name
    FROM language
    WHERE language_id = 1),

engmovies AS(
    SELECT 
        film.film_id, film.title, eng.*
    FROM film
    LEFT JOIN
    eng USING(language_id)
    WHERE film.title LIKE 'K%' OR film.title LIKE 'Q%'
    ORDER BY 2)

SELECT * FROM engmovies;


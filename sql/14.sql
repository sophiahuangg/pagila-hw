/*
 * Use a JOIN to list all films in the "Family" category.
 * Use table category, film_category, and film.
 */

WITH fam AS(
    SELECT
        category_id
    FROM category
    WHERE name='Family'),

famid AS(
    SELECT
        film_id
    FROM film_category
    RIGHT JOIN fam
    USING(category_id)),

famfilm AS(
    SELECT
        title
    FROM film
    JOIN famid
    USING(film_id)
    ORDER BY 1)

SELECT * FROM famfilm;

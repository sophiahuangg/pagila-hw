/*
 * Use a JOIN to count the number of English language films in each category.
 * Use table category, film_category, film, and language.
 */

WITH eng AS(
    SELECT
        language_id
    FROM language
    WHERE name='English'),

efilm AS(
    SELECT 
        film_id
    FROM film
    JOIN eng
    USING(language_id)
),

catid AS(
    SELECT 
        category_id
    FROM film_category
    JOIN efilm
    USING(film_id)
),

filmcat AS(
    SELECT 
        name
    FROM category
    JOIN catid
    USING(category_id)
)

SELECT
    filmcat.name, COUNT(*) AS sum
FROM filmcat
GROUP BY 1;

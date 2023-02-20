/*
 * Use a JOIN to count the number films in each category in the specified language.
 * Use table category, film_category, film, and language.
 */
CREATE OR REPLACE FUNCTION category_counts_by_language(TEXT) RETURNS TABLE(name TEXT, count BIGINT) AS
$$
-- FIXME: implementation goes here
WITH eng AS( 
    SELECT
        language_id
    FROM language
    WHERE name=$1),

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
    filmcat.name, COUNT(*) 
FROM filmcat
GROUP BY 1;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

SELECT * FROM category_counts_by_language('English');
SELECT * FROM category_counts_by_language('Italian');
SELECT * FROM category_counts_by_language('Japanese');
SELECT * FROM category_counts_by_language('Mandarin');
SELECT * FROM category_counts_by_language('French');
SELECT * FROM category_counts_by_language('German');
SELECT * FROM category_counts_by_language('Latin');

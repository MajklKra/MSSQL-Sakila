
/* Napište SQL query, který vratí poèet filmù v jednotlivých kategoriích */

SELECT category.category_id AS 'èíslo kategorie', category.name AS 'název kategorie', COUNT(film.film_id) AS 'poèet filmù'
FROM category
JOIN film_category ON film_category.category_id = category.category_id
JOIN film ON film.film_id = film_category.film_id

GROUP BY category.category_id, category.name


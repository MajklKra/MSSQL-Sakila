
/* Napi�te SQL query, kter� vrat� po�et film� v jednotliv�ch kategori�ch */

SELECT category.category_id AS '��slo kategorie', category.name AS 'n�zev kategorie', COUNT(film.film_id) AS 'po�et film�'
FROM category
JOIN film_category ON film_category.category_id = category.category_id
JOIN film ON film.film_id = film_category.film_id

GROUP BY category.category_id, category.name


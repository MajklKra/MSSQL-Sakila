
/* Napi�te SQL query, kter� vrat� informace o v�ech, co si p�j�ili film v posledn�m roce. Zaj�m� n�s jeho jm�no a kompletn� adresa. */


SELECT DISTINCT customer_id, first_name, last_name, address, address2, district, postal_code, city, country
FROM
(
	SELECT customer.customer_id, customer.first_name, customer.last_name, address.address,address.address2, 
	address.district, address.postal_code, city.city, country.country 
	FROM rental
	JOIN customer ON customer.customer_id = rental.customer_id
	JOIN address ON address.address_id = customer.address_id
	JOIN city ON city.city_id = address.city_id
	JOIN country ON country.country_id = city.country_id
	WHERE (DATEPART(YEAR,rental.rental_date)) >  2022 AND (DATEPART(YEAR,rental.rental_date)) < 2024
) AS SubQueryAlias




/* Napište SQL query pro výpoèet pokuty. Pokuta se poèítá za každý den po termínu vrácení a to èástkou 1% z ceny. 
Poèítejme, že filmy se pùjèují na 14 dní. */

SELECT inventory.film_id, DATEDIFF(DAY, rental_date, return_date) AS 'výpujèka', 
(DATEDIFF(DAY, rental_date, return_date) - 14) AS 'poèet dnù pro pokutu', 
(DATEDIFF(DAY, rental_date, return_date) - 14) * amount * 0.01  AS Pokuta
FROM rental
JOIN inventory ON inventory.inventory_id = rental.inventory_id
JOIN payment ON payment.rental_id = rental.rental_id
WHERE (DATEDIFF(DAY, rental_date, return_date) - 14) > 0
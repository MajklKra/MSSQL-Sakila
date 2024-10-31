

/* Napi�te SQL query pro v�po�et pokuty. Pokuta se po��t� za ka�d� den po term�nu vr�cen� a to ��stkou 1% z ceny. 
Po��tejme, �e filmy se p�j�uj� na 14 dn�. */

SELECT inventory.film_id, DATEDIFF(DAY, rental_date, return_date) AS 'v�puj�ka', 
(DATEDIFF(DAY, rental_date, return_date) - 14) AS 'po�et dn� pro pokutu', 
(DATEDIFF(DAY, rental_date, return_date) - 14) * amount * 0.01  AS Pokuta
FROM rental
JOIN inventory ON inventory.inventory_id = rental.inventory_id
JOIN payment ON payment.rental_id = rental.rental_id
WHERE (DATEDIFF(DAY, rental_date, return_date) - 14) > 0
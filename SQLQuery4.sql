
 /* Napište SQL query pro manažera, který vrátí kolik zápujèek udìlal jednotlivý zamìstnanec v každém roce. Rozdìleno na jednotlivé prodejny. */ 

	SELECT staff.staff_id, staff.first_name, staff.last_name, store.store_id, DATEPART(year, rental.rental_date) AS 'Rok pùjèení', 
	COUNT(rental.rental_id) AS 'poèet zapùjèek'
	FROM staff
	JOIN rental ON rental.staff_id = staff.staff_id
	JOIN store ON store.store_id = staff.store_id
	WHERE DATEPART(year, rental.rental_date) = DATEPART(year, rental.return_date)
	GROUP BY staff.staff_id, staff.first_name, staff.last_name, store.store_id, DATEPART(year, rental.rental_date) 


	
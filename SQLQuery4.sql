
 /* Napi�te SQL query pro mana�era, kter� vr�t� kolik z�puj�ek ud�lal jednotliv� zam�stnanec v ka�d�m roce. Rozd�leno na jednotliv� prodejny. */ 

	SELECT staff.staff_id, staff.first_name, staff.last_name, store.store_id, DATEPART(year, rental.rental_date) AS 'Rok p�j�en�', 
	COUNT(rental.rental_id) AS 'po�et zap�j�ek'
	FROM staff
	JOIN rental ON rental.staff_id = staff.staff_id
	JOIN store ON store.store_id = staff.store_id
	WHERE DATEPART(year, rental.rental_date) = DATEPART(year, rental.return_date)
	GROUP BY staff.staff_id, staff.first_name, staff.last_name, store.store_id, DATEPART(year, rental.rental_date) 


	
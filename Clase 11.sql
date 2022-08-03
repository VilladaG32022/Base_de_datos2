SELECT * FROM film f
LEFT JOIN inventory i 
ON f.film_id = i.film_id
WHERE i.film_id IS NULL;


SELECT f.title , i.inventory_id FROM film f
JOIN inventory i USING(film_id)
LEFT JOIN rental r USING(inventory_id)
WHERE  r.inventory_id IS NULL;

    
SELECT CONCAT(c.first_name, ' ',c.last_name) AS 'Nombre Completo', c.store_id, f.title, r.rental_date,r.return_date FROM rental r 
INNER JOIN customer c USING(customer_id)
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
ORDER BY c.store_id,c.last_name;

SELECT st.store_id, 
SUM(p.amount), 
CONCAT(s.first_name,' ',s.last_name) AS 'NOMBRE STAFF', 
CONCAT(co.country,', ',ci.city) AS 'PAIS Y CIUDAD' FROM store st
INNER JOIN staff s ON st.manager_staff_id = s.staff_id
INNER JOIN payment p ON s.staff_id = p.staff_id
INNER JOIN address a ON st.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
GROUP BY st.store_id;
    

SELECT a.* , count( fa.film_id) AS 'CANTIDAD DE APARICIONES' FROM actor a
RIGHT JOIN film_actor fa USING(actor_id)
GROUP BY actor_id
ORDER BY 'CANTIDAD DE APARICIONES' DESC
LIMIT 1;
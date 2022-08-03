SELECT COUNTry.COUNTry_id, COUNTry, COUNT(city)
FROM COUNTry
	JOIN city ONCOUNTry.COUNTry_id = city.COUNTry_id
GROUP BY COUNTry.COUNTry_id, COUNTry
ORDER BY COUNTry.COUNTry_id, COUNTry;

SELECT COUNTry.COUNTry_id, COUNTry, COUNT(city) AS cities
FROM COUNTry
	JOIN city ONCOUNTry.COUNTry_id = city.COUNTry_id
GROUP BY COUNTry.COUNTry_id, COUNTry
having cities > 10 
ORDER BY cities DESC;

SELECT first_name, lASt_name, address,
	(SELECT COUNT(*)
	FROM rental 
	WHERE customer.customer_id = rental.customer_id) AS total_films_rented,
	(SELECT SUM(amount)
    FROM payment
    WHERE customer.customer_id = payment.customer_id) AS total_money_spent
FROM customer 
	JOIN address ONcustomer.address_id = address.address_id 
ORDER BY total_money_spent DESC;

SELECT `name`,
	(SELECT AVG(LENGTH)
	FROM film_category fc
		JOIN film f ONfc.film_id = f.film_id
	WHERE c.category_id = fc.category_id) AS AVG_films_LENGTH
FROM category c
ORDER BY AVG_films_LENGTH DESC;

SELECT f.rating, COUNT(p.payment_id) AS total_sales
FROM film f
	JOIN inventory i ONi.film_id = f.film_id
	JOIN rental r ONr.inventory_id = i.inventory_id
	JOIN payment p ONp.rental_id = r.rental_id 
GROUP BY rating;
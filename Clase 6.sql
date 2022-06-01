
-- List all the actors that share the last name. Show them in order
SELECT first_name, last_name
FROM actor a1
WHERE EXISTS(SELECT * FROM actor a2 WHERE a1.last_name = a2.last_name AND a1.actor_id <> a2.actor_id) ORDER BY last_name;

-- Find actors that don't work in any film
SELECT first_name, last_name
FROM actor a
WHERE NOT EXISTS(SELECT first_name, last_name FROM film_actor fa WHERE a.actor_id = fa.actor_id);

-- Find customers that rented only one film
SELECT first_name, last_name
FROM customer c
WHERE 1=(SELECT COUNT(*) FROM rental r WHERE c.customer_id = r.customer_id);

-- Find customers that rented more than one film
SELECT first_name, last_name
FROM customer c
WHERE 1<(SELECT COUNT(*) FROM rental r WHERE c.customer_id = r.customer_id);

-- List the actors that acted in 'BETRAYED REAR' or in 'CATCH AMISTAD'
SELECT first_name, last_name
FROM actor
WHERE actor_id
IN(SELECT actor_id FROM film_actor WHERE film_id IN(SELECT film_id FROM film WHERE title LIKE 'BETRAYED REAR' OR title LIKE 'CATCH AMISTAD'));

-- List the actors that acted in 'BETRAYED REAR' but not in 'CATCH AMISTAD'
SELECT first_name, last_name
FROM actor
WHERE actor_id
IN(SELECT actor_id FROM film_actor WHERE film_id IN(SELECT film_id FROM film WHERE title LIKE 'BETRAYED REAR' AND title NOT LIKE 'CATCH AMISTAD'));

-- List the actors that acted in both 'BETRAYED REAR' and 'CATCH AMISTAD'
SELECT first_name, last_name
FROM actor
WHERE actor_id
IN(SELECT actor_id FROM film_actor WHERE film_id IN(SELECT film_id FROM film WHERE title LIKE 'BETRAYED REAR' AND title LIKE 'CATCH AMISTAD'));

-- List all the actors that didn't work in 'BETRAYED REAR' or 'CATCH AMISTAD'
SELECT first_name, last_name
FROM actor
WHERE actor_id
IN(SELECT actor_id FROM film_actor WHERE film_id NOT IN(SELECT film_id FROM film WHERE title LIKE 'BETRAYED REAR' OR title LIKE 'CATCH AMISTAD'));
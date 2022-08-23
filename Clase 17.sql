USE sakila;

SELECT * FROM address ad 
INNER JOIN city ci USING(city_id)
INNER JOIN country WHERE ad.postal_code IN(
SELECT postal_code FROM address where address LIKE '%y' AND postal_code IN(select postal_code FROM address where postal_code LIKE '%9')
);

CREATE INDEX addressIndex ON address(postal_code);
DROP INDEX addressIndex ON address;

SELECT first_nameFROM actor;
SELECT last_name FROM actor;

CREATE FULLTEXT INDEX descIndex ON film(description);
DROP INDEX descIndex ON film;

SELECT f.description FROM film f where f.description LIKE '%Epic%';

SELECT f.description FROM film f WHEREAdds the filetype django-html MATCH(f.description) AGAINST('Epic' IN NATURAL LANGUAGE MODE);
 
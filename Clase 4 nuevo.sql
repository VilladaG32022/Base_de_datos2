
# 1 #
select title, special_features from film f where rating like 'PG-13';

# 2 #
select DISTINCT  `length`  from film f;

# 3 #
select title, rental_rate, replacement_cost from film f where replacement_cost BETWEEN 20 AND 24;

# 4 #
select f.title, c.name, f.rating from film f, category c where f.special_features like '%Behind the Scenes%';

# 5 #
select a.first_name, a.last_name, f.title 
from film f 
join film_actor fa on f.film_id = fa.film_id
join actor a on fa.actor_id = a.actor_id 
where f.title like '%ZOOLANDER FICTION%';

# 6 #
select s.store_id, a.address, c.city, c2.country 
from store s
join address a on s.address_id = a.address_id 
join city c on a.city_id = c.city_id 
join country c2 on c2.country_id = c.country_id 
where s.store_id like 2;

# 7 #
select f1.title, f2.title, f1.rating from film f1, film f2 where f1.rating = f2.rating;

# 8 #
select f.title, s2.first_name, s2.last_name 
from film f 
join inventory i on f.film_id = i.film_id 
join store s on i.store_id = s.store_id 
join staff s2 on s.store_id  = s2.store_id  
where s.store_id like 2;





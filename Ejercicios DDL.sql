CREATE database imdb;
USE imdb;

CREATE table film(
	film_id INT PRIMARY KEY AUTO_INCREMENT, 
	title VARCHAR(50), 
	description VARCHAR(50), 
	release_year DATE
);


CREATE table actor(
	actor_id INT PRIMARY KEY AUTO_INCREMENT, 
	first_name VARCHAR(50), 
	last_name VARCHAR(50)
);


CREATE table film_actor(
	actor_id INT,
	film_id INT
);
		


alter table film add COLUMN last_update date;
alter table actor add COLUMN last_update date;


alter table film_actor add FOREIGN KEY (actor_id) references actor(actor_id);
alter table film_actor add FOREIGN KEY (film_id) references film(film_id);

insert into actor(actor_id,first_name,last_name) values (10,"Leonardo","Dicaprio");
insert into actor(actor_id,first_name,last_name) values (11,"Tom","Holland");
insert into actor(actor_id,first_name,last_name) values (12,"Tom","Cruise");

insert into film(film_id ,title , description, release_year) values (10,"Harry Potter y El Caliz de Fuego","Muere Cedric y Harry gana la copa", '2005/05/05');
insert into film(film_id ,title , description, release_year) values (11,"Titanic","Se hunde el barco", '1997/09/09');
insert into film(film_id ,title , description, release_year) values (12,"Doctor Strange","Las fuerzas del mal atacan", '2016/04/04');

insert into film_actor (actor_id, film_id) values (10,12);
insert into film_actor (actor_id, film_id) values (11,10);
insert into film_actor (actor_id, film_id) values (12,11);

select * FROM  film f;
select * from actor a;
select * from film_actor; 
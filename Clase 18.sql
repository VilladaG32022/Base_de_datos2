use sakila;

DELIMITER //

CREATE FUNCTION amount_copies(fi_id INT, st_id INT) RETURNS
INT deterministic
BEGIN
	DECLARE copies INT DEFAULT 0;
    
    SELECT count(i.inventory_id) INTO copies
    FROM film fi
		JOIN inventory i USING(film_id)
        JOIN store s USING(store_id)
	WHERE f.film_id = fi_id AND s.store_id = st_id;
    RETURN copies;
END //

DELIMITER ;

select amount_copies(44,1);


DELIMITER $

DROP PROCEDURE IF EXISTS people_country $

CREATE PROCEDURE people_country(IN co_name VARCHAR(200),OUT final VARCHAR(200))
BEGIN
	DECLARE fin INT DEFAULT 0;
    DECLARE f_name VARCHAR(200);
    DECLARE l_name VARCHAR(200);
    DECLARE c_name VARCHAR(200);
    DECLARE cursList CURSOR FOR
    
    SELECT co.country, cu.first_name, cu.last_name
    FROM customer cu
		JOIN address ad USING(address_id)
        JOIN city ci USING(city_id)
        Join country co USING(country_id);
	
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;
OPEN cursList;

looplabel: LOOP
		FETCH cursList INTO c_name, f_name, l_name;
		IF fin = 1 THEN
			LEAVE looplabel;
		END IF;
		IF c_name = co_name THEN
			SET final = CONCAT(f_name,';',l_name);
		END IF;
END LOOP looplabel;
CLOSE cursList;
    
END $
DELIMITER ;

call people_country('United States',@final);
SELECT @final;
SHOW CREATE FUNCTION inventory_in_stock;

/*
CREATE DEFINER=`root`@`localhost` FUNCTION `inventory_in_stock`(p_inventory_id INT) RETURNS tinyint(1)
     READS SQL DATA
 BEGIN
     DECLARE v_rentals INT;														El funcionamiento principal que tiene esta funcion 
     DECLARE v_out     INT;														es la de pedir un objeto y el cual te va a decir si 
																				se encuntra en el inventario, lo que usa para combrobar esto	
     #AN ITEM IS IN-STOCK IF THERE ARE EITHER NO ROWS IN THE rental TABLE		es usar la cantidad de rentals y el v_out para que devuelva un boolean
     #FOR THE ITEM OR ALL ROWS HAVE return_date POPULATED						en el que si es TRUE e porque existe en el inventario y si da FALSE es 
																				no esta
 
     SELECT COUNT(*) INTO v_rentals
     FROM rental
     WHERE inventory_id = p_inventory_id;
 
     IF v_rentals = 0 THEN
       RETURN TRUE;
     END IF;
 
     SELECT COUNT(rental_id) INTO v_out
     FROM inventory LEFT JOIN rental USING(inventory_id)
     WHERE inventory.inventory_id = p_inventory_id
     AND rental.return_date IS NULL;
 
     IF v_out > 0 THEN
       RETURN FALSE;
     ELSE
       RETURN TRUE;
     END IF;
 END
*/

#USAGE EXAMPLE

SELECT inventory_in_stock(32);
# devuelve '1'


SHOW CREATE PROCEDURE film_in_stock;
/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `film_in_stock`(IN p_film_id INT, IN p_store_id INT, OUT p_film_count INT)
     READS SQL DATA
 BEGIN
      SELECT inventory_id							Aca podemos ver que son dos SELECT distintos:	
      FROM inventory								El primero lo que hace es seleccionar un ID  del inventario en donde compara que 
      WHERE film_id = p_film_id						la pelicula este en el inventario y usa la funcion aterior apra corroborar si esta en 
      AND store_id = p_store_id						x tienda
      AND inventory_in_stock(inventory_id);		
													En el segundo lo que devuelve es el total de parametros que usaste
      SELECT FOUND_ROWS() INTO p_film_count;
 END
*/

#USAGE EXAMPLE

CALL film_in_stock(1,1,@f);
#DEVUELVE: '1','2','3','4' del INVENTORY_ID




--DIM_CUSTOMER
SELECT 
	cu.customer_id AS customer_key,
	CONCAT(cu.first_name," ",cu.last_name) AS nombre_completo,
	a.address AS address_costumer,
	ci.city AS city_customer,
	co.country AS country_customer
FROM sakila.customer cu
LEFT JOIN sakila.address a ON a.address_id = cu.address_id
LEFT JOIN sakila.city ci ON ci.city_id = a.city_id
LEFT JOIN sakila.country co ON co.country_id = ci.country_id

--DIM_FILM
SELECT  
	f.film_id AS film_key, 
	f.title AS name_film,
	c.name AS name_category
FROM sakila.film f
LEFT JOIN sakila.film_category fc ON fc.film_id = f.film_id
LEFT JOIN sakila.category c ON fc.category_id = c.category_id

--DIM_STORE
SELECT 
	s.store_id AS store_key,
	a.address AS address_store,
	ci.city AS city_store,
	co.country AS country_store
FROM sakila.store s
LEFT JOIN sakila.address a ON a.address_id = s.address_id
LEFT JOIN sakila.city ci ON ci.city_id = a.city_id
LEFT JOIN sakila.country co ON co.country_id = ci.country_id

--DATE_SALES
SELECT DISTINCT
 date(b.payment_date) AS Fecha,
 year(b.payment_date) AS Año,
 quarter(b.payment_date) AS Trimestre,
 Month(b.payment_date) AS Mes,
 monthname(b.payment_date) AS MesNombre,
 Day(b.payment_date) AS Dia
FROM sakila.payment b

--FACT_SALES
SELECT b.payment_id AS sale_key, SUM(b.amount)
FROM sakila.payment b
GROUP BY 1

SELECT b.payment_id AS sale_key, b.customer_id AS fk_customer, 
FROM sakila.payment b
LEFT JOIN sakila.customer cu ON cu.customer_id = b.customer_idcustomer
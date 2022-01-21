
use sakila;
show tables;

-- 1.feladat
select first_name, last_name from sakila.actor;

-- 2. feladat
-- A
select concat(first_name, ' ', last_name)  AS "ACTOR NAME" from sakila.actor;

-- B 
select actor_id, first_name, last_name from sakila.actor
where first_name = "Joe";

-- C
select * from sakila.actor
where last_name Like '%gen%';

-- D
select * from sakila.actor
where last_name Like '%li%'
order by last_name ASC, first_name ASC;

-- 3. feladat
select count(distinct(last_name)) AS "Összes vezetéknév" from sakila.actor;

-- 4. feladat 
select last_name from sakila.actor
group by last_name
having count(last_name) > 1;

-- 5. feladat
-- select * from country;
select country_id, country from country
where country in('China', 'Afghanistan', 'Israel');

-- Ha az összes város kellene a fent nevezett országokból
select city_id, city
from city left join	country on city.country_id = country.country_id
where country in('China', 'Afghanistan', 'Israel');

-- 6. feladat
select avg(length) AS 'Aátlagos film hossz' from film;

-- 7. feladat
select first_name, last_name, address
from staff join address on staff.address_id = address.address_id;

-- 8. feladat
select first_name, last_name, sum(amount)
from customer left join payment using(customer_id)
group by customer.first_name, customer.last_name
limit 10;

-- 9.feladat
select title, first_name, last_name 
from film left join film_actor using(film_id) left join actor using(actor_id)
LIMIT 20;

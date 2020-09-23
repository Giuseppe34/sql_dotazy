select title, description
from film
where rating = 'G'
order by title DESC

select *
from payment
where payment_date >= '2006-01-01' and amount < 2

select title
from film
where rating = 'G' or rating = 'PG'

select title, rating
from film
where rating = 'G' or rating = 'PG' or rating = 'PG-13'

select title
from film
where rating in ('G', 'PG', 'PG-13') /*výčet možností*/

select title, rating
from film
where rating not in ('G', 'PG', 'PG-13') /*výčet možností*/

select *
from film
where length > 50 and rental_duration between 3 and 5

select title
from film
where (title like '%RAINBOW%' or title like 'TEXAS%') and (length > 70)

select title, rental_duration
from film
where title like '%And%' and length between 80 and 90 and (rental_duration % 2 = 1)

select distinct special_features
from film
where replacement_cost between 14 and 16
order by special_features

select *
from film
where (rental_duration < 4 and rating != 'PG') or
	(rental_duration >= 4 and rating = 'PG')

select *
from address
where postal_code is not null

/* 13 */
select distinct customer_id
from rental 
where return_date is null

/*14 - rozdělení data na den, mesic, rok*/
select year(rental_date) as rok, month(rental_date) as mesic, day(rental_date) as den
from rental

/*15 - delka řetězce*/
select title
from film
where len(title) < 20 


/*16 - výběr minut z datumu (1440 minut v jednom dni)*/
select (rental_duration)*1440 as doba_vypujcky_v_min
from film


/* 17 spojeni dvou sloupcu do jednoho, jde to i s CONCAT*/
select first_name + ' ' + last_name as fullname
from customer
where active = 1

/*18 když chci doplnit misto null nějakou hodnotu*/
select ISNULL(postal_code, 'psc')
from address

/*19 spojení s CONCAT*/
select CONCAT(rental_date, + ' - ' ,return_date) as doba
from rental  
where return_date is not null

/*20 ?*/
select CONCAT(ISNULL(return_date, rental_date), + rental_date + '-', return_date) as xd
from rental  

/* 21 */
select count(*) as pocet_filmu
from film

/* 22 distinct = jen jedno z každého (když se něco opakuje, tak to beru jen jendou) */
select COUNT (distinct rating) as pocet_klas
from film

/* 23 */
select 
	count(*) as post_code,
	count(distinct postal_code) as pocet_vyplnenych_psc
	count(postal_code) as pocet_ruznych_psc
from address

/*24 min, max, avg*/
select AVG(length) as prumer, min(length) as min, max(length) as max, sum(length)
from film

/*25*/
select count(payment_id) as pocet, sum(amount) as soucet
from payment
where year(payment_date) = 2005

/*26 pocet písmen v názvech*/
select SUM(LEN(title)) as pocet_pismen_v_nazvech
from film
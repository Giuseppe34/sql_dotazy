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

/* 17 */
select first_name + ' ' + last_name as fullname
from customer
where active = 1

/* 21 */
select count(*) as pocet_filmu
from film

/* 22 */
select COUNT (distinct rating) as pocet_klas
from film

/* 23 */
select 
	count(*) as post_code,
	count(distinct postal_code) as pocet_ruznych_psc,
	count(postal_code) as pocet_adres_s_psc
from address
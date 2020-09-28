--1
select *
from city
join country on city.country_id = country.country_id

--2
select film.title, language.name
from film
join language on film.language_id = language.language_id

--3
select rental.rental_id
from customer
join rental on customer.customer_id = rental.customer_id
where customer.last_name = 'SIMPSON'

--4
select address
from customer
join address on customer.address_id = address.address_id
where customer.last_name = 'SIMPSON'

--5
select customer.first_name, customer.last_name, address.address, city.city
from customer
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id

--6
select customer.first_name, customer.last_name, city.city
from customer
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id

--8
select film.title, actor.first_name, actor.last_name
from film
join film_actor on film.film_id = film_actor.film_id
join actor on film_actor.actor_id = actor.actor_id
order by film.title --aby filmy byly seøazeny pod sebou, jinak jsou rozházené

--9
select actor.first_name, actor.last_name, film.title
from film
join film_actor on film.film_id = film_actor.film_id --spojeni tabulek je komutativni.. je jedno kterou spojim driv
join actor on film_actor.actor_id = actor.actor_id
order by actor.last_name, actor.first_name

--11
select store.store_id, staff.first_name, staff.last_name, staff_address.address as staff_add, store_address.address as store_add
from store
join staff on store.manager_staff_id = staff.staff_id --manager_id protoze chci spravce skladu
join address store_address on store.address_id = store_address.address_id --alijasy pro pojmenovani tabulek
join address staff_address on staff.address_id = staff_address.address_id

--12 tzv kartezky soucin
select film.film_id, film.title, film_actor.actor_id, film_category.category_id
from film
join film_actor on film.film_id = film_actor.film_id
join film_category on film.film_id = film_category.film_id
order by film_id

--13
select distinct film_actor.actor_id, film_category.category_id
from film
join film_actor on film.film_id = film_actor.film_id
join film_category on film.film_id = film_category.film_id

--14
select film.title
from film
join inventory on film.film_id = inventory.inventory_id

--15
select distinct actor.first_name, actor.last_name
from film
join film_actor on film.film_id = film_actor.film_id
join actor on film_actor.actor_id = actor.actor_id
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
where category.name = 'Comedy'

--16
select distinct customer.first_name, customer.last_name
from customer
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
join country on city.country_id = country.country_id
join rental on customer.customer_id = rental.customer_id
join inventory on rental.inventory_id = inventory.inventory_id
join film on inventory.film_id = film.film_id
where country.country like 'Italy' and film.title like 'MOTIONS DETAILS' and rental.rental_date is not null

--17
select distinct customer.first_name, customer.last_name
from customer
join rental on customer.customer_id = rental.customer_id
join inventory on rental.inventory_id = inventory.inventory_id
join film on inventory.film_id = film.film_id
join film_actor fa on film.film_id = fa.film_id
join actor on fa.actor_id = actor.actor_id
where actor.first_name = 'SEAN' and actor.last_name = 'GUINESS' and rental.return_date is not null

--18
select payment.payment_id, payment.amount, rental.rental_date
from payment
left join rental on payment.rental_id = rental.rental_id --vnejsi spojeni

/*vnitøní spojení (JOIN)

vnìjší spojení (LEFT JOIN, RIGHT JOIN)*/

--18 znova
select payment.payment_id, payment.amount, rental.rental_date
from payment
left join rental on payment.rental_id = rental.rental_id

--19
select language.name, film.title
from language
left join film on language.language_id = film.language_id --LEFT vypise jazyky bez filmu, kazdy film musi mit jazyk

--20
select film.title, language.name, orig_language.name as orig_1
from film
join language on film.language_id = language.language_id
left join language orig_language on film.original_language_id = orig_language.language_id --abych vypsal vsechny filmy s orig jazykem musi byt LEFT, 
--protoze ne kazdy film ma orig jazyk

--21
select film.title
from film
left join inventory on film.film_id = inventory.film_id
left join rental on inventory.inventory_id = rental.inventory_id
left join customer on rental.customer_id  = customer.customer_id
where (customer.first_name = 'TIM' and customer.last_name = 'CARY') or film.length = 48

--22
select film.title
from film
left join inventory on film.film_id = inventory.film_id
where inventory.inventory_id is null

--23
select distinct customer.first_name, customer.last_name
from customer
join rental on customer.customer_id = rental.customer_id
left join payment on rental.rental_id = payment.rental_id
where payment_date is null

--24
select film.title, language.name
from film
left join language on film.language_id = language.language_id
and name like 'I%' --nemuzu pouzit WHERE protoze se vzdy provede az po LEFT JOIN

--25
select customer.customer_id, customer.first_name, customer.last_name, payment.payment_id
from customer
left join payment on customer.customer_id = payment.customer_id
and payment.amount > 9

--26
select rental_id, film.title, city.city, country.country
from rental
left join inventory on rental.inventory_id = inventory.inventory_id
left join film on inventory.film_id = film.film_id and film.title like '%U%'
left join customer on rental.customer_id = customer.customer_id
left join address on customer.address_id = address.address_id and address.address like '%A%'
join city on address.city_id = city.city_id
join country on city.country_id = country.country_id

--27
select distinct film.title, customer.last_name
from film
left join inventory on film.film_id = inventory.film_id
left join rental on inventory.inventory_id = rental.inventory_id and rental.rental_date > '2006-01-01'
left join customer on rental.customer_id = customer.customer_id
order by film.title
###Query 1
use sakila;
select count(film_id), first_name, last_name from actor as r right join film_actor as l on r.actor_id = l.actor_id
group by r.actor_id
order by count(film_id) desc
limit 1;
    
###Query 2
select count(rental_id), first_name, last_name from customer as r right join rental as l on r.customer_id = l.customer_id
group by r.customer_id
order by count(rental_id) desc
limit 1;

###Query 3
select count(film_id), name from film_category as r right join category as l on r.category_id = l.category_id
group by name
order by count(film_id) desc;

###Query 4 Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address from staff as r inner join address as l on r.address_id = l.address_id;

###Query 5
select title, name from film as r right join language as l on l.language_id = r.language_id
where name = "English" or name = "italian"
having title regexp '^M'
order by name desc;


###Query 6

select first_name, last_name, sum(amount) from staff as s right join payment as p on s.staff_id = p.staff_id
where payment_date regexp "^2005-08"
group by s.staff_id;

###Query 7 List each film and the number of actors who are listed for that film.

select title, count(actor_id) from film as f right join film_actor as a on f.film_id = a.film_id
group by title;

###Query 8
select first_name, last_name, sum(amount) from customer as c right join payment as p on c.customer_id = p.customer_id
group by c.customer_id
order by c.last_name;


###Query 9
select a.actor_id from actor as a right join film_actor as f on a.actor_id = f.actor_id
where a.actor_id not in (select actor_id from film_actor);

###Query 10 get the addresses that has NO customers, and ends with the letter "e"
select address, a.address_id, first_name from address as a left join customer as c on a.address_id = c.address_id
where c.first_name is null;

###Query 11 what is the most rented film?
select title, count(rental_id) from film as f right join (select film_id, rental_id from rental as r right join inventory as i on r.inventory_id = i.inventory_id) as m on f.film_id = m.film_id
group by m.film_id
order by count(rental_id) desc
limit 1;


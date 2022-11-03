###1 In the table actor, what last names are not repeated?
use sakila;
select first_name, last_name from actor
where last_name in
		(select last_name  from actor
		group by last_name
		having count(first_name) <= 1
		)
order by first_name;

###2Which last names appear more than once?
select distinct last_name from actor
where last_name in
		(select last_name  from actor
		group by last_name
		having count(last_name) > 1
		);

###3Using the rental table, find out how many rentals were processed by each employee.
select staff_id, first_name, last_name, count(rental_id) from staff
join rental using (staff_id)
group by staff_id;

###4Using the film table, find out how many films there are of each rating.
select rating, count(film_id) from film
group by rating;

###5What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select rating, count(film_id), round(avg(length), 2) from film
group by rating;

###6Which kind of movies (rating) have a mean duration of more than two hours?
select rating, count(film_id), round(avg(length), 2) from film
group by rating
having avg(length) > 120;
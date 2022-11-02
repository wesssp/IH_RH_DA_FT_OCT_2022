use sakila;
### List all films whose length is longer than the average of all the films.
select length, title from film
	where length > (
		select avg(length) from film);

###How many copies of the film Hunchback Impossible exist in the inventory system?
select count(inventory_id), inv.film_id from inventory as inv join
	(select film_id, title from film where title = "Hunchback Impossible") as flm
    on inv.film_id = flm.film_id
    group by inv.film_id;
    
###Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name, al.actor_id from actor as a join
	(select flm.film_id, af.actor_id from film_actor as af join
		(select film_id from film where title = "Alone Trip") as flm
        on flm.film_id = af.film_id) as al on al.actor_id = a.actor_id;
        
###Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
###Identify all movies categorized as family films.
	
    
select title from film as fl join
    (select film_id from film_category as fc join
		(select category_id from category
		where name = "family") as ca on fc.category_id = ca.category_id)
        as f_id on fl.film_id = f_id.film_id;
        
###Get name and email from customers from Canada using subqueries. Do the same with joins. 
##Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, 
#that will help you get the relevant information.

select first_name, last_name, email, cs.address_id from customer as cs inner join
	(select address_id from address
		where city_id in 
			(select ci.city_id from city as ci join
				(select country_id from country where country = "Canada") 
			as ca on ci.country_id = ca.country_id)
	) as ad on cs.address_id = ad.address_id;
 
###Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films.
###First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

select distinct title from film as fi 
	join film_actor as fa on fi.film_id=fa.film_id
	where actor_id =
	(select act.actor_id from actor as act
	right join film_actor as fa on act.actor_id = fa.actor_id
	group by actor_id 
	order by count(film_id) desc
	limit 1);

###Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer 
###is the customer that has made the largest sum of payments
select title from film as film right join	
    (select film_id from inventory as inv right join
		(select rental_id, inventory_id from rental as re right join	
			(select customer_id, sum(amount) from payment
				group by customer_id
				order by sum(amount) desc
				limit 1) 
			as cust using (customer_id)) 
		as ren on inv.inventory_id = ren.inventory_id)
	as id using (film_id);

###Customers who spent more than the average payments(this refers to the average of all amount spent per each customer).


select avg(summ) from
	(select customer_id, sum(amount) as summ from payment
		group by customer_id
		order by sum(amount)) as ta;

select first_name, last_name, summ from customer  as cust join
	(select customer_id, sum(amount) as summ from payment
		group by customer_id
		order by sum(amount)) 
	as cust_sum on cust.customer_id = cust_sum.customer_id
    where summ > 
		(
		select avg(summ) from
			(select customer_id, sum(amount) as summ from payment
				group by customer_id
				order by sum(amount))
		as ta)
    ;
            
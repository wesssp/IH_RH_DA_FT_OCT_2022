###Query 1
select store_id, city, country from store as s left join 
		(select a.city_id, city, country, address_id from address as a right join
			(select c.country_id, country,city, city_id from city as c right join country as co
				on c.country_id = co.country_id) as cc
            on a.city_id=cc.city_id) as m
	on s.address_id = m.address_id;
    
###Query 2
select st.store_id, sum(amount) from store as st left join
	(select amount, s.staff_id, store_id from staff as s left join
		(select r.rental_id, r.staff_id, amount from rental as r left join
			payment as p on r.rental_id = p.rental_id)
        as ren on s.staff_id = ren.staff_id)
	as q on st.store_id = q.store_id
    group by st.store_id;
    
    
    
###Query 3
###Query 4
select round(sum(p.amount)), s.store_id
from payment p
join rental r on p.rental_id=r.rental_id
join inventory i on r.inventory_id=i.inventory_id
join store s on i.store_id=s.store_id
group by store_id
order by sum(amount) desc;

DELIMITER //
create procedure business_x_store()
begin
	select round(sum(p.amount)), s.store_id
	from payment p
	join rental r on p.rental_id=r.rental_id
	join inventory i on r.inventory_id=i.inventory_id
	join store s on i.store_id=s.store_id
	group by store_id
	order by sum(amount) desc
  ;
end //
DELIMITER ;

call  business_x_store();
drop procedure if exists business_x_store;


-- con parámetro store_id
DELIMITER //
create procedure business_x_store2(in param1 int)
begin
	select round(sum(p.amount)), s.store_id into param1
	from payment p
	join rental r on p.rental_id=r.rental_id
	join inventory i on r.inventory_id=i.inventory_id
	join store s on i.store_id=s.store_id
	group by store_id
	order by sum(amount) desc
  ;
end //
DELIMITER ;

call  business_x_store2();
select business_x_store2(2)


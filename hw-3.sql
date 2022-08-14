-- Question 1: All customers who live in Texas
select first_name, last_name, email, district
from customer
full join address
on customer.address_id = address.address_id 
where district = 'Texas';

-- Question 2: All payments above $6.99 with customer's full name
select first_name, last_name, amount
from customer 
full join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99;

-- Question 3: All customer names who have made payments over $175
select store_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
);

-- Question 4: All customers that live in Nepal
select customer.first_name, customer.last_name, customer.email, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id 
full join country 
on city.country_id = country.country_id
where country = 'Nepal';

-- Question 5: Which staff member has most transactions? --> Mike Hillyer
select staff_id, first_name, last_name
from staff
where staff_id in (
	select staff_id 
	from payment
	group by staff_id
	order by count(staff_id)
)

-- Question 6: How many movies of each rating are there?
-- 223 PG-13, 209 NC-17, 179 G, 194 PG, 195 R
select rating, count(rating)
from film 
group by rating;

-- Question 7: All customers who have made a single payment above 6.99 (subqueries)*
select first_name, last_name, email
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id, amount
	having amount > 6.99
)

-- Question 8: How many free rentals did our stores give away? --> 30 rentals
select payment_id, amount
from payment
where amount <= 0
group by payment_id;




select * from payment;
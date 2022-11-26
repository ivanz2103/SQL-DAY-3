--1.List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, address.district
FROM customer 
LEFT JOIN address 
ON customer.address_id=address.address_id 
where district LIKE 'Texas';
--( Jennifer Davis, Kim Cruz, Richard McCrary, Bryan Hardison, Ian Still )

--2.Get all payments above $6.99 with the Customer's FullName.
SELECT first_name, last_name, payment.amount
FROM customer
LEFT JOIN payment
ON customer.customer_id=payment.customer_id
WHERE amount > 6.99;
--( Their is 3632 total customers with orders above 6.99 )


--3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id in (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount) DESC
);
--( Their is a total of 134 customers with payments over 175 )


--4. List all customers that live in Nepal (use the city table)
SELECT *
FROM city
WHERE city = 'Nepal';
--( Their is zero customers from Nepal )


--5. Which staff member had the most transactions?
SELECT staff.first_name,staff.last_name, COUNT(payment.payment_id)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name 
ORDER BY 1,2;
--Best Employee ( Jon Stephens with 7304 transactions )

--6. How many movies of each rating are there?
SELECT count(rating), rating
FROM film
GROUP BY rating;
--( ( 6 ) Total Ratings ==> 195(R), 0(NULL), 209(NC-17), 107(G), 223(PG-13), 194(PG) )

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)


--8. How many free rentals did our stores give away?
SELECT amount
FROM payment
WHERE amount = 0;

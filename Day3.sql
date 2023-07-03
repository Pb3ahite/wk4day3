--1. List all customers who live in Texas (use JOINs)

SELECT customer_id, address_id
FROM customer
JOIN city ON city_id = city.city_id
WHERE city.city = 'Texas'


--2. Get all payments above $6.99 with the Customer's Full Name

SELECT customer.first_name, last_name, payment.amount
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
WHERE payment.amount > 6.99


--3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 175.00
);


--4. List all customers that live in Nepal (use the city table)
SELECT customer_id, first_name, last_name
FROM customer
WHERE city IN (
  SELECT city_id
  FROM city
  WHERE country_id = (
    SELECT country_id
    FROM country
    WHERE country = 'Nepal'
  )
);...


--5. Which staff member had the most transactions?
SELECT staff_id, COUNT(*) AS transaction_count
FROM payment
GROUP BY staff_id
ORDER BY transaction_count DESC
LIMIT 1;

--6. How many movies of each rating are there?
SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
  SELECT customer_id
  FROM payment
  WHERE amount > 6.99
  GROUP BY customer_id
  HAVING COUNT(*) = 1
);...


--8. How many free rentals did our stores give away?

SELECT COUNT(*) AS rental_id
FROM rental
WHERE amount = 0...


-- lab SQL 2.6

USE sakila;

-- 1

SELECT last_name, COUNT(last_name) 
FROM actor 
GROUP BY last_name 
HAVING count(last_name) = 1;

-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include 
-- the last names of the actors where the last name was present more than once.

SELECT last_name, COUNT(last_name) 
FROM actor 
GROUP BY last_name 
HAVING count(last_name) >1;

-- Using the rental table, find out how many rentals were processed by each employee.

SELECT * FROM sakila.rental;

SELECT staff_id, COUNT(rental_id) as nr_rentals
FROM sakila.rental 
GROUP BY staff_id;

-- Output: Staff 1 -> 8040 rentals; Staff 2 -> 8004 rentals

-- Using the film table, find out how many films were released each year.
SELECT release_year FROM sakila.film;

SELECT release_year as Rel_year, COUNT(film_id) as nr_of_Films 
FROM sakila.film 
GROUP BY release_year;
-- output: 1000 rows

-- Using the film table, find out for each rating how many films were there.

SELECT rating, COUNT(film_id)
FROM sakila.film 
GROUP BY rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places.

SELECT rating, ROUND(AVG(length),2)
FROM sakila.film 
GROUP BY rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?

SELECT rating, (AVG(length)) as avg_length
FROM sakila.film 
GROUP BY rating 
HAVING avg_Duration>=120;
-- PG-13 with mean duration of over 120 mins.

SELECT release_year as Release_year, COUNT(film_id) 
FROM sakila.film 
GROUP BY release_year;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.

SELECT * FROM sakila.film;

SELECT title, length, rental_rate
FROM sakila.film
WHERE (length <> '0')
ORDER BY length;
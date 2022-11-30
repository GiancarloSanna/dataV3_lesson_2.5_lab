USE sakila;

-- 1.Select all the actors with the first name ‘Scarlett’.alter
SELECT * FROM actor
WHERE first_name = 'Scarlett';

-- 2. How many films (movies) are available for rent 
-- and how many films have been rented?

-- The total number of films the company has,
-- are the number of movies it can rent out including multiple copies.
-- The rented_movies are the number of movies the company
-- has rented out during its existence.

SELECT count(DISTINCT inventory_id) AS movies_for_rent, 
count(rental_id) AS rented_movies
FROM rental;

-- 3. What are the shortest and longest movie duration? 
-- Name the values max_duration and min_duration.

SELECT min(length) AS min_duration, max(length) AS max_duration
FROM film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?

SELECT CONCAT(
FLOOR(AVG(length)/60),':',ROUND(AVG(length)%60)) AS average_length
FROM film; 


-- 5. How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT last_name) FROM actor;

-- 6. Since how many days has the company been operating 
-- (check DATEDIFF() function)?

-- We use the first rental as the start of the store, and the last update
-- as the last day of operations.
SELECT DATEDIFF(MAX(last_update),MIN(rental_date)) 
FROM rental;


-- 7. Show rental info with additional columns month and weekday.
-- Get 20 results.

SELECT *,
MONTH(rental_date) AS month,
WEEKDAY(rental_date) AS weekday
FROM rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday'
-- depending on the rental day of the week.

SELECT *,
CASE
WHEN WEEKDAY(rental_date) BETWEEN 0 AND 4 THEN 'Weekday'
WHEN WEEKDAY(rental_date) BETWEEN 5 AND 6 THEN 'Weekend'
END AS day_type
FROM rental;

-- 9. Get release years

-- I'm not sure what exactly is asked for here, the release year per film:
SELECT title, release_year 
FROM film;

-- Or the unique release years:
SELECT DISTINCT release_year
FROM film;
-- All films are from 2006


-- 10. Get all films with ARMAGEDDON in the title.
SELECT *
FROM film
WHERE title LIKE '%Armageddon%';

-- 11. Get all films which title ends with APOLLO.
SELECT *
FROM film
WHERE title LIKE '%Apollo';

-- 12. Get 10 the longest films.
SELECT * 
FROM film
ORDER BY length DESC
LIMIT 10;

-- 13.How many films include Behind the Scenes content?
SELECT count(*)
FROM film
WHERE special_features LIKE '%Behind the scenes%';
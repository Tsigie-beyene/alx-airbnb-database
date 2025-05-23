# Task 0 - Complex Joins

## Objective
Write queries using INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.

## Queries
- INNER JOIN between bookings and users.
- LEFT JOIN between properties and reviews.
- FULL OUTER JOIN between users and bookings.

 # Task 1 - Practice Subqueries

This task demonstrates the use of both non-correlated and correlated subqueries in the Airbnb database.

## Subqueries Implemented

### 1. Non-Correlated Subquery
We retrieve all properties that have an average review rating greater than 4.0:

```sql
SELECT *
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);


# Task 2 - Apply Aggregations and Window Functions

This task applies SQL aggregation and window functions to analyze user and property activity within the Airbnb database.

## Queries Implemented

### 1. Total Bookings by Each User

We use the COUNT aggregation function and GROUP BY clause to find how many bookings each user has made:

```sql
SELECT
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;


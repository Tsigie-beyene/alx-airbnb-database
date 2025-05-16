-- Initial Unoptimized Query
-- This query joins all data from bookings, users, properties, and payments.

EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
ORDER BY b.start_date;

-- Optimized Query
-- We select only needed columns, assuming indexes already exist on:
-- bookings(user_id), bookings(property_id), payments(booking_id), bookings(start_date)

EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
ORDER BY b.start_date;

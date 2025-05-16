-- Initial Unoptimized Query with WHERE and AND clauses
-- Retrieve bookings for active users and confirmed payments within a date range

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
WHERE u.is_active = TRUE
  AND pay.status = 'confirmed'
  AND b.start_date >= '2024-01-01'
ORDER BY b.start_date;

-- Optimized Query
-- Reduced columns, kept filtering, assuming appropriate indexes

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
WHERE u.is_active = TRUE
  AND pay.status = 'confirmed'
  AND b.start_date >= '2024-01-01'
ORDER BY b.start_date;

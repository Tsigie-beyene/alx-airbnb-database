-- INNER JOIN: All bookings with user details
SELECT b.id AS booking_id, u.id AS user_id, u.name, b.property_id, b.start_date, b.end_date
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- LEFT JOIN: All properties with or without reviews
SELECT p.id AS property_id, p.title, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

-- FULL OUTER JOIN: All users and all bookings
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;

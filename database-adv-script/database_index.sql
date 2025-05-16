-- BEFORE INDEXING: Analyze performance of a JOIN-heavy query
EXPLAIN ANALYZE
SELECT b.id, u.name, p.name
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.start_date >= '2024-01-01'
ORDER BY b.start_date;

-- CREATE INDEX commands for optimization

-- Index on user_id in bookings (for JOINs)
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);

-- Index on property_id in bookings (for JOINs)
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);

-- Index on start_date in bookings (for filtering and ordering)
CREATE INDEX IF NOT EXISTS idx_bookings_start_date ON bookings(start_date);

-- Index on users email (for authentication WHERE clauses)
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);

-- Index on location in properties (for search/filter)
CREATE INDEX IF NOT EXISTS idx_properties_location ON properties(location);

-- AFTER INDEXING: Analyze performance again
EXPLAIN ANALYZE
SELECT b.id, u.name, p.name
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.start_date >= '2024-01-01'
ORDER BY b.start_date;

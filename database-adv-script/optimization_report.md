# Optimization Report for Complex Query

## Initial Query

The original query joins four tables: `bookings`, `users`, `properties`, and `payments` to retrieve full booking data.

While functional, the query:
- Selected **more columns than necessary** (e.g., full email, full location).
- Didn't take advantage of **index optimization**.
- Had potential for **slower performance** due to heavy joins and unindexed ORDER BY.

---

## Performance Analysis

### Tools Used:
- `EXPLAIN ANALYZE` to check query cost and execution time.

### Observations:
- Sequential scan on large tables.
- Higher cost on ORDER BY due to lack of index on `start_date`.

---

## Optimizations Applied

1. **Reduced Columns Selected**
   - Only pulled relevant columns like `booking_id`, `user_name`, `property_name`, and `amount`.

2. **Confirmed Indexes Exist**
   - `bookings(user_id)`
   - `bookings(property_id)`
   - `bookings(start_date)`
   - `payments(booking_id)`

3. **Kept ORDER BY**, assuming `start_date` is indexed to avoid full sort.

---

## Result

After refactoring:
- **Query execution time improved** (based on EXPLAIN ANALYZE).
- **Fewer disk reads**.
- **Faster ORDER BY**, due to index on `bookings.start_date`.

---

## Conclusion

Optimizing joins, selecting fewer columns, and using indexes effectively reduces query execution time and improves scalability.

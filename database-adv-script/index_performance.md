# Task 3 - Index Performance Report

## Objective
Improve database performance by creating indexes on high-usage columns in the `users`, `bookings`, and `properties` tables.

---

## Indexes Created

| Table     | Column         | Reason for Indexing                         |
|-----------|----------------|---------------------------------------------|
| bookings  | user_id        | Frequently used in JOINs and WHERE clauses  |
| bookings  | property_id    | Used in JOINs to link with properties       |
| bookings  | start_date     | Used in ORDER BY and filtering queries      |
| users     | email          | Used in WHERE clause for login/auth         |
| properties| location       | Used in search filters                      |

---

## Performance Before Indexing

**Query Example:**
```sql
SELECT b.id, u.name, p.name
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.start_date >= '2024-01-01'
ORDER BY b.start_date;

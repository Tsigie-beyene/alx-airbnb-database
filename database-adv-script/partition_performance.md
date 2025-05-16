# Partition Performance Report

## Project: Airbnb Database Advanced Querying  
### Task: Partitioning Large Tables  

---

### Overview

The Booking table was partitioned by `start_date` using RANGE partitioning. Separate partitions were created for years 2023, 2024, and 2025 to optimize query performance for date range queries.

---

### Test Queries

Example test query before partitioning:

```sql
SELECT * FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

# Performance Monitoring and Refinement Report

## Project: Airbnb Database Advanced Querying  
### Task: Monitor and Refine Database Performance

---

### 1. Monitored Queries

Several frequently used queries were monitored using `EXPLAIN ANALYZE` to assess performance. Below are examples:

- Query 1: Retrieve all bookings with user and property details.
- Query 2: Fetch properties with average rating above 4.0.
- Query 3: List users with more than 3 bookings.

---

### 2. EXPLAIN ANALYZE Results and Bottlenecks

**Query 1:**

- Issue: Sequential scan on large Booking table caused high execution time.
- Example snippet:

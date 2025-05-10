# Database Normalization – Airbnb Database Project

## Objective

To ensure the database schema adheres to the principles of database normalization, specifically up to the Third Normal Form (3NF), eliminating redundancy and ensuring data integrity.

---

## Step-by-Step Normalization Process

### 🔹 First Normal Form (1NF)
**Definition**: A table is in 1NF if:
- Each column contains atomic (indivisible) values.
- Each record is unique.
- There are no repeating groups or arrays.

**Applied in our schema**:
- All attributes hold atomic values (e.g., `first_name`, `email`, `start_date`).
- No multivalued or nested fields exist.
- Each table has a defined `PRIMARY KEY` ensuring uniqueness.
✅ **All tables satisfy 1NF.**

---

### 🔹 Second Normal Form (2NF)
**Definition**: A table is in 2NF if:
- It is in 1NF.
- All non-key attributes are fully functionally dependent on the entire primary key.

**Applied in our schema**:
- All tables with composite keys (if any) ensure no partial dependency exists. However, in this schema, each table uses a **single-attribute primary key (UUID)**, so this condition is inherently satisfied.
- Example: In the `Booking` table, `total_price`, `start_date`, and `end_date` depend entirely on `booking_id`.

✅ **All tables satisfy 2NF.**

---

### 🔹 Third Normal Form (3NF)
**Definition**: A table is in 3NF if:
- It is in 2NF.
- There are no transitive dependencies (i.e., non-key attributes do not depend on other non-key attributes).

**Applied in our schema**:
- All non-key attributes directly depend on the primary key of their table and not on any other non-key column.
- Example: In the `User` table, `role` is not derived from any other column like `email`.
- No derived or calculated fields are stored (e.g., `total_price` is assumed to be calculated at booking time and stored for history, which is acceptable).

✅ **All tables satisfy 3NF.**

---

## Review of Potential Redundancies

| Table     | Checked For                 | Result                     |
|-----------|-----------------------------|----------------------------|
| User      | Duplicate contact info      | `email` is UNIQUE          |
| Property  | Host data inlined?          | No, linked by `host_id`    |
| Booking   | Derived price info?         | `total_price` stored for record-keeping |
| Review    | Redundant property/user info| All linked by foreign keys |
| Message   | Sender/recipient redundancy | Handled by user relations  |

---

## Summary

After analyzing the Airbnb database schema, we confirm that:

- Each table is in **First Normal Form** (no repeating groups or arrays).
- The schema meets **Second Normal Form** (non-key columns fully depend on primary keys).
- The design is in **Third Normal Form** (no transitive dependencies).

As such, the schema is normalized up to 3NF and adheres to best practices for scalable, clean relational database design.

---

## Optional Notes

- ENUMs are used to enforce controlled vocabularies (`role`, `status`, `payment_method`), which supports data consistency without violating normalization.
- Timestamp fields (`created_at`, `updated_at`) are for tracking and do not affect normal form compliance.


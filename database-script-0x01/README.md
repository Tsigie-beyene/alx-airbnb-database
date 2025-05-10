# Airbnb Database Schema

This directory contains the SQL schema definition (`schema.sql`) for the ALX Airbnb-like application database.

## Files

- `schema.sql`: Contains the full SQL Data Definition Language (DDL) script to create tables, define keys, constraints, and indexes for optimal performance.

## Database Features

- ✅ Fully normalized schema (up to 3NF)
- 🔐 Strong data integrity with foreign keys and constraints
- ⚡ Indexed columns for performance (e.g., `email`, `property_id`, `booking_id`)
- 🧠 ENUM types used for controlled fields like `role`, `status`, and `payment_method`

## Entities Covered

- User
- Property
- Booking
- Payment
- Review
- Message

To apply the schema, run:

```bash
psql -U <username> -d <your_database_name> -f schema.sql

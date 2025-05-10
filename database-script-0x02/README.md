# Airbnb Database Sample Data

This directory contains the `seed.sql` file used to populate the Airbnb-like database with sample data for testing and demonstration.

## Files

- `seed.sql`: SQL script containing realistic `INSERT` statements for all entities.

## Sample Data Coverage

- 👤 Users: 3 users (guest, host, admin)
- 🏠 Properties: 2 listings with different locations and prices
- 📅 Bookings: 2 bookings by the guest user
- 💳 Payments: Payments linked to bookings
- ⭐ Reviews: Ratings and feedback by the guest
- 💬 Messages: Communication between guest and host

## Usage

To populate the database, run:

```bash
psql -U <username> -d <your_database_name> -f seed.sql

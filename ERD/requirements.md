# ER Diagram Requirements – Airbnb Database Project

## Overview

This document describes the Entity-Relationship Diagram (ERD) for the Airbnb-like database system, as part of the ALX DataScape project. The ERD visually models the structure of the database, including all core entities, their attributes, and the relationships between them. This design ensures data integrity, normalization, and support for key business logic such as bookings, reviews, and payments.

## Entities and Attributes

### 1. User
Represents a person using the platform, including guests, hosts, and admins.

- **user_id**: UUID (Primary Key, Indexed)
- **first_name**: VARCHAR, NOT NULL
- **last_name**: VARCHAR, NOT NULL
- **email**: VARCHAR, UNIQUE, NOT NULL
- **password_hash**: VARCHAR, NOT NULL
- **phone_number**: VARCHAR, NULL
- **role**: ENUM (guest, host, admin), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 2. Property
Represents a rental listing posted by a host.

- **property_id**: UUID (Primary Key, Indexed)
- **host_id**: UUID (Foreign Key → User.user_id)
- **name**: VARCHAR, NOT NULL
- **description**: TEXT, NOT NULL
- **location**: VARCHAR, NOT NULL
- **pricepernight**: DECIMAL, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### 3. Booking
Represents a reservation made by a guest for a property.

- **booking_id**: UUID (Primary Key, Indexed)
- **property_id**: UUID (Foreign Key → Property.property_id)
- **user_id**: UUID (Foreign Key → User.user_id)
- **start_date**: DATE, NOT NULL
- **end_date**: DATE, NOT NULL
- **total_price**: DECIMAL, NOT NULL
- **status**: ENUM (pending, confirmed, canceled), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 4. Payment
Captures payment details for a booking.

- **payment_id**: UUID (Primary Key, Indexed)
- **booking_id**: UUID (Foreign Key → Booking.booking_id)
- **amount**: DECIMAL, NOT NULL
- **payment_date**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **payment_method**: ENUM (credit_card, paypal, stripe), NOT NULL

### 5. Review
Allows users to leave feedback and ratings for a property.

- **review_id**: UUID (Primary Key, Indexed)
- **property_id**: UUID (Foreign Key → Property.property_id)
- **user_id**: UUID (Foreign Key → User.user_id)
- **rating**: INTEGER, CHECK (rating >= 1 AND rating <= 5), NOT NULL
- **comment**: TEXT, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 6. Message
Enables messaging between users.

- **message_id**: UUID (Primary Key, Indexed)
- **sender_id**: UUID (Foreign Key → User.user_id)
- **recipient_id**: UUID (Foreign Key → User.user_id)
- **message_body**: TEXT, NOT NULL
- **sent_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Relationships Between Entities

- A **User** can have multiple **Bookings**.
- A **User** can own multiple **Properties** (if their role is 'host').
- A **Booking** is associated with exactly one **Property** and one **User** (guest).
- A **Payment** belongs to exactly one **Booking**.
- A **Review** is given by a **User** and belongs to a **Property**.
- A **User** can send and receive many **Messages** (self-referencing relationship via sender_id and recipient_id).

---

## Notes

- All foreign keys are indexed by default to optimize JOIN operations.
- The database is designed with 3NF normalization in mind: no redundancy, no partial or transitive dependencies.
- Each table includes a timestamp column for tracking creation time, and some include update time for audit purposes.
- ENUMs are used for controlled values in fields like role, status, and payment_method.

---

## Visual ERD

Please refer to the Draw.io (or PDF/PNG) file in this directory named `airbnb-erd.drawio` or `airbnb-erd.png` for the visual representation.

---



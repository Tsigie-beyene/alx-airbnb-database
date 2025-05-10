-- Ensure tables are clean before inserting new data
DELETE FROM Message;
DELETE FROM Review;
DELETE FROM Payment;
DELETE FROM Booking;
DELETE FROM Property;
DELETE FROM User;

-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '0987654321', 'host'),
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Admin', 'charlie@admin.com', 'hashed_pw_3', NULL, 'admin');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 'Sunny Apartment', 'A cozy place in the city center.', 'Addis Ababa', 50.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '22222222-2222-2222-2222-222222222222', 'Mountain Retreat', 'A peaceful retreat in the mountains.', 'Bahir Dar', 70.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('b1b1b1b1-b1b1-b1b1-b1b1-b1b1b1b1b1b1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2025-06-01', '2025-06-05', 200.00, 'confirmed'),
('b2b2b2b2-b2b2-b2b2-b2b2-b2b2b2b2b2b2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '11111111-1111-1111-1111-111111111111', '2025-06-10', '2025-06-12', 140.00, 'pending');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('p1p1p1p1-p1p1-p1p1-p1p1-p1p1p1p1p1p1', 'b1b1b1b1-b1b1-b1b1-b1b1-b1b1b1b1b1b1', 200.00, 'credit_card'),
('p2p2p2p2-p2p2-p2p2-p2p2-p2p2p2p2p2p2', 'b2b2b2b2-b2b2-b2b2-b2b2-b2b2b2b2b2b2', 140.00, 'paypal');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('r1r1r1r1-r1r1-r1r1-r1r1-r1r1r1r1r1r1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 5, 'Fantastic experience!'),
('r2r2r2r2-r2r2-r2r2-r2r2-r2r2r2r2r2r2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '11111111-1111-1111-1111-111111111111', 4, 'Great view and peaceful stay.');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('m1m1m1m1-m1m1-m1m1-m1m1-m1m1m1m1m1m1', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Is the property available in June?'),
('m2m2m2m2-m2m2-m2m2-m2m2-m2m2m2m2m2m2', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Yes, it is available from June 1.');

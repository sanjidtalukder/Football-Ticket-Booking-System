-- ==========================================================
-- Football Ticket Booking System
-- QUERY.sql
-- Author: Sanjid Talukder
-- ==========================================================


-- ==========================================================
-- Query 1
-- Retrieve all upcoming football matches belonging to the
-- 'Champions League' where the match status is 'Available'.
-- ==========================================================

SELECT
    match_id,
    fixture,
    base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League'
  AND match_status = 'Available';



-- ==========================================================
-- Query 2
-- Search for all users whose full names start with 'Tanvir'
-- or contain the phrase 'Haque' (case-insensitive).
-- ==========================================================

SELECT
    user_id,
    full_name,
    email
FROM users
WHERE full_name ILIKE 'Tanvir%'
   OR full_name ILIKE '%Haque%';



-- ==========================================================
-- Query 3
-- Retrieve booking records where payment status is NULL,
-- replacing NULL with 'Action Required'.
-- ==========================================================

SELECT
    booking_id,
    user_id,
    match_id,
    COALESCE(payment_status, 'Action Required') AS systematic_status
FROM bookings
WHERE payment_status IS NULL;



-- ==========================================================
-- Query 4
-- Retrieve booking details with user's full name
-- and match fixture.
-- ==========================================================

SELECT
    b.booking_id,
    u.full_name,
    m.fixture,
    b.total_cost
FROM bookings b
INNER JOIN users u
    ON b.user_id = u.user_id
INNER JOIN matches m
    ON b.match_id = m.match_id;



-- ==========================================================
-- Query 5
-- Display all users and their booking IDs,
-- including users who have never booked a ticket.
-- ==========================================================

SELECT
    u.user_id,
    u.full_name,
    b.booking_id
FROM users u
LEFT JOIN bookings b
    ON u.user_id = b.user_id;



-- ==========================================================
-- Query 6
-- Find all bookings where total cost is
-- greater than the average booking cost.
-- ==========================================================

SELECT
    booking_id,
    match_id,
    total_cost
FROM bookings
WHERE total_cost >
(
    SELECT AVG(total_cost)
    FROM bookings
);



-- ==========================================================
-- Query 7
-- Retrieve the top 2 most expensive matches,
-- skipping the highest priced match.
-- ==========================================================

SELECT
    match_id,
    fixture,
    base_ticket_price
FROM matches
ORDER BY base_ticket_price DESC
LIMIT 2 OFFSET 1;
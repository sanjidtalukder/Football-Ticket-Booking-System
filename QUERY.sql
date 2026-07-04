
-- Query 1

SELECT
    match_id,
    fixture,
    base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League'
  AND match_status = 'Available';


-- Query 2

SELECT
    user_id,
    full_name,
    email
FROM users
WHERE full_name ILIKE 'Tanvir%'
   OR full_name ILIKE '%Haque%';



-- Query 3

SELECT
    booking_id,
    user_id,
    match_id,
    COALESCE(payment_status, 'Action Required') AS systematic_status
FROM bookings
WHERE payment_status IS NULL;



-- Query 4

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



-- Query 5

SELECT
    u.user_id,
    u.full_name,
    b.booking_id
FROM users u
LEFT JOIN bookings b
    ON u.user_id = b.user_id;




-- Query 6

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




-- Query 7

SELECT
    match_id,
    fixture,
    base_ticket_price
FROM matches
ORDER BY base_ticket_price DESC
LIMIT 2 OFFSET 1;
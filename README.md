# Football Ticket Booking System

## ERD Design

![Football Ticket Booking System ERD](./Design%20the%20ERD.drawio.png)
<img src="./Design%20the%20ERD.drawio.png" alt="Football Ticket Booking System ERD" width="100%">

## Project Overview

The Football Ticket Booking System is a PostgreSQL database project for managing football match ticket bookings. It demonstrates relational database design, entity relationships, sample data insertion, and practical SQL queries.

## Database Structure

### users

Stores user information for football fans and ticket managers.

| Column | Type | Description |
| --- | --- | --- |
| `user_id` | `INT` | Primary key for each user |
| `full_name` | `VARCHAR(100)` | User's full name |
| `email` | `VARCHAR(100)` | User's email address |
| `role` | `VARCHAR(50)` | User role, such as fan or manager |
| `phone_number` | `VARCHAR(20)` | User contact number |

### matches

Stores football match information and ticket pricing.

| Column | Type | Description |
| --- | --- | --- |
| `match_id` | `INT` | Primary key for each match |
| `fixture` | `VARCHAR(100)` | Match fixture name |
| `tournament_category` | `VARCHAR(100)` | Tournament or league category |
| `base_ticket_price` | `DECIMAL(10,2)` | Base ticket price for the match |
| `match_status` | `VARCHAR(50)` | Current ticket availability status |

### bookings

Stores ticket booking records for users and matches.

| Column | Type | Description |
| --- | --- | --- |
| `booking_id` | `INT` | Primary key for each booking |
| `user_id` | `INT` | Foreign key referencing `users(user_id)` |
| `match_id` | `INT` | Foreign key referencing `matches(match_id)` |
| `seat_number` | `VARCHAR(20)` | Assigned seat number |
| `payment_status` | `VARCHAR(50)` | Booking payment status |
| `total_cost` | `DECIMAL(10,2)` | Final booking cost |

## Relationships

- One user can make many bookings.
- One match can have many bookings.
- Each booking belongs to one user and one match.

## SQL Features Covered

- Table creation with primary keys and foreign keys
- Data insertion
- Filtering with `WHERE`
- Pattern matching with `ILIKE`
- Handling `NULL` values with `COALESCE`
- `INNER JOIN` and `LEFT JOIN`
- Subqueries with aggregate functions
- Sorting, `LIMIT`, and `OFFSET`

## Sample Queries

### Query 1: Available Champions League Matches

Retrieves all upcoming football matches from the `Champions League` where tickets are currently available.

```sql
SELECT
    match_id,
    fixture,
    base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League'
  AND match_status = 'Available';
```

### Query 2: Search Users by Name

Searches for users whose full names start with `Tanvir` or contain `Haque`, using case-insensitive matching.

```sql
SELECT
    user_id,
    full_name,
    email
FROM users
WHERE full_name ILIKE 'Tanvir%'
   OR full_name ILIKE '%Haque%';
```

### Query 3: Pending Payment Action

Finds bookings where the payment status is missing and displays `Action Required` instead of `NULL`.

```sql
SELECT
    booking_id,
    user_id,
    match_id,
    COALESCE(payment_status, 'Action Required') AS systematic_status
FROM bookings
WHERE payment_status IS NULL;
```

### Query 4: Booking Details with User and Match

Shows booking details together with the user's full name and match fixture.

```sql
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
```

### Query 5: All Users with Booking IDs

Displays every user and their booking ID, including users who have not booked any ticket yet.

```sql
SELECT
    u.user_id,
    u.full_name,
    b.booking_id
FROM users u
LEFT JOIN bookings b
    ON u.user_id = b.user_id;
```

### Query 6: Above Average Booking Cost

Finds bookings where the total cost is greater than the average booking cost.

```sql
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
```

### Query 7: Top Expensive Matches with Offset

Retrieves the top 2 most expensive matches after skipping the highest priced match.

```sql
SELECT
    match_id,
    fixture,
    base_ticket_price
FROM matches
ORDER BY base_ticket_price DESC
LIMIT 2 OFFSET 1;
```

## How to Run

1. Open PostgreSQL or pgAdmin 4.
2. Create a new database.
3. Run `schema.sql` to create the tables.
4. Run `insert_data.sql` to insert sample records.
5. Run `QUERY.sql` to test the sample queries.

## Project Files

| File | Description |
| --- | --- |
| `Design the ERD.drawio.png` | ERD diagram for the database design |
| `schema.sql` | SQL script for creating database tables |
| `insert_data.sql` | SQL script for inserting sample data |
| `QUERY.sql` | Collection of sample SQL queries |
| `README.md` | Project documentation |

## Author

Sanjid Talukder

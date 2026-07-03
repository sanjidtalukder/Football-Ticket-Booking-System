# Football Ticket Booking System

## ERD Design

![Football Ticket Booking System ERD](./Design%20the%20ERD.drawio.png)

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

/* F23 ENSF 480 Term Project Databases
 
 */
DROP DATABASE IF EXISTS BILLING;
CREATE DATABASE BILLING; 

DROP DATABASE IF EXISTS AIRLINE;
CREATE DATABASE AIRLINE; 

USE AIRLINE;

-- Create Aircrafts table
CREATE TABLE Aircrafts (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    aircraft_name VARCHAR(50) NOT NULL
);

-- Insert sample data into Aircrafts table
INSERT INTO Aircrafts (aircraft_name)
VALUES
    ('Boeing 747'),
    ('Airbus A320');

-- Create Users table
CREATE TABLE RegisteredUsers (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    pass VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    user_type INT NOT NULL,
    is_logged_in BOOLEAN
    -- other user-related columns
);

INSERT INTO RegisteredUsers (username, pass, email, user_type, is_logged_in) VALUES
    ('Ryan123', '1234', 'ryankhryss@gmail.com', 0, FALSE),
    ('Raina123', '1234', 'rjugdev@gmail.com', 0, FALSE),
    ('Abe123', '1234', 'coolibey@gmail.com', 0, FALSE),
    ('Tanzi123', '1234', 'tanzic01@gmail.com', 1, FALSE),
    ('Eve112', '1234', 'eve@example.com', 1, FALSE),
	('AAbob', '1234', 'eve@example.com', 3, FALSE),
	('AAbill', '1234', 'eve@example.com', 3, FALSE),
	('Fbob', '1234', 'eve@example.com', 2, FALSE),
	('Fbill', '1234', 'eve@example.com', 2, FALSE);


CREATE TABLE Promos (
    promoName VARCHAR(50) NOT NULL,
    promo_code VARCHAR(20) NOT NULL,
    discount_amount INT NOT NULL
);

-- Insert sample data into Promos table
INSERT INTO Promos (promoName, promo_code, discount_amount) VALUES
    ('Winter Discount', 'WINTERBURRRR', 10),
    ('Seat Promo', 'SEATPROMO123', 15),
    ('Flight Promo', 'FLIGHTPROMO123', 20);

-- Create Flights table
CREATE TABLE Flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(20) NOT NULL,
    departure_location VARCHAR(50) NOT NULL,
    arrival_location VARCHAR(50) NOT NULL,
    departure_time VARCHAR(50) NOT NULL,
    arrival_time VARCHAR(50) NOT NULL,
    departure_date VARCHAR(50) NOT NULL,
    arrival_date VARCHAR(50) NOT NULL,
    aircraft_id INT,
    base_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (aircraft_id) REFERENCES Aircrafts(aircraft_id)
    -- other flight-related columns
);

-- Insert sample data into Flights table
INSERT INTO Flights (flight_number, departure_location, arrival_location, departure_time, arrival_time, departure_date, arrival_date, aircraft_id, base_price)
VALUES
    ('FL123', 'Chicago', 'New York', '08:00:00', '10:00:00', '2023-12-01', '2023-12-01', 1, 100.00),
    ('FL456', 'Calgary', 'Quebec', '12:00:00', '17:00:00', '2023-12-04', '2023-12-04', 2, 150.00),
	('FL222', 'Calgary', 'Vancouver', '01:00:00', '02:00:00', '2023-12-05', '2023-12-05', 2, 200.00);

-- Create Seats table
CREATE TABLE Seats (
    seat_id INT PRIMARY KEY AUTO_INCREMENT,
    -- flight_id INT,
    seat_row ENUM('A', 'B', 'C', 'D', 'E', 'F'), 
    seat_number VARCHAR(10),
    seat_type ENUM('Ordinary', 'Business', 'Comfort'),
    flight_id INT,
	booked BOOLEAN,
	FOREIGN KEY (flight_id) REFERENCES FLIGHTS(flight_id)
    -- Add other seat-related columns as needed
    -- FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Assuming all seats are initially available
INSERT INTO Seats (seat_id, seat_row, seat_number, seat_type, booked, flight_id) VALUES
(1, 'A', '1', 'Business', FALSE, 1),
(2, 'A', '2', 'Business', FALSE, 1),
(3, 'B', '3', 'Business', FALSE, 1),
(4, 'B', '4', 'Business', FALSE, 1),
(5, 'C', '5', 'Comfort', FALSE, 1),
(6, 'C', '6', 'Comfort', FALSE, 1),
(7, 'D', '7', 'Comfort', FALSE, 1),
(8, 'D', '8', 'Comfort', FALSE, 1),
(9, 'E', '9', 'Ordinary', FALSE, 1),
(10, 'E', '10', 'Ordinary', FALSE, 1),
(11, 'F', '11', 'Ordinary', FALSE, 1),
(12, 'F', '12', 'Ordinary', FALSE, 1),
(13, 'A', '1', 'Business', FALSE, 2),
(14, 'A', '2', 'Business', FALSE, 2),
(15, 'B', '3', 'Business', FALSE, 2),
(16, 'B', '4', 'Business', FALSE, 2),
(17, 'C', '5', 'Comfort', FALSE, 2),
(18, 'C', '6', 'Comfort', FALSE, 2),
(19, 'D', '7', 'Comfort', FALSE, 2),
(20, 'D', '8', 'Comfort', FALSE, 2),
(21, 'E', '9', 'Ordinary', FALSE, 2),
(22, 'E', '10', 'Ordinary', FALSE, 2),
(23, 'F', '11', 'Ordinary', FALSE, 2),
(24, 'F', '12', 'Ordinary', FALSE, 2),
(25, 'A', '1', 'Business', FALSE, 3),
(26, 'A', '2', 'Business', FALSE, 3),
(27, 'B', '3', 'Business', FALSE, 3),
(28, 'B', '4', 'Business', FALSE, 3),
(29, 'C', '5', 'Comfort', FALSE, 3),
(30, 'C', '6', 'Comfort', FALSE, 3),
(31, 'D', '7', 'Comfort', FALSE, 3),
(32, 'D', '8', 'Comfort', FALSE, 3),
(33, 'E', '9', 'Ordinary', FALSE, 3),
(34, 'E', '10', 'Ordinary', FALSE, 3),
(35, 'F', '11', 'Ordinary', FALSE, 3),
(36, 'F', '12', 'Ordinary', FALSE, 3);

-- Create Tickets table
CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    flight_id INT,
    seat_id INT,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id),
    FOREIGN KEY (user_id) REFERENCES RegisteredUsers(user_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Insert sample data into Tickets table
INSERT INTO Tickets (flight_id, user_id, seat_id, price)
VALUES
    (1, 1, 1, 100.00),
    (2, 2, 2, 100.00);

USE BILLING;
	-- Inside billingDB

	-- Create Payments table
	CREATE TABLE Payments (
		payment_id INT PRIMARY KEY AUTO_INCREMENT,
        seat_id INT,
		user_id INT,
		flight_id INT,
		payment_amount DECIMAL(10, 2) NOT NULL,
		credit_card_number VARCHAR(16) NOT NULL,
		expiration_date VARCHAR(5) NOT NULL,
        CVV INT,
		-- other payment-related columns
        FOREIGN KEY (seat_id) REFERENCES AIRLINE.Seats(seat_id),
		FOREIGN KEY (user_id) REFERENCES AIRLINE.RegisteredUsers(user_id),
		FOREIGN KEY (flight_id) REFERENCES AIRLINE.Flights(flight_id)
	);
    
-- Drop the existing user (use with caution)
DROP USER 'user'@'localhost';
    
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON AIRLINE.* TO 'user'@'localhost';

GRANT ALL PRIVILEGES ON BILLING.* TO 'user'@'localhost';

FLUSH PRIVILEGES;

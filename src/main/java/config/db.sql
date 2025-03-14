USE mccabsdb1;

-- 1. Create the drivers table first
CREATE TABLE drivers (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(100),
                         phone VARCHAR(15),
                         nic VARCHAR(50) UNIQUE,
                         status VARCHAR(15)
);

-- 2. Create the users table
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       name VARCHAR(100),
                       address VARCHAR(255),
                       phone VARCHAR(15),
                       nic VARCHAR(12) UNIQUE,
                       email VARCHAR(100) NOT NULL,
                       password VARCHAR(100) NOT NULL
);

-- 3. Create the bookings table
CREATE TABLE bookings (
                          booking_id INT AUTO_INCREMENT PRIMARY KEY,
                          username VARCHAR(255),
                          customer_name VARCHAR(255),
                          address VARCHAR(255),
                          phone VARCHAR(15),
                          pickup_location VARCHAR(255),
                          destination VARCHAR(255),
                          car_no VARCHAR(20),
                          fee VARCHAR(50),
                          status VARCHAR(255),
                          booking_date TIMESTAMP,
                          bill VARCHAR(255)
);

-- 4. Create the cars table (driver_id changed to INT)
CREATE TABLE cars (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      car_categiry VARCHAR(50),
                      driver_id VARCHAR(50),
                      car_no VARCHAR(50) UNIQUE,
                      seat_count VARCHAR(20),
                      fee VARCHAR(50),
                      image VARCHAR(255),
                      status VARCHAR(50)
);

-- 5. Insert the admin details
INSERT INTO users (username, email, password) VALUES ('admin', 'admin@mccabs.com', 'admin');

CREATE DATABASE trainbookingDB;

CREATE TABLE booking_status (
	id INT PRIMARY NOT NULL,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE train_station (
	id INT PRIMARY KEY NOT NULL,
	station_name varchar(255) NOT NULL
);

CREATE TABLE passenger (
	id INT NOT NULL PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email_address VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL
);

CREATE TABLE schedule (
	id INT PRIMARY KEY NOT NULL,
	name varchar(255) NOT NULL
);

CREATE TABLE carriage_class (
	id INT PRIMARY KEY NOT NULL,
	class_name varchar(255) NOT NULL,
	seating_capacity INT NOT NULL
);

CREATE TABLE train_journey (
	id INT PRIMARY KEY NOT NULL,
	schedule_id INT NOT NULL,
	name INT NOT NULL,
	FOREIGN KEY (schedule_id) REFERENCES schedule (id)
);

CREATE TABLE journey_carriage (
	journey_id INT NOT NULL,
	carriage_class_id INT NOT NULL,
	position varchar(255) NOT NULL,
	FOREIGN KEY (journey_id) REFERENCES train_journey (id),
	FOREIGN KEY (carriage_class_id) REFERENCES carriage_class (id)
);

CREATE TABLE journey_station (
	journey_id INT NOT NULL,
	station_id INT NOT NULL,
	stop_order varchar(255) NOT NULL,
	FOREIGN KEY (journey_id) REFERENCES train_journey (id),
	FOREIGN KEY (station_id) REFERENCES train_station (id)
);

CREATE TABLE journey_price (
	schedule_id INT NOT NULL,
	carriage_class_id INT NOT NULL,
	price varchar(255) NOT NULL,
	FOREIGN KEY (schedule_id) REFERENCES schedule (id)
);

CREATE TABLE booking (
	id INT PRIMARY KEY NOT NULL,
	passenger_id INT NOT NULL,
	status_id INT NOT NULL,
	booking_date TIMESTAMP,
	starting_station_id INT NOT NULL,
	ending_station_id INT NOT NULL,
	train_journey_id INT NOT NULL,
	ticket_class_id INT NOT NULL,
	amount_paid INT NOT NULL,
	ticket_no varchar(255),
	seat_no INT,
	FOREIGN KEY (passenger_id) REFERENCES passenger (id),
	FOREIGN KEY (status_id) REFERENCES booking_status (id),
	FOREIGN KEY (starting_station_id) REFERENCES train_station (id),
	FOREIGN KEY (ending_station_id) REFERENCES train_station (id),
	FOREIGN KEY (train_journey_id) REFERENCES train_journey (id),
	FOREIGN KEY (ticket_class_id) REFERENCES carriage_class (id)
);
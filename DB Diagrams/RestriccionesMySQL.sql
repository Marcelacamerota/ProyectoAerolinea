-- Definir todas las claves primarias

ALTER TABLE aircrafts_data
ADD CONSTRAINT PK_aircrafts_data PRIMARY KEY (aircraft_code);

ALTER TABLE airports_data
ADD CONSTRAINT PK_airports_data PRIMARY KEY (airport_code);

ALTER TABLE bookings
ADD CONSTRAINT PK_bookings PRIMARY KEY (book_ref);

ALTER TABLE flights
ADD CONSTRAINT PK_flights PRIMARY KEY (flight_id);

ALTER TABLE tickets
ADD CONSTRAINT PK_tickets PRIMARY KEY (ticket_no);

ALTER TABLE seats
ADD CONSTRAINT PK_seats PRIMARY KEY (aircraft_code, seat_no);

-- Definir las claves foraneas

ALTER TABLE flights
ADD CONSTRAINT FK_flights_aircraft_code
FOREIGN KEY (aircraft_code) REFERENCES aircrafts_data(aircraft_code);

ALTER TABLE seats
ADD CONSTRAINT FK_seats_aircraft_code
FOREIGN KEY (aircraft_code) REFERENCES aircrafts_data(aircraft_code);

ALTER TABLE flights
ADD CONSTRAINT FK_flights_departure_airport
FOREIGN KEY (departure_airport) REFERENCES airports_data(airport_code);

ALTER TABLE flights
ADD CONSTRAINT FK_flights_arrival_airport
FOREIGN KEY (arrival_airport) REFERENCES airports_data(airport_code);

ALTER TABLE tickets
ADD CONSTRAINT FK_tickets_book_ref 
FOREIGN KEY (book_ref) REFERENCES bookings(book_ref);

ALTER TABLE boarding_passes
ADD CONSTRAINT FK_boarding_passes_ticket_no
FOREIGN KEY (ticket_no) REFERENCES tickets(ticket_no);

ALTER TABLE ticket_flights
ADD CONSTRAINT FK_ticket_flights_flight_id
FOREIGN KEY (flight_id) REFERENCES flights(flight_id);

ALTER TABLE ticket_flights
ADD CONSTRAINT FK_ticket_flights_ticket_no
FOREIGN KEY (ticket_no) REFERENCES tickets(ticket_no);


-- Garantizar que las claves primarias no sean nulas

ALTER TABLE aircrafts_data
MODIFY aircraft_code VARCHAR(50) NOT NULL;

ALTER TABLE airports_data
MODIFY airport_code VARCHAR(50) NOT NULL;

ALTER TABLE bookings
MODIFY book_ref VARCHAR(50) NOT NULL;

ALTER TABLE flights
MODIFY flight_id INT NOT NULL;

ALTER TABLE tickets
MODIFY ticket_no BIGINT NOT NULL;

ALTER TABLE seats
MODIFY aircraft_code VARCHAR(50) NOT NULL;

ALTER TABLE seats
MODIFY seat_no VARCHAR(50) NOT NULL;

-- Restricciones para garantizar la integridad de los datos insertados

-- Tabla airports
ALTER TABLE airports_data
ADD CONSTRAINT UQ_airport_name UNIQUE (airport_name);

ALTER TABLE airports_data
ADD CONSTRAINT UQ_coordinates UNIQUE (coordinates);

ALTER TABLE airports_data
MODIFY airport_name VARCHAR(100) NOT NULL;

-- Tabla boarding_passes
ALTER TABLE boarding_passes
ADD CONSTRAINT UQ_flight_ticket_no UNIQUE (flight_id, ticket_no);

ALTER TABLE boarding_passes
MODIFY ticket_no BIGINT NOT NULL;

ALTER TABLE boarding_passes
MODIFY flight_id INT NOT NULL;

ALTER TABLE boarding_passes
MODIFY boarding_no INT NOT NULL;

-- Tabla bookings

ALTER TABLE bookings
ADD CONSTRAINT CK_total_amount_positive CHECK (total_amount > 0);

ALTER TABLE bookings
MODIFY book_date DATETIME NOT NULL;

-- Tabla flights

ALTER TABLE flights
MODIFY flight_no VARCHAR(50) NOT NULL;

ALTER TABLE flights
MODIFY departure_airport VARCHAR(50) NOT NULL;

ALTER TABLE flights
MODIFY arrival_airport VARCHAR(50) NOT NULL;

ALTER TABLE flights
MODIFY aircraft_code VARCHAR(50) NOT NULL;

ALTER TABLE flights
MODIFY `status` VARCHAR(50) NOT NULL;

ALTER TABLE flights
ADD CONSTRAINT CK_status_valid CHECK (`status` IN ('Arrived', 'Delayed', 'On Time','Scheduled', 'Departed', 'Cancelled'));

-- Tabla seats

ALTER TABLE seats
MODIFY aircraft_code VARCHAR(50) NOT NULL;

ALTER TABLE seats
MODIFY seat_no VARCHAR(50) NOT NULL;

ALTER TABLE seats
ADD CONSTRAINT CK_fare_conditions_valid CHECK (fare_conditions IN ('Economy', 'Business', 'Comfort'));

-- Tabla ticket_flights

ALTER TABLE ticket_flights
MODIFY ticket_no BIGINT NOT NULL;

ALTER TABLE ticket_flights
MODIFY flight_id INT NOT NULL;

ALTER TABLE ticket_flights
ADD CONSTRAINT UQ_ticket_flight UNIQUE (ticket_no, flight_id);

ALTER TABLE ticket_flights
ADD CONSTRAINT CK_fare_conditions_TF_valid CHECK (fare_conditions IN ('Economy', 'Business', 'Comfort'));

ALTER TABLE ticket_flights
ADD CONSTRAINT CK_amount_positive CHECK (amount > 0);

-- Tabla tickets

ALTER TABLE tickets
MODIFY book_ref VARCHAR(50) NOT NULL;

ALTER TABLE tickets
MODIFY passenger_id VARCHAR(50) NOT NULL;



















-- Para conocer el Modelo relacional, arroja un error porque no reconoce a mi server como propietario
USE AirLine;
GO
EXEC sp_changedbowner 'sa';
GO

--Ahora podemos acceder al modelo pero no hay PK y FK creadas

--En primer termino, definir todas las PK
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

--Tabla seats: como la columna seat_no se repite, definimos una PK compuesta entre seat_no y aircraft_code ya que esas combinaciones si son unicas
ALTER TABLE seats
ADD CONSTRAINT PK_seats PRIMARY KEY (aircraft_code, seat_no);

--Tabla boarding_passes: como la columna boarding_no se repite, definimos una PK compuesta entre ticket_no y flight_id ya que esas combinaciones si son unicas
ALTER TABLE boarding_passes
ADD CONSTRAINT PK_boarding_passes PRIMARY KEY (ticket_no, flight_id);

--Tabla ticket_flights: tambien se define una PK compuesta
ALTER TABLE ticket_flights
ADD CONSTRAINT PK_ticket_flights PRIMARY KEY (ticket_no, flight_id);

--Ahora definir las FK

--Antes de definir la FK en seats debemos modificar el tipo de dato para que coincidan PK y FK
ALTER TABLE seats DROP CONSTRAINT PK_seats;--eliminar restricciones

ALTER TABLE seats
ALTER COLUMN aircraft_code NVARCHAR(50) NOT NULL;--Cambiar tipo de dato

ALTER TABLE seats
ADD CONSTRAINT PK_seats PRIMARY KEY (aircraft_code, seat_no);--Volver a crear la PK

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
ADD CONSTRAINT FK_boarding_passes_flight_id
FOREIGN KEY (flight_id) REFERENCES flights(flight_id);

ALTER TABLE ticket_flights
ADD CONSTRAINT FK_ticket_flights_flight_id
FOREIGN KEY (flight_id) REFERENCES flights(flight_id);

ALTER TABLE ticket_flights
ADD CONSTRAINT FK_ticket_flights_ticket_no
FOREIGN KEY (ticket_no) REFERENCES tickets(ticket_no);




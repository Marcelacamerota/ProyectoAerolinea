import pymysql
import os
import warnings
from dotenv import load_dotenv

warnings.filterwarnings('ignore')
load_dotenv()

user = os.getenv('USER')
pswd = os.getenv('PASSWORD')
host = os.getenv('HOST')
dbName = os.getenv('DB_NAME')
port = int(os.getenv('PORT'))

connection = pymysql.connect(host = host, user = user, passwd = pswd, database = dbName, port = port)
cursor = connection.cursor()
cursor.execute("SHOW DATABASES")
for base in cursor:
    print(base)
connection.close()

def get_connection():
    return pymysql.connect(
        host = host,
        user = user,
        passwd = pswd,
        database = dbName,
        port = port
    )

def insert_aircrafts_data(connection, aircraft_code, model, range):
    if not connection.open:
        connection = get_connection()

    query = 'INSERT INTO aircrafts_data (aircraft_code, model, `range`) VALUES (%s, %s, %s)'
    try:
        with connection.cursor() as cursor:
            cursor.execute(query, (aircraft_code, model, range))
            connection.commit()
            return cursor.rowcount
    except Exception as e:
        connection.rollback()
        print(f"Error al insertar: {e}")
        raise e
    finally:
        cursor.close()

def insert_airports_data(connection, airport_code, airport_name, city, coordinates, timezone):
    if not connection.open:
        connection = get_connection()

    query = 'INSERT INTO airports_data (airport_code, airport_name, city, coordinates, timezone) VALUES (%s, %s, %s, %s, %s)'
    try:
        with connection.cursor() as cursor:
            cursor.execute(query, (airport_code, airport_name, city, coordinates, timezone))
            connection.commit()
            return cursor.rowcount
    except Exception as e:
        connection.rollback()
        print(f"Error al insertar: {e}")
        raise e
    finally:
        cursor.close()

def insert_boarding_passes(connection, ticket_no, flight_id, boarding_no, seat_no):
    if not connection.open:
        connection = get_connection()

    query = 'INSERT INTO boarding_passes (ticket_no, flight_id, boarding_no, seat_no) VALUES (%s, %s, %s, %s)'
    try:
        with connection.cursor() as cursor:
            cursor.execute(query, (ticket_no, flight_id, boarding_no, seat_no))
            connection.commit()
            return cursor.rowcount
    except Exception as e:
        connection.rollback()
        print(f"Error al insertar: {e}")
        raise e
    finally:
        cursor.close()

def insert_bookings(connection, book_ref, book_date, total_amount):
    if not connection.open:
        connection = get_connection()

    query = 'INSERT INTO bookings (book_ref, book_date, total_amount) VALUES (%s, %s, %s)'
    try:
        with connection.cursor() as cursor:
            cursor.execute(query, (book_ref, book_date, total_amount))
            connection.commit()
            return cursor.rowcount
    except Exception as e:
        connection.rollback()
        print(f"Error al insertar: {e}")
        raise e
    finally:
        cursor.close()

def insert_flights(connection, flight_id, flight_no, scheduled_departure, scheduled_arrival, departure_airport, arrival_airport, status, aircraft_code, actual_departure, actual_arrival):
    if not connection.open:
        connection = get_connection()

    query = '''INSERT INTO flights (flight_id, flight_no, scheduled_departure, scheduled_arrival, departure_airport, arrival_airport, status, aircraft_code, actual_departure, actual_arrival)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'''
    try:
        with connection.cursor() as cursor:
            cursor.execute(query, (flight_id, flight_no, scheduled_departure, scheduled_arrival, departure_airport, arrival_airport, status, aircraft_code, actual_departure, actual_arrival))
            connection.commit()
            return cursor.rowcount
    except Exception as e:
        connection.rollback()
        print(f"Error al insertar: {e}")
        raise e
    finally:
        cursor.close()

def insert_seats(connection, aircraft_code, seat_no, fare_conditions):
    if not connection.open:
        connection = get_connection()

    query = 'INSERT INTO seats (aircraft_code, seat_no, fare_conditions) VALUES (%s, %s, %s)'
    try:
        with connection.cursor() as cursor:
            cursor.execute(query, (aircraft_code, seat_no, fare_conditions))
            connection.commit()
            return cursor.rowcount
    except Exception as e:
        connection.rollback()
        print(f"Error al insertar: {e}")
        raise e
    finally:
        cursor.close()

def insert_ticket_flights(connection, ticket_no, flight_id, fare_conditions, amount):
    if not connection.open:
        connection = get_connection()

    query = 'INSERT INTO ticket_flights (ticket_no, flight_id, fare_conditions, amount) VALUES (%s, %s, %s, %s)'
    try:
        with connection.cursor() as cursor:
            cursor.execute(query, (ticket_no, flight_id, fare_conditions, amount))
            connection.commit()
            return cursor.rowcount
    except Exception as e:
        connection.rollback()
        print(f"Error al insertar: {e}")
        raise e
    finally:
        cursor.close()

def insert_tickets(connection, ticket_no, book_ref, passenger_id):
    if not connection.open:
        connection = get_connection()

    query = 'INSERT INTO tickets (ticket_no, book_ref, passenger_id) VALUES (%s, %s, %s)'
    try:
        with connection.cursor() as cursor:
            cursor.execute(query, (ticket_no, book_ref, passenger_id))
            connection.commit()
            return cursor.rowcount
    except Exception as e:
        connection.rollback()
        print(f"Error al insertar: {e}")
        raise e
    finally:
        cursor.close()

print(insert_aircrafts_data(connection, '099', '{"en": "f14 tomkat", "ru": "test avion"}', 1920))
print(insert_airports_data(connection, 'AAA', '{"en": "aeropuerto en ingles", "ru": "aeropuerto en ruso"}', '{"en": "city ingles", "ru": "city ruso"}', '(123456, 87964)', 'Europa/Moscu'))
print(insert_boarding_passes(connection, '000564238', 9999, 60, '10A'))
print(insert_bookings(connection, '0ZZ999', '2024-11-24 20:30:00.0300000', 80000))
print(insert_flights(connection, 999999, 'MC1780', '2024-11-24 20:30:00.0300000', '2024-11-24 23:30:00.0300000', 'MRM', 'MAC', 'Scheduled', '999', 'N', 'N'))
print(insert_seats(connection, '319', '9Z', 'Ejecutivo'))
print(insert_ticket_flights(connection, 9933123599, 99999, 'Economica', 5000))
print(insert_tickets(connection, 993312358588, 'Z313ZZZ', '2024 65271999'))

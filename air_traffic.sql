-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

--Names of potential ticket holders
CREATE TABLE ticket_holder
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO ticket_holder
(first_name, last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Jennifer', 'Finch'),
('Waneta', 'Skeleton'),
('Thadeus', 'Gathercoal'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Berkie', 'Wycliff'),
('Cory', 'Squibbes');

--Names of airlines for people to travel on
CREATE TABLE Airlines
(
  id SERIAL PRIMARY Key,
  name TEXT 
);

INSERT INTO Airlines
(name)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

-- Name of Countries
CREATE TABLE Countries
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NuLL
);

INSERT INTO Countries
(name)
VALUES
('United States'),
('Japan'),
('France'),
('UAE'),
('Brazil'),
('United Kingdom'),
('Mexico'),
('China'),
('Morocco'),
('Chile');



CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  ticket_Owner INTEGER REFERENCES ticket_holder(id),
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES Airlines(id),
  from_city TEXT NOT NULL,
  from_country INTEGER REFERENCES Countries(id),
  to_city TEXT NOT NULL,
  to_country INTEGER REFERENCES Countries(id)
);

INSERT INTO tickets
  (ticket_Owner, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  (1 , '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1 , 'Washington DC', 1 , 'Seattle', 1 ),
  ( 2 , '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2 , 'Tokyo', 2 , 'London', 6 ),
  ( 3 , '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3 , 'Los Angeles', 1 , 'Las Vegas', 1 ),
  ( 4 , '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3 , 'Seattle', 1 , 'Mexico City', 7 ),
  ( 5 , '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4 , 'Paris', 3 , 'Casablanca', 9 ),
  ( 6 , '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5 , 'Dubai', 4 , 'Beijing', 8 ),
  ( 7 , '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1 , 'New York', 1 , 'Charlotte', 1 ),
  ( 8 , '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6 , 'Cedar Rapids', 1 , 'Chicago', 1 ),
  ( 9 , '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6 , 'Charlotte', 1 , 'New Orleans', 1 ),
  ( 10 , '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7 , 'Sao Paolo', 5 , 'Santiago', 10 );
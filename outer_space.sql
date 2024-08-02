-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space



CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  -- Changed from moon to num_moons due to some planets having 10+ moons
  moons INTEGER 
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', 1 ),
  ('Mars', 1.88, 'The Sun', 'Milky Way', 2 ),
  ('Venus', 0.62, 'The Sun', 'Milky Way', 0),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', 14 ),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', 0),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', 0);


-- New table with moon names
CREATE TABLE moon_names
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  related_planet TEXT
);

INSERT INTO moon_names
  (name, related_planet)
VALUES 
  ('Moon', 'Earth'),
  ('Phobos', 'Mars'),
  ('Deimos', 'Mars'),
  ('Naiad', 'Neptune'),
  ('Thalassa', 'Neptune'),
  ('Despina', 'Neptune'),
  ('Galatea', 'Neptune'),
  ('Larissa', 'Neptune'),
  ('S/2004 N 1', 'Neptune'),
  ('Proteus', 'Neptune'),
  ('Triton', 'Neptune'),
  ('Nereid', 'Neptune'),
  ('Halimede', 'Neptune'),
  ('Sao', 'Neptune'),
  ('Laomedeia', 'Neptune'),
  ('Psamathe', 'Neptune'),
  ('Neso', 'Neptune');
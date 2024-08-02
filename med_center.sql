DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE diagnosis_terms
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE patient
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    num_doctors INTEGER,
    diagnosis INTEGER NOT NULL REFERENCES diagnosis_terms(id)
);

CREATE TABLE staff
(
    id SERIAL PRIMARY KEY,
    employee_id SERIAL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    occupation TEXT NOT NULL,
    num_patients INTEGER
);

CREATE TABLE patient_doctor
(
    id SERIAL PRIMARY KEY,
    doc_name INTEGER REFERENCES staff(id),
    patient_name INTEGER REFERENCES patient(id)
);
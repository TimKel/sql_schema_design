DROP DATABASE IF EXISTS db_exercise;

CREATE DATABASE db_exercise;

\c db_exercise;

-- MEDICAL CENTER SCHEMA
CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT 
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    disease_name TEXT
);

CREATE TABLE doctors_patients (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE patient_diagnosis (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    disease_id INTEGER REFERENCES diagnosis ON DELETE CASCADE
);

-- CRAIGSLIST SCHEMA

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    region TEXT
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    preferred_region INTEGER NOT NULL REFERENCES region
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES users,
    location TEXT NOT NULL,
    region_id INTEGER REFERENCES region,
    category_id INTEGER REFERENCES categories
);

-- SOCCER LEAGUE

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT,
    city TEXT
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT,
    birthday DATE,
    height INTEGER,
    current_team_id INTEGER REFERENCES teams
);

CREATE TABLE referees (
    name TEXT
);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams,
    location TEXT,
    date DATE,
    start_time TIMESTAMP,
    season_id INTEGER REFERENCES season,
    head_referee_id INTEGER REFERENCES referees,
);


CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches,
    result TEXT
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches
);

CREATE TABLE lineups (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);
CREATE DATABASE music_site;
\c music_site;
CREATE TABLE IF NOT EXISTS genre(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS performer (
	id SERIAL PRIMARY KEY,
	name VARCHAR(250) NOT NULL
);
CREATE TABLE artist_genre(
	id SERIAL PRIMARY KEY,
	genre_id INTEGER NOT NULL REFERENCES genre(id),
	performer_id INTEGER NOT NULL REFERENCES performer(id)
);
CREATE TABLE album(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year_of_issue DATE NOT NULL
); 
CREATE TABLE album_artist(
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES album(id),
	performer_id INTEGER NOT NULL REFERENCES performer(id)
);
CREATE TABLE track(
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES album(id),
	name VARCHAR(100) NOT NULL,
	duration_sec INTEGER NOT NULL
);
CREATE TABLE compilation (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year_of_issue DATE NOT NULL
);
CREATE TABLE compilation_tracks(
	id SERIAL PRIMARY KEY,
	compilation_id INTEGER NOT NULL REFERENCES compilation(id),
	track_id INTEGER NOT NULL REFERENCES track(id)
);
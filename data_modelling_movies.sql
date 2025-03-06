Create table country (
id serial primary key,
country VARCHAR(100) NOT NULL,
CONSTRAINT unique_id_country UNIQUE (id, country)
);

Create table director (
id serial primary key,
name VARCHAR(100) NOT NULL,
country_id integer,
birthday date,
CONSTRAINT fk_director_country foreign key country_id REFERENCES country(id),
CONSTRAINT unique_director_name UNIQUE (id, name)
);

Create table actor (
id serial primary key,
name VARCHAR(100) NOT NULL,
country_id integer,
birthday date,
CONSTRAINT fk_actor_country foreign key country_id REFERENCES country(id),
CONSTRAINT unique_actor_name UNIQUE (id, name)
);

Create table language (
id serial primary key,
language VARCHAR(100) NOT NULL,
CONSTRAINT unique_id_language UNIQUE (id, language)
);

Create table studio (
id serial primary key,
studio VARCHAR(200) NOT NULL,
CONSTRAINT unique_id_studio UNIQUE (id, studio)
);

Create table genre (
id serial primary key,
genre VARCHAR(100) NOT NULL,
CONSTRAINT unique_id_genre UNIQUE (id, genre)
);

Create table movie (
id serial primary key,
title VARCHAR(200) NOT NULL,
director_id integer,
language_id integer,
studio_id integer,
year integer,
imdb_rating NUMERIC,
budget_usd NUMERIC,
abstract text,
CONSTRAINT fk_director_id foreign key director_id REFERENCES director(id),
CONSTRAINT fk_language_id foreign key language_id REFERENCES language(id),
CONSTRAINT fk_studio_id foreign key studio_id REFERENCES studio(id),
CONSTRAINT unique_movie_year UNIQUE (id, name, year)
);

Create table movie_genre (
movie_id integer,
genre_id integer,
Primary key (movie_id, genre_id)
CONSTRAINT fk_movie_genre_id foreign key movie_id REFERENCES movie(id),
CONSTRAINT fk_genre_movie_id foreign key genre_id REFERENCES genre(id),
);

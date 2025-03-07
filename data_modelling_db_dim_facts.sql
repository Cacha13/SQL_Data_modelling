CREATE SCHEMA warehouse;

CREATE TABLE warehouse.dim_time(
id integer PRIMARY KEY,
date DATE NOT NULL,
CONSTRAINT unique_date UNIQUE (date)
);

CREATE TABLE warehouse.dim_country(
id integer PRIMARY KEY,
country VARCHAR(100) NOT NULL,
CONSTRAINT fk_dim_country FOREIGN KEY (id) REFERENCES public.country(id)
);

CREATE TABLE warehouse.dim_actor(
id integer PRIMARY KEY,
name VARCHAR(150) NOT NULL,
country_id integer,
birthday_id integer,
CONSTRAINT fk_dim_actor_id FOREIGN KEY (id) REFERENCES public.actor(id),
CONSTRAINT fk_dim_actor_country FOREIGN KEY (country_id) REFERENCES warehouse.dim_country(id),
CONSTRAINT fk_dim_actor_birthday FOREIGN KEY (birthday_id) REFERENCES warehouse.dim_time(id)
);

CREATE TABLE warehouse.dim_director(
id integer PRIMARY KEY,
name VARCHAR(150) NOT NULL,
country_id integer,
birthday_id integer,
CONSTRAINT fk_dim_director FOREIGN KEY (id) REFERENCES public.director(id),
CONSTRAINT fk_dim_director_country FOREIGN KEY (country_id) REFERENCES warehouse.dim_country(id),
CONSTRAINT fk_dim_director_birthday FOREIGN KEY (birthday_id) REFERENCES warehouse.dim_time(id)
);

CREATE TABLE warehouse.dim_language(
id integer PRIMARY KEY,
language VARCHAR(100) NOT NULL,
CONSTRAINT fk_dim_language FOREIGN KEY (id) REFERENCES public.language(id)
);

CREATE TABLE warehouse.dim_studio(
id integer PRIMARY KEY,
studio VARCHAR(200) NOT NULL,
CONSTRAINT fk_dim_studio FOREIGN KEY (id) REFERENCES public.studio(id)
);

CREATE TABLE warehouse.dim_genre(
id integer PRIMARY KEY,
genre VARCHAR(100) NOT NULL,
CONSTRAINT fk_dim_genre FOREIGN KEY (id) REFERENCES public.genre(id)
);

CREATE TABLE warehouse.dim_movie(
id integer PRIMARY KEY,
title VARCHAR(200) NOT NULL,
director_id INT,
language_id INT,
studio_id INT,
year INT,
CONSTRAINT fk_dim_movie FOREIGN KEY (id) REFERENCES director(id),
CONSTRAINT fk_dim_movie_director FOREIGN KEY (director_id) REFERENCES warehouse.dim_director(id),
CONSTRAINT fk_dim_movie_language FOREIGN KEY (language_id) REFERENCES warehouse.dim_language(id),
CONSTRAINT fk_dim_movie_studio FOREIGN KEY (studio_id) REFERENCES warehouse.dim_studio(id)
);


CREATE TABLE warehouse.fact_director_performance(
director_id integer,
director_country_id integer,
director_birthday_id integer,
total_movies integer,
total_budget integer,
PRIMARY KEY (director_id, director_country_id, director_birthday_id),
CONSTRAINT fk_fact_director_id FOREIGN KEY (director_id) REFERENCES warehouse.dim_director(id),
CONSTRAINT fk_fact_director_country FOREIGN KEY (director_country_id) REFERENCES warehouse.dim_country(id),
CONSTRAINT fk_fact_director_birthday_id FOREIGN KEY (director_birthday_id) REFERENCES warehouse.dim_time(id)
);
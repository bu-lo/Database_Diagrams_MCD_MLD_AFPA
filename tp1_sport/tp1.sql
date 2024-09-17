CREATE TABLE team(
   id SERIAL,
   team_code INTEGER NOT NULL,
   name VARCHAR(50)  NOT NULL,
   creation_date DATE,
   PRIMARY KEY(id)
);

CREATE TABLE person(
   id SERIAL,
   last_name VARCHAR(50)  NOT NULL,
   first_name VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE player(
   id SERIAL,
   team_id integer,
   person_id integer,
   registration_number INTEGER NOT NULL,
   birthdate DATE NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(team_id) REFERENCES team(id),
   FOREIGN KEY(person_id) REFERENCES person(id)
);

CREATE TABLE referee(
   id SERIAL,
   person_id integer
   number INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(person_id) REFERENCES person(id)
);

CREATE TABLE "match"(
   id SERIAL,
   referee_id integer,
   number INTEGER NOT NULL,
   "date" DATE,
   start_time TIMESTAMP NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(referee_id) REFERENCES referee(id)
);

CREATE TABLE team_match(
   id INTEGER,
   team_id integer,
   match_id integer,
   "result" VARCHAR(50) ,
   PRIMARY KEY(id),
   FOREIGN KEY(team_id) REFERENCES team(id),
   FOREIGN KEY(match_id) REFERENCES "match"(id)
);
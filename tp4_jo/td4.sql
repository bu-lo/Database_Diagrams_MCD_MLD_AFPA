CREATE TABLE person(
   id INTEGER,
   name VARCHAR(50)  NOT NULL,
   registration_number VARCHAR(50) ,
   address VARCHAR(50) ,
   phone VARCHAR(50) ,
   nationality VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE person_in_charge(
   id SERIAL,
   superior_number INTEGER,
   person_id INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(person_id) REFERENCES person(id)
);

CREATE TABLE competitor(
   id SERIAL,
   birthdate DATE NOT NULL,
   country_iso VARCHAR(50) ,
   person_id INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(person_id) REFERENCES person(id)
);

CREATE TABLE discipline(
   id SERIAL,
   name VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE station(
   id SERIAL,
   name VARCHAR(50) ,
   altitude INTEGER,
   PRIMARY KEY(id)
);

CREATE TABLE trial(
   id SERIAL,
   name VARCHAR(50) ,
   type VARCHAR(50) ,
   az_code VARCHAR(2) ,
   rounds INTEGER,
   "date" DATE,
   station_id INTEGER NOT NULL,
   discipline_id INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(station_id) REFERENCES station(id),
   FOREIGN KEY(discipline_id) REFERENCES discipline(id)
);

CREATE TABLE rounds(
   id SERIAL,
   score VARCHAR(50) ,
   timer INTEGER,
   trial_id INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(trial_id) REFERENCES trial(id)
);

CREATE TABLE "result"(
   id SERIAL NOT NULL,
   competitor_id INTEGER,
   trial_id INTEGER,
   ranking INTEGER,
   gold_medal INTEGER,
   silver_medal INTEGER,
   bronze_medal INTEGER,
   PRIMARY KEY(id),
   FOREIGN KEY(competitor_id) REFERENCES competitor(id),
   FOREIGN KEY(trial_id) REFERENCES trial(id)
);
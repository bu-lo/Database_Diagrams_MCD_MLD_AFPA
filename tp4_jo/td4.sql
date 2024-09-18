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
   role VARCHAR(50)  NOT NULL,
   id_1 INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_1),
   FOREIGN KEY(id_1) REFERENCES person(id)
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

CREATE TABLE team_(
   id INTEGER,
   name VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE country(
   id VARCHAR(50) ,
   name VARCHAR(168)  NOT NULL,
   country_iso VARCHAR(3) ,
   PRIMARY KEY(id)
);

CREATE TABLE competitor(
   id SERIAL,
   birthdate DATE NOT NULL,
   gold_medal INTEGER,
   silver_medal INTEGER,
   bronze_medal INTEGER,
   id_1 VARCHAR(50)  NOT NULL,
   id_2 INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_2),
   FOREIGN KEY(id_1) REFERENCES country(id),
   FOREIGN KEY(id_2) REFERENCES person(id)
);

CREATE TABLE trial(
   id SERIAL,
   name VARCHAR(50) ,
   type VARCHAR(50) ,
   az_code VARCHAR(2) ,
   rounds INTEGER,
   _date_ DATE,
   id_1 INTEGER NOT NULL,
   id_2 INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_1) REFERENCES station(id),
   FOREIGN KEY(id_2) REFERENCES discipline(id)
);

CREATE TABLE rounds(
   id SERIAL,
   date_start TIMESTAMP NOT NULL,
   date_end TIMESTAMP NOT NULL,
   id_1 INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_1) REFERENCES trial(id)
);

CREATE TABLE manage(
   id_superior INTEGER,
   id_subordonate INTEGER,
   PRIMARY KEY(id_superior, id_subordonate),
   FOREIGN KEY(id_superior) REFERENCES person_in_charge(id),
   FOREIGN KEY(id_subordonate) REFERENCES person_in_charge(id)
);

CREATE TABLE compete(
   id INTEGER,
   id_1 INTEGER,
   ranking INTEGER,
   bib INTEGER NOT NULL,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES competitor(id),
   FOREIGN KEY(id_1) REFERENCES trial(id)
);

CREATE TABLE involve(
   id INTEGER,
   id_1 INTEGER,
   score INTEGER NOT NULL,
   timer NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES competitor(id),
   FOREIGN KEY(id_1) REFERENCES rounds(id)
);

CREATE TABLE composed_by(
   id INTEGER,
   id_1 INTEGER,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES competitor(id),
   FOREIGN KEY(id_1) REFERENCES team_(id)
);

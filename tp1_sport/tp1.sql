CREATE TABLE team(
   Id SERIAL,
   team_code INTEGER NOT NULL,
   name VARCHAR(50)  NOT NULL,
   creation_date DATE NOT NULL,
   PRIMARY KEY(Id)
);

CREATE TABLE person(
   id SERIAL,
   last_name VARCHAR(50)  NOT NULL,
   first_name VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE player(
   Id SERIAL,
   registration_number INTEGER NOT NULL,
   birthdate DATE NOT NULL,
   id_team INTEGER,
   id_person INTEGER NOT NULL,
   PRIMARY KEY(Id),
   UNIQUE(id_person),
   FOREIGN KEY(id_team) REFERENCES team(Id),
   FOREIGN KEY(id_person) REFERENCES person(id)
);

CREATE TABLE referee(
   id VARCHAR(50) ,
   number INTEGER NOT NULL,
   id_person INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_person),
   FOREIGN KEY(id_person) REFERENCES person(id)
);

CREATE TABLE _match_(
   id VARCHAR(50) ,
   number INTEGER NOT NULL,
   _date_ DATE NOT NULL,
   start_time TIMESTAMP NOT NULL,
   id_referee VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_referee) REFERENCES referee(id)
);

CREATE TABLE matching(
   id_team INTEGER,
   id_match VARCHAR(50) ,
   _result_ VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_team, id_match),
   FOREIGN KEY(id_team) REFERENCES team(Id),
   FOREIGN KEY(id_match) REFERENCES _match_(id)
);

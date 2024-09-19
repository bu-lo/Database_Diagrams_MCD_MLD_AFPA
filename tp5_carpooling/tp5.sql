CREATE TYPE type as ENUM ('Compact', 'Berline', 'Break', '4x4', 'Monospace', 'Utilitaire');
CREATE TYPE fuel_type as ENUM ('Petrol', 'Diesel','LPG','Electric');

CREATE TABLE vehicle_type(
   id SERIAL,
   type VARCHAR(15)  NOT NULL,
   fuel_type VARCHAR(15)  NOT NULL,
   consumption NUMERIC(5,2)   NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE fuel(
   id SERIAL,
   fuel_type VARCHAR(15)  NOT NULL,
   price NUMERIC(4,2)   NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE training_center(
   id SERIAL,
   name VARCHAR(30)  NOT NULL,
   hours VARCHAR(20)  NOT NULL,
   address VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE training(
   id SERIAL,
   name VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE reference_notification(
   id SERIAL,
   original_notif_text VARCHAR(100)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE user_carpooler(
   id SERIAL,
   email VARCHAR(70)  NOT NULL,
   last_name VARCHAR(50)  NOT NULL,
   first_name VARCHAR(50)  NOT NULL,
   phonenumber VARCHAR(15)  NOT NULL,
   profile_picture VARCHAR(100) ,
   password VARCHAR(30)  NOT NULL,
   active BOOLEAN NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE general_condition(
   id SERIAL,
   accepted BOOLEAN NOT NULL,
   id_user_carpooler VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE employee(
   id SERIAL,
   administrator BOOLEAN NOT NULL,
   contract_duration VARCHAR(30)  NOT NULL,
   id_user_carpooler INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_user_carpooler),
   FOREIGN KEY(id_user_carpooler) REFERENCES user_carpooler(id)
);

CREATE TYPE role as ENUM ('administrative','exthernal','other');

CREATE TABLE afpa_staff(
   id SERIAL,
   role VARCHAR(30)  NOT NULL,
   contract_duration VARCHAR(30)  NOT NULL,
   id_training_center INTEGER NOT NULL,
   id_employee INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_employee),
   FOREIGN KEY(id_training_center) REFERENCES training_center(id),
   FOREIGN KEY(id_employee) REFERENCES employee(id)
);

CREATE TABLE vehicle(
   id SERIAL,
   model VARCHAR(50)  NOT NULL,
   places INTEGER NOT NULL,
   id_user_carpooler INTEGER NOT NULL,
   id_fuel INTEGER NOT NULL,
   id_vehicle_type INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_user_carpooler) REFERENCES user_carpooler(id),
   FOREIGN KEY(id_fuel) REFERENCES fuel(id),
   FOREIGN KEY(id_vehicle_type) REFERENCES vehicle_type(id)
);

CREATE TABLE trainer(
   id SERIAL,
   referent BOOLEAN NOT NULL,
   id_employee INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_employee),
   FOREIGN KEY(id_employee) REFERENCES employee(id)
);

CREATE TYPE status as ENUM ('accepted','denied');

CREATE TABLE journey(
   id SERIAL,
   driver VARCHAR(50)  NOT NULL,
   passenger VARCHAR(200)  NOT NULL,
   departure_address VARCHAR(100)  NOT NULL,
   departure_time TIMESTAMP NOT NULL,
   arrival_address VARCHAR(100)  NOT NULL,
   journey_description VARCHAR(200) ,
   driver_validation BOOLEAN NOT NULL,
   status VARCHAR(15)  NOT NULL,
   price NUMERIC(5,2)   NOT NULL,
   id_user_carpooler INTEGER NOT NULL,
   id_vehicle INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_user_carpooler) REFERENCES user_carpooler(id),
   FOREIGN KEY(id_vehicle) REFERENCES vehicle(id)
);


CREATE TABLE regular_journey(
   id SERIAL,
   avaibility_date VARCHAR(50)  NOT NULL,
   regular_day VARCHAR(50)  NOT NULL,
   id_journey INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_journey),
   FOREIGN KEY(id_journey) REFERENCES journey(id)
);

CREATE TABLE punctual_journey(
   id SERIAL,
   journey_day VARCHAR(30)  NOT NULL,
   id_journey INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_journey),
   FOREIGN KEY(id_journey) REFERENCES journey(id)
);

CREATE TABLE session(
   id SERIAL,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   referent_teacher VARCHAR(50)  NOT NULL,
   id_trainer INTEGER NOT NULL,
   id_training_center INTEGER NOT NULL,
   id_training INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_trainer) REFERENCES trainer(id),
   FOREIGN KEY(id_training_center) REFERENCES training_center(id),
   FOREIGN KEY(id_training) REFERENCES training(id)
);

CREATE TABLE intern(
   id SERIAL,
   training_name VARCHAR(30)  NOT NULL,
   session_information VARCHAR(300)  NOT NULL,
   id_session INTEGER NOT NULL,
   id_user_carpooler INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_user_carpooler),
   FOREIGN KEY(id_session) REFERENCES session(id),
   FOREIGN KEY(id_user_carpooler) REFERENCES user_carpooler(id)
);

CREATE TABLE notification(
   id SERIAL,
   text_notif_modified VARCHAR(200)  NOT NULL,
   id_user_carpooler INTEGER NOT NULL,
   id_journey INTEGER,
   id_reference_notification INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_user_carpooler) REFERENCES user_carpooler(id),
   FOREIGN KEY(id_journey) REFERENCES journey(id),
   FOREIGN KEY(id_reference_notification) REFERENCES reference_notification(id)
);

CREATE TABLE comment(
   id VARCHAR(50) ,
   text VARCHAR(300)  NOT NULL,
   id_user_carpooler INTEGER NOT NULL,
   id_journey INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_user_carpooler) REFERENCES user_carpooler(id),
   FOREIGN KEY(id_journey) REFERENCES journey(id)
);

CREATE TABLE travel_with(
   id_journey INTEGER,
   id_user_carpooler INTEGER,
   PRIMARY KEY(id_journey, id_user_carpooler),
   FOREIGN KEY(id_journey) REFERENCES journey(id),
   FOREIGN KEY(id_user_carpooler) REFERENCES user_carpooler(id)
);

CREATE TABLE general_condition(
   id SERIAL,
   accepted BOOLEAN NOT NULL,
   PRIMARY KEY(id)
);



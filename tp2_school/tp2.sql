CREATE TABLE class(
   id SERIAL,
   name VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE classroom(
   id SERIAL,
   building VARCHAR(50)  NOT NULL,
   number INTEGER NOT NULL,
   id_class INTEGER,
   PRIMARY KEY(id),
   UNIQUE(id_class),
   FOREIGN KEY(id_class) REFERENCES class(id)
);

CREATE TABLE person(
   id SERIAL,
   last_name VARCHAR(50)  NOT NULL,
   fisrt_name VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE teacher(
   id SERIAL,
   id_person INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_person),
   FOREIGN KEY(id_person) REFERENCES person(id)
);

CREATE TABLE subject(
   id SERIAL,
   name VARCHAR(50)  NOT NULL,
   id_teacher INTEGER,
   PRIMARY KEY(id),
   FOREIGN KEY(id_teacher) REFERENCES teacher(id)
);

CREATE TABLE student(
   id SERIAL,
   id_class INTEGER NOT NULL,
   id_person INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_person),
   FOREIGN KEY(id_class) REFERENCES class(id),
   FOREIGN KEY(id_person) REFERENCES person(id)
);

CREATE TABLE class_subject(
   id_class INTEGER,
   id_subject INTEGER,
   _hour_ NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(id_class, id_subject),
   FOREIGN KEY(id_class) REFERENCES class(id),
   FOREIGN KEY(id_subject) REFERENCES subject(id)
);

CREATE TABLE notation(
   id_subject INTEGER,
   id_student INTEGER,
   _value2_ INTEGER NOT NULL,
   PRIMARY KEY(id_subject, id_student),
   FOREIGN KEY(id_subject) REFERENCES subject(id),
   FOREIGN KEY(id_student) REFERENCES student(id)
);

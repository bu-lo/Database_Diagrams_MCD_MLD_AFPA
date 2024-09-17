CREATE TABLE class(
   id SERIAL,
   name VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE classroom(
   id SERIAL,
   class_id integer,
   number INTEGER,
   "floor" INTEGER,
   building VARCHAR(50) ,
   PRIMARY KEY(id),
   FOREIGN KEY(class_id) REFERENCES class(id)
);

CREATE TABLE person(
   id INTEGER,
   last_name VARCHAR(50)  NOT NULL,
   first_name VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE teacher(
   id SERIAL,
   person_id integer, 
   PRIMARY KEY(id),
   FOREIGN KEY(person_id) REFERENCES person(id)
);

CREATE TABLE subject(
   id SERIAL,
   name VARCHAR(50)  NOT NULL,
   teacher_id INTEGER,
   PRIMARY KEY(id),
   FOREIGN KEY(teacher_id) REFERENCES teacher(id)
);

CREATE TABLE student(
   id SERIAL,
   class_id INTEGER NOT NULL,
   person_id INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(class_id) REFERENCES class(id),
   FOREIGN KEY(person_id) REFERENCES person(id)
);

CREATE TABLE grade(
   id SERIAL,
   graduation INTEGER,
   student_id INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(student_id) REFERENCES student(id)
);

CREATE TABLE grade_subject(
   id INTEGER,
   grade_id INTEGER,
   subject_id integer, 
   PRIMARY KEY(id),
   FOREIGN KEY(subject_id) REFERENCES subject(id),
   FOREIGN KEY(grade_id) REFERENCES grade(id)
);

CREATE TABLE class_subject(
   id INTEGER,
   subject_id INTEGER,
   class_id integer,
   "hour" NUMERIC(15,2)  ,
   PRIMARY KEY(id),
   FOREIGN KEY(class_id) REFERENCES class(id),
   FOREIGN KEY(id_1) REFERENCES subject(id)
);

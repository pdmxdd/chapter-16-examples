CREATE TABLE instructors (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE courses (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES instructors(id)
);

-- create 2 instructors each of which teach 2 different courses
INSERT INTO instructors (first_name, last_name) VALUES ("Paul", "Matthews");
INSERT INTO instructors (first_name, last_name) VALUES ("Andrew", "Bell");

INSERT INTO courses (name, instructor_id) VALUES ("CodeCamp", (SELECT id FROM instructors WHERE first_name="Paul"));
INSERT INTO courses (name, instructor_id) VALUES ("GIS-DevOps", (SELECT id FROM instructors WHERE first_name="Paul"));

INSERT INTO courses (name, instructor_id) VALUES ("LC101", (SELECT id FROM instructors WHERE first_name="Andrew"));
INSERT INTO courses (name, instructor_id) VALUES ("Liftoff", (SELECT id FROM instructors WHERE first_name="Andrew"));

SELECT name, instructors.first_name, instructors.last_name FROM courses INNER JOIN instructors ON courses.instructor_id = instructors.id;
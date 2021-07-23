CREATE TABLE students (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE courses (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE students_courses (
	student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO courses (name) VALUES ("Music Theory");
INSERT INTO courses (name) VALUES ("Algebra II");
INSERT INTO courses (name) VALUES ("Physics 101");

INSERT INTO students (first_name, last_name) VALUES ("Cindy", "Featherbottom");
INSERT INTO students (first_name, last_name) VALUES ("Gob", "Bluth");
INSERT INTO students (first_name, last_name) VALUES ("Maeby", "Funke");

INSERT INTO students_courses (student_id, course_id) VALUES (1, 2);
INSERT INTO students_courses (student_id, course_id) VALUES (1, 3);

INSERT INTO students_courses (student_id, course_id) VALUES (2, 1);

INSERT INTO students_courses (student_id, course_id) VALUES (3, 1);
INSERT INTO students_courses (student_id, course_id) VALUES (3, 2);
INSERT INTO students_courses (student_id, course_id) VALUES (3, 3);

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM students_courses;

SELECT students.first_name, students.last_name, courses.name FROM students_courses 
INNER JOIN students ON students.id = students_courses.student_id
INNER JOIN courses ON courses.id = students_courses.course_id;

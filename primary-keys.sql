create table students_with_ids (
	id int PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO students_with_ids (first_name, last_name) VALUES ("Paul", "Matthews");
INSERT INTO students_with_ids (first_name, last_name) VALUES ("Julia", "Drummond");

SELECT * FROM students_with_ids;

SELECT * FROM students_with_ids WHERE id=1; -- we can now read, update, or delete specifically the record by it's uniquely identifiying id
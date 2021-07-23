CREATE TABLE owners (
	id INT PRIMARY  KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE pets (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES owners(id)
);

-- create 2 owners
INSERT INTO owners (first_name, last_name) VALUES ("Steve", "Smith");
INSERT INTO owners (first_name, last_name) VALUES ("Janet", "Star");

-- create 3 different pets one for the first owner, and two for the second owner
INSERT INTO pets (name, owner_id) VALUES ("Jingles", (SELECT id FROM owners WHERE first_name="Steve" AND last_name="Smith"));

INSERT INTO pets (name, owner_id) VALUES ("Ruby", (SELECT id FROM owners WHERE first_name="Janet" AND last_name="Star"));
INSERT INTO pets (name, owner_id) VALUES ("Frank", (SELECT id FROM owners WHERE first_name="Janet" AND last_name="Star"));

SELECT * FROM pets;

SELECT name AS pet_name, owners.first_name, owners.last_name FROM pets INNER JOIN owners ON pets.owner_id = owners.id;
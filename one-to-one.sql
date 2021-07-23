
-- you can't just add the FK immediately, because the carts(id) doesn't exist yet, so we have to create one table first, and add its FK constraint later
CREATE TABLE carts (
	id INT PRIMARY KEY AUTO_INCREMENT,
    total DOUBLE
);

-- we can just add the FK immediately because the carts table does exist
CREATE TABLE customers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    cart_id INT,
    FOREIGN KEY (cart_id) REFERENCES carts(id)
);

-- now we need to alter our original carts table:
ALTER TABLE carts ADD customer_id INT;
ALTER TABLE carts ADD CONSTRAINT FOREIGN KEY (customer_id) REFERENCES customers(id);

-- now we can create two different customers, each with a cart:
INSERT INTO customers (first_name, last_name) VALUES ("Paul", "Matthews");
INSERT INTO customers (first_name, last_name) VALUES ("Fred", "Flinstone");

SELECT * FROM customers; -- their carts don't exist yet

INSERT INTO carts (total, customer_id) VALUES (15.50, (SELECT id FROM customers WHERE first_name="Paul" AND last_name="Matthews"));
INSERT INTO carts (total, customer_id) VALUES (3.99, (SELECT id FROM customers WHERE first_name="Fred" AND last_name="Flinstone"));

SELECT * FROM carts;

SELECT * FROM customers;

-- need to update the customers now that they have carts:
UPDATE customers SET cart_id = 1 WHERE id=1;
UPDATE customers SET cart_id = 2 WHERE id=2; 

SELECT * FROM customers;

SELECT first_name, last_name, carts.total FROM customers INNER JOIN carts WHERE customers.cart_id = carts.id;
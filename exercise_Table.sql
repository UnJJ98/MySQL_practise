CREATE DATABASE exercise;
SHOW DATABASES;
USE  exercise;
DROP TABLE employee;
CREATE TABLE employee 
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    age INT NOT NULL,
    current_status VARCHAR(50) NOT NULL DEFAULT 'employed'
);
DESC employee;
INSERT INTO employee (first_name, last_name, age)
VALUES (
		'Un',
		'Derek',
		27
        );
SELECT * FROM employee;
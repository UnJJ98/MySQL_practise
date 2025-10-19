-- 1.create a new database 'shirs_db'
CREATE DATABASE shirts_db;
-- 如果有多個database，我們需要選擇某一個database來建立table
USE shirts_db;

-- 2.create a new table 'shirts'
CREATE TABLE shirts 
(
shirt_id INT AUTO_INCREMENT PRIMARY KEY,
article VARCHAR(50),
color VARCHAR(50),
shirt_size VARCHAR(50),
last_worn INT NOT NULL
);
DESC shirts;

-- 3.Insert the data
INSERT INTO shirts 
(
article , color, shirt_size, last_worn
)
VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);
SELECT * FROM shirts;

-- 4.Add a new shirt: Purple polo shirt, size M last worn 50 day ago
INSERT INTO shirts 
(article, color, shirt_size, last_worn)
VALUES
('polo shirt', 'purple', 'M', 50);

-- 5.Select all shirts: But only print out 'article' and 'color'
SELECT article, color FROM shirts;

-- 6.Select all medium shirts: Not print shirt_id
SELECT article, color, shirt_size, last_worn FROM shirts
WHERE shirt_size = 'M';

-- 7.Update all polo shirts: Change their size to L
UPDATE shirts SET shirt_size = 'L' 
WHERE article = 'polo shirt';

-- 8.Update the shirt last worn 15 days age: Change last_worn to 0
UPDATE shirtS SET last_worn = 0
WHERE last_worn = 15;

-- 9.Update all white shirts: Change size to 'XS' and color to 'off white'
UPDATE shirts SET shirt_size = 'XS', color = 'off white'
WHERE color = 'white';

-- 10.Delete all old shirts: Last worn 200 days ago
DELETE FROM shirts WHERE last_worn = 200;

-- 11.Delet all tank tops: Your tastes have changed
DELETE FROM shirts WHERE article = 'tank top';

-- 12.Delete all shirts & Drop the table
-- DELETE FROM shirts;
-- DROP TABLE shirts_db;
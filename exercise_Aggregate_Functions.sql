CREATE DATABASE EX1;
USE EX1;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
INSERT INTO books
(title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
('fake_book', 'Freida', 'Harris', 2001, 287, 428),
('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT * FROM books;

-- 1.Print the number of books in the database
SELECT COUNT(*) FROM books;

-- 2.Print out how many books were released in each year
SELECT released_year, COUNT(*) FROM books
GROUP BY released_year;

-- 3.Print out the total number of books in stock
SELECT  SUM(stock_quantity) FROM books;

-- 4.Find the average released_year fro each author
SELECT CONCAT(author_fname, ' ', author_lname) AS author
 , AVG(released_year) FROM books GROUP BY author;
 
 -- 5.Find the full nmae of the author who wrote the longest book
 SELECT CONCAT(author_fname, ' ', author_lname), pages FROM books
 WHERE pages = (SELECT MAX(pages) FROM books);

 SELECT CONCAT(author_fname, ' ', author_lname), pages FROM books
 ORDER BY pages DESC LIMIT 1;
 
 -- 6.
 SELECT released_year AS year, COUNT(*) AS '#books', AVG(pages) AS 'avg_pages'
 FROM books GROUP BY year ORDER BY released_year;
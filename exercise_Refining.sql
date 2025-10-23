CREATE DATABASE EX;
USE EX;
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

-- 1.Select all story collection: Titles that contain 'stories'
SELECT title FROM  books WHERE title LIKE '%stories%';

-- 2.Find the longest book: Print out the title and page count
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- 3.Print a summary containing the title and year, for the 3 most recent books
SELECT CONCAT(title, ' - ', released_year) AS summary FROM books 
ORDER BY released_year DESC LIMIT 3;

-- 4.Find all books with an auther_lname that contains a space(" ")
SELECT title, author_lname FROM books
WHERE author_lname LIKE '% %';

-- 5.Find the 3 books with the lowest stock
SELECT title, released_year, stock_quantity FROM books
ORDER BY stock_quantity, released_year DESC LIMIT 3;

-- 6.Print title and author_lname, sorted first by author_lname and then by title
SELECT title, author_lname FROM books
ORDER BY author_lname, title;

-- 7.Sorted Alphabetically by last name
SELECT UPPER(CONCAT('my favorite author is ', author_fname, ' ', author_lname, '!'))
AS yell FROM books ORDER BY author_lname, author_fname DESC;



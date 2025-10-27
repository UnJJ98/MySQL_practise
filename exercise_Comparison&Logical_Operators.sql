SELECT * FROM books;

-- 1.Select all books written before 1980(non inclusive)
SELECT * FROM books WHERE released_year < 1980;

-- 2.Select all books writthen by Eggers or Chabon
SELECT * FROM books WHERE author_lname = 'Eggers' or author_lname = 'Chabon';

-- 3.Select all books written by Lahiri, published after 2000
SELECT * FROM books WHERE author_lname = 'Lahiri'
AND released_year > 2000;

-- 4.Select all books with page counts between 100 and 200
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;
SELECT * FROM books WHERE pages >= 100 AND  pages <= 200;

-- 5.Select all books where author_lname starts with a'C' or an 'S'
SELECT * FROM books WHERE author_lname LIKE 'C%' 
OR author_lname LIKE 'S%';
SELECT title, author_lname
FROM books WHERE SUBSTR(author_lname, 1, 1) in ('C', 'S');

-- 6.If title contains'stories'>> Short Stories
-- Just Kids and A Heartbreaking Work>> Memoir
-- Everything Else>> Novel
SELECT title, author_lname,
CASE
WHEN title LIKE '%stories%' THEN 'Short Stories'
WHEN title LIKE '%Just Kids%' OR title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
ELSE 'Novel'
END AS TYPE
FROM books;

-- 7.Bonus
SELECT author_fname, author_lname, 
CASE
WHEN COUNT(*) = 1 THEN '1 book'
ELSE CONCAT(COUNT(*), ' books')
END AS COUNT
FROM books GROUP BY author_fname, author_lname;



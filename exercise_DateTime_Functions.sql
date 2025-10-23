-- 1.What's a good use case for CHAR?
-- 標準化數據，EX:國家簡稱,衣服尺寸

-- 2.Fill in the blanks
-- CREATE TABLE inventory(
-- item_name _VARCHAR____, prcie__float___, quantity__int__);

-- 3.What's the difference between DATETIME and TIMESTAMP?
-- DATESTAMP較DATETIME用的內存更小，但包含的日期範圍較小。多用於即時更新時間使用。

-- 4.Print out the current time
SELECT CURTIME();

-- 5.Print out the current date (but not time)
SELECT DAY(CURDATE());
SELECT CURDATE();

-- 6.Print out the current day of the week (the number)
SELECT DAYOFWEEK(CURDATE());

-- 7.Print out the current day of the week (the day name)
SELECT DATE_FORMAT(CURDATE(), '%a');
SELECT DATE_FORMAT(CURDATE(), '%W');
SELECT DAYNAME(NOW());

-- 8.Print out the current day and time using this format: mm/dd/yy
SELECT CONCAT(MONTH(CURDATE()), '/', DAY(CURDATE()), '/', YEAR(CURDATE()) );
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');

-- 9.Print out the current day and time using this format:
-- January 2nd at 3:15, April 1st at 10:18
SELECT NOW(), DATE_FORMAT(NOW(), '%M %D at %k:%i');

-- 10.Create a tweets table that stores:
-- The Tweet content, A Username, Time it was created
CREATE TABLE tweets  ( Tweet_content VARCHAR(200), Username VARCHAR(50), 
Time_it_was_created TIMESTAMP default CURRENT_TIMESTAMP);
SELECT * FROM tweets;
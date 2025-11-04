-- exercise for IG data
-- CREATE TABLE users (
--     id INTEGER AUTO_INCREMENT PRIMARY KEY,
--     username VARCHAR(255) UNIQUE NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW()
-- );

-- CREATE TABLE photos (
--     id INTEGER AUTO_INCREMENT PRIMARY KEY,
--     image_url VARCHAR(255) NOT NULL,
--     user_id INTEGER NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW(),
--     FOREIGN KEY(user_id) REFERENCES users(id)
-- );

-- CREATE TABLE comments (
--     id INTEGER AUTO_INCREMENT PRIMARY KEY,
--     comment_text VARCHAR(255) NOT NULL,
--     photo_id INTEGER NOT NULL,
--     user_id INTEGER NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW(),
--     FOREIGN KEY(photo_id) REFERENCES photos(id),
--     FOREIGN KEY(user_id) REFERENCES users(id)
-- );

-- CREATE TABLE likes (
--     user_id INTEGER NOT NULL,
--     photo_id INTEGER NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW(),
--     FOREIGN KEY(user_id) REFERENCES users(id),
--     FOREIGN KEY(photo_id) REFERENCES photos(id),
--     PRIMARY KEY(user_id, photo_id)
-- );
-- PRIMARY KEY(user_id, photo_id)指避免一個用戶重複點like給同一張照片

-- CREATE TABLE follows (
--     follower_id INTEGER NOT NULL,
--     followee_id INTEGER NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW(),
--     FOREIGN KEY(follower_id) REFERENCES users(id),
--     FOREIGN KEY(followee_id) REFERENCES users(id),
--     PRIMARY KEY(follower_id, followee_id)
-- );

-- CREATE TABLE tags (
--   id INTEGER AUTO_INCREMENT PRIMARY KEY,
--   tag_name VARCHAR(255) UNIQUE,
--   created_at TIMESTAMP DEFAULT NOW()
-- );
-- CREATE TABLE photo_tags (
--     photo_id INTEGER NOT NULL,
--     tag_id INTEGER NOT NULL,
--     FOREIGN KEY(photo_id) REFERENCES photos(id),
--     FOREIGN KEY(tag_id) REFERENCES tags(id),
--     PRIMARY KEY(photo_id, tag_id)
-- );

-- 點選Server的Data Import把資料庫'ig_clone'輸入到Workbench
USE ig_clone;

-- 1.Find the 5 oldest users
SELECT * FROM users
ORDER BY created_at LIMIT 5 ;

-- 2.What day of the week do most users register on?
-- We need to figure out when to schedule an ad campaign
SELECT 
DAYNAME(created_at) AS day,
COUNT(*) AS cday
FROM users
GROUP BY day
ORDER BY cday DESC;

-- 3.Find the users who have never posted a photo
-- We want to target our inactive users with an email campaign
SELECT username,
COUNT(image_url) AS total
FROM users
LEFT JOIN photos ON users.id = photos.user_id
GROUP BY username HAVING total = 0 ;

SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- 4.Identify most popular photo (and user who created it)
SELECT image_url,
COUNT(photo_id) AS most
 FROM photos
JOIN likes ON photos.id = likes.photo_id
GROUP BY image_url
ORDER BY most DESC;

SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- 5.Calculate avg number of photos per user
SELECT
 (SELECT Count(*) FROM   photos) / 
 (SELECT Count(*) FROM   users) AS avg; 

-- 6.What are the top 5 most commonly used hashtags?
SELECT tag_id, tag_name,
COUNT(tag_id) FROM photo_tags
JOIN tags ON tags.id = photo_tags.tag_id
GROUP BY tag_id
ORDER BY COUNT(tag_id) DESC
LIMIT 5;

-- 7.Find users who have liked every single photo on the site
-- We have a small problem with bots on our site
SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 

-- 8.Set Triggers
-- 8.1 Cannot follow yourself
DELIMITER //
CREATE TRIGGER example_cannot_follow_self
BEFORE INSERT ON follows FOR EACH ROW
	BEGIN
			IF NEW.follower_id = NEW.followee_id
			THEN
				SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'Cannot follow yourself!';
			END IF;
END;
//
DELIMITER ;

-- 錯誤輸入資料的
-- INSERT INTO follows (follower_id, followee_id) 
-- VALUES (5 ,5);

-- 系統輸出錯誤的結果
-- 21:11:50	INSERT INTO follows (follower_id, followee_id)  VALUES (5 ,5)	Error Code: 1644. Cannot follow yourself!	0.000 sec

-- 刪除已建立的Trigger
-- DROP TRIGGER IF EXISTS example_cannot_follow_self;

-- 顯示已建立的Trigger
-- SHOW TRIGGERS;

-- 8.2 Capture_unfollow
CREATE TABLE unfollows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

DELIMITER //

CREATE TRIGGER capture_unfollow
AFTER DELETE ON follows FOR EACH ROW
BEGIN
	INSERT INTO unfollows
    SET
    follower_id = OLD.follower_id,
    followee_id = OLD.followee_id;
    
END;
//
DELIMITER ;
    

-- SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
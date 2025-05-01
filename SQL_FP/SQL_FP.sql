-- 1. Create database and use it
CREATE DATABASE IF NOT EXISTS TwitterClone;
USE TwitterClone;

-- 2. Users table (stores login/email/password)
CREATE TABLE Users (
  user_id    INT AUTO_INCREMENT PRIMARY KEY,
  email      VARCHAR(255) NOT NULL UNIQUE,
  password   BINARY(64)    NOT NULL,
  created_at DATETIME      DEFAULT CURRENT_TIMESTAMP
);

-- 3. Profiles table (stores username/bio)
CREATE TABLE Profiles (
  user_id  INT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  bio      TEXT,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- 4. Follows table (Many-to-Many: users follow users)
CREATE TABLE Follows (
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  follow_time DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (follower_id, followee_id),
  FOREIGN KEY (follower_id) REFERENCES Users(user_id),
  FOREIGN KEY (followee_id) REFERENCES Users(user_id)
);

-- 5. Tweets table
CREATE TABLE Tweets (
  tweet_id   INT AUTO_INCREMENT PRIMARY KEY,
  user_id    INT NOT NULL,
  content    VARCHAR(280) NOT NULL,
  tweet_time DATETIME      DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- 6. Likes table (Many-to-Many: users like tweets)
CREATE TABLE Likes (
  user_id   INT NOT NULL,
  tweet_id  INT NOT NULL,
  like_time DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id, tweet_id),
  FOREIGN KEY (user_id)  REFERENCES Users(user_id),
  FOREIGN KEY (tweet_id) REFERENCES Tweets(tweet_id)
);

-- 7. Procedure to create a new account + profile
DELIMITER $$
CREATE PROCEDURE createAccount(
  IN p_username VARCHAR(50),
  IN p_email    VARCHAR(255),
  IN p_password VARCHAR(255),
  IN p_bio      TEXT
)
BEGIN
  INSERT INTO Users(email, password)
  VALUES(p_email, UNHEX(MD5(p_password)));
  SET @new_id = LAST_INSERT_ID();
  INSERT INTO Profiles(user_id, username, bio)
  VALUES(@new_id, p_username, p_bio);
END $$
DELIMITER ;

-- Example usage:
CALL createAccount('alice',   'alice@example.com',   'alicepass',   'Hello, I am Alice');
CALL createAccount('bob',     'bob@example.com',     'bobpass',     'Bob here!');
CALL createAccount('charlie', 'charlie@example.com', 'charliepass', 'Charlie’s bio');

-- 8. Procedure to follow another user
DELIMITER $$
CREATE PROCEDURE User_Follow(
  IN p_follower VARCHAR(50),
  IN p_followee VARCHAR(50)
)
BEGIN
  DECLARE fid INT;
  DECLARE feid INT;
  SELECT user_id INTO fid  FROM Profiles WHERE username = p_follower;
  SELECT user_id INTO feid FROM Profiles WHERE username = p_followee;
  INSERT IGNORE INTO Follows(follower_id, followee_id)
  VALUES(fid, feid);
END $$
DELIMITER ;

-- Example usage:
CALL User_Follow('alice', 'bob');
CALL User_Follow('bob',   'charlie');
CALL User_Follow('charlie','alice');

-- 9. Insert sample tweets
INSERT INTO Tweets(user_id, content) VALUES
  (1, 'My first tweet!'),
  (2, 'Hello world'),
  (1, 'Another day, another tweet'),
  (3, 'Charlie''s insights');

-- 10. Insert sample likes
INSERT INTO Likes(user_id, tweet_id) VALUES
  (2, 1), (3, 1), 
  (1, 2), 
  (3, 3);

-- 11. Show tweet count for a single user (e.g. alice)
SELECT
  p.username,
  COUNT(t.tweet_id) AS tweet_count
FROM Profiles p
LEFT JOIN Tweets t ON p.user_id = t.user_id
WHERE p.username = 'alice'
GROUP BY p.user_id;

-- 12. show schema completeness
SHOW TABLES;

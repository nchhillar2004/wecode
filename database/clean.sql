SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM users;
DELETE FROM user_data;
DELETE FROM tags;
DELETE FROM user_interests;
DELETE FROM followers;
DELETE FROM questions;
DELETE FROM comments;
DELETE FROM question_tags;
DELETE FROM solutions;
DELETE FROM servers;
DELETE FROM server_data;
DELETE FROM server_members;
DELETE FROM notification;
DELETE FROM search_index;
DELETE FROM logs;
SET FOREIGN_KEY_CHECKS = 1;

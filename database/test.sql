INSERT INTO users (username, email, password_hash, time) VALUES
('user1', 'user1@example.com', 'hashed_password_1', '10:30 AM'),
('user2', 'user2@example.com', 'hashed_password_2', '11:15 AM'),
('user3', 'user3@example.com', 'hashed_password_3', '12:00 PM');

INSERT INTO user_data (user_id, age, country, gender, user_rank, is_verified, privilages) VALUES
(4392, 25, 'USA', 'male', 'II', TRUE, 'admin'),
(4393, 22, 'India', 'female', 'III', FALSE, 'member'),
(4394, 30, 'UK', 'male', 'I', TRUE, 'visitor');

INSERT INTO questions (user_id, title, description, solution_id, time) VALUES
(4392, 'How to optimize SQL queries?', 'I need help optimizing SQL queries for large databases.', NULL, '02:45 PM'),
(4393, 'Best way to learn C++?', 'What is the best way to learn C++ for beginners?', NULL, '03:10 PM');

INSERT INTO tags (name) VALUES
('SQL'), ('C++'), ('Optimization');

INSERT INTO question_tags (question_id, tag_id) VALUES
(4392, 1), (4392, 3), (4393, 2);

INSERT INTO solutions (title, description, user_id, question_id, time) VALUES
('Indexing & Joins', 'Use proper indexing and optimized joins for faster SQL queries.', 4392, 4392, '04:00 PM'),
('Start with Basics', 'Begin with C++ fundamentals and then practice problem-solving.', 4393, 4393, '04:20 PM');

UPDATE questions SET solution_id = 4392 WHERE id = 4392;
UPDATE questions SET solution_id = 4393 WHERE id = 4393;

INSERT INTO servers (name, owner_id, server_rank, members_limit, rating, language, description, time) VALUES
('DevTalk', 4392, 'III', 500, 4, 'English', 'A server for developers to discuss programming.', '05:00 PM'),
('CodeHub', 4393, 'II', 1000, 5, 'English', 'A server dedicated to coding and problem-solving.', '06:00 PM');

INSERT INTO server_members (server_id, user_id, role, restrictions) VALUES
(4392, 4392, 'owner', NULL),
(4392, 4393, 'admin', NULL),
(4393, 4394, 'member', 'timeout');


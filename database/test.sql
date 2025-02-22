INSERT INTO users (username, email, password_hash, time) VALUES
('john_doe', 'john@example.com', 'hashed_password1', '12:00 AM'),
('jane_doe', 'jane@example.com', 'hashed_password2', '11:00 PM');

INSERT INTO user_data (user_id, name, bio, age, country, gender, user_rank, user_level, rating, is_verified, privileges)
VALUES (4392, 'John Doe', 'Software Developer', 25, 'USA', 'male', 'I', 5, 100, FALSE, 'member'),
       (4393, 'Jane Doe', 'Data Scientist', 27, 'UK', 'female', 'II', 10, 200, TRUE, 'admin');

INSERT INTO tags (name) VALUES ('Python'), ('Java'), ('C++');

INSERT INTO user_interests (user_id, tag_id) VALUES (4392, 1), (4393, 2);

INSERT INTO followers (follower_id, following_id) VALUES (4393, 4392), (4392, 4393);

INSERT INTO questions (user_id, title, description, difficulty, time) VALUES
(4392, 'How to use Python?', 'I need help with Python basics.', 'easy', '5:12 PM'),
(4393, 'What is polymorphism?', 'Explain polymorphism in OOP.', 'medium', '3:42 AM');

INSERT INTO comments (user_id, comment, source, source_id) VALUES
(4393, 'Great question!', 'question', 4392),
(4392, 'Try using inheritance.', 'question', 4393);

INSERT INTO question_tags (question_id, tag_id) VALUES (4392, 1), (4393, 2);

INSERT INTO solutions (title, description, user_id, question_id, state) VALUES
('Python Basics', 'Use print() for output.', 4392, 4393, 'accepted'),
('OOP Concepts', 'Polymorphism allows method overriding.', 4393, 4392, 'accepted');

INSERT INTO servers (name, owner_id, rating, language, description) VALUES
('DevTalk', 4392, 5, 'English', 'A server for developers'),
('TechGeeks', 4393, 4, 'English', 'Tech discussions');

INSERT INTO server_data (server_id, is_public, server_rank, members_limit) VALUES
(1, TRUE, 'I', 500),
(2, FALSE, 'II', 300);

INSERT INTO server_members (server_id, user_id, role) VALUES
(1, 4392, 'owner'),
(1, 4393, 'member'),
(2, 4393, 'owner');

INSERT INTO notification (user_id, sender_id, type, entity_id, entity_type) VALUES
(4392, 4393, 'new_follower', 4393, 'user'),
(4393, 4392, 'like', 4392, 'question');

INSERT INTO search_index (content_id, content_type, vector) VALUES
(4392, 'question', 'Python basics'),
(2, 'server', 'TechGeeks discussion');

INSERT INTO logs (user_id, activity, entity_id, entity_type) VALUES
(4392, 'registered', 4392, 'user'),
(4392, 'created_question', 4392, 'question');

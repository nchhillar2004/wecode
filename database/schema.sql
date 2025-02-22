CREATE DATABASE IF NOT EXISTS wecode_db;
USE wecode_db;

CREATE TABLE users (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    username      VARCHAR(40) NOT NULL UNIQUE,
    email         VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    time          VARCHAR(50)
) AUTO_INCREMENT=4392;

CREATE TABLE user_data (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NOT NULL,
    name        VARCHAR(50) DEFAULT NULL,
    bio         VARCHAR(255) DEFAULT NULL,
    age         INT DEFAULT NULL,
    country     VARCHAR(50) DEFAULT NULL,
    gender      ENUM('male', 'female') DEFAULT NULL,
    user_rank   ENUM('I', 'II', 'III', 'IV', 'V') DEFAULT 'I',
    user_level  INT DEFAULT 0,
    rating      INT DEFAULT 0,
    is_verified BOOLEAN DEFAULT FALSE,
    privileges  ENUM('admin', 'member', 'visitor') DEFAULT 'visitor',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE tags (
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE user_interests (
    id      INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    tag_id  INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE,
    UNIQUE(user_id, tag_id)
);

CREATE TABLE followers(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    follower_id  INT NOT NULL,
    following_id INT NOT NULL,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (follower_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (following_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE(follower_id, following_id)
);

CREATE TABLE questions (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NULL,
    title       VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    solution_id INT DEFAULT NULL,
    difficulty  ENUM('easy', 'medium', 'hard') NOT NULL,
    likes_count INT DEFAULT 0,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    time        VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) AUTO_INCREMENT=4392;

CREATE TABLE comments (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NOT NULL,
    comment     TEXT NOT NULL,
    source      ENUM('question', 'solution', 'post', 'comment') NOT NULL,
    source_id   INT NOT NULL,
    likes_count INT DEFAULT 0,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    time        VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE question_tags (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT NOT NULL,
    tag_id      INT NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE RESTRICT
);

CREATE TABLE solutions (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    user_id     INT NULL,
    question_id INT NOT NULL,
    state       ENUM('error', 'accepted') NOT NULL,
    likes_count INT DEFAULT 0,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    time        VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);

CREATE TABLE servers (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(20) NOT NULL,
    owner_id      INT NOT NULL,
    rating        INT DEFAULT 0,
    language      VARCHAR(50) DEFAULT 'English',
    description   VARCHAR(200) DEFAULT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    time          VARCHAR(50),
    FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE RESTRICT
);

CREATE TABLE server_data (
    id                    INT AUTO_INCREMENT PRIMARY KEY,
    server_id             INT NOT NULL,
    is_public             BOOLEAN DEFAULT TRUE,
    server_rank           ENUM('I', 'II', 'III', 'IV', 'V') DEFAULT 'I',
    is_verified           BOOLEAN DEFAULT FALSE,
    min_level_required    INT DEFAULT 0,
    min_age_required      INT DEFAULT 0,
    verification_required BOOLEAN DEFAULT FALSE,
    members_limit         INT NOT NULL DEFAULT 1000,
    server_level          INT DEFAULT 0,
    created_at            TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (server_id) REFERENCES servers(id) ON DELETE CASCADE
);

CREATE TABLE server_members (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    server_id    INT NOT NULL,
    user_id      INT NOT NULL,
    role         ENUM('owner', 'admin', 'member') DEFAULT 'member',
    restrictions ENUM('ban', 'timeout') DEFAULT NULL,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (server_id) REFERENCES servers(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE(server_id, user_id)
);

CREATE TABLE notification (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NOT NULL,
    sender_id   INT NOT NULL,
    type        ENUM('new_follower', 'comment', 'like') NOT NULL,
    entity_id   INT NOT NULL,
    entity_type ENUM('question', 'solution', 'server') NOT NULL,
    is_read     BOOLEAN DEFAULT FALSE,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE search_index(
    content_id   INT,
    content_type ENUM('question', 'server', 'user'),
    vector       TEXT NOT NULL,
    PRIMARY KEY (content_id, content_type)
)ENGINE=InnoDB;

CREATE TABLE logs (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NULL,
    activity    ENUM('created_question', 'created_solution', 'created_server', 'joined_server', 'liked_question', 'registered', 'logged_in', 'followed') NOT NULL,
    entity_id   INT NOT NULL,
    entity_type ENUM('question', 'solution', 'server', 'auth', 'user') NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

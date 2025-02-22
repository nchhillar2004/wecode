CREATE DATABASE IF NOT EXISTS wecode_db;
USE wecode_db;

CREATE TABLE users (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    username      VARCHAR(40) NOT NULL UNIQUE,
    email         VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    time          VARCHAR(50)
) AUTO_INCREMENT=4392; -- range 4392 - 99,999

CREATE TABLE user_data (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NOT NULL,
    age         INT DEFAULT NULL,
    country     VARCHAR(50) DEFAULT NULL,
    gender      ENUM('male', 'female') DEFAULT NULL,
    user_rank   ENUM('I', 'II', 'III', 'IV', 'V') DEFAULT 'I',
    is_verified BOOLEAN DEFAULT FALSE,
    privilages  ENUM('admin', 'member', 'visitor') DEFAULT 'visitor',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE questions (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NULL,
    title       VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    solution_id INT DEFAULT NULL,
    likes_count INT DEFAULT 0,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    time        VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) AUTO_INCREMENT=4392; -- range 4392 - 99,999

CREATE TABLE tags (
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL
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
    server_rank   ENUM('I', 'II', 'III', 'IV', 'V') DEFAULT 'I',
    members_limit INT NOT NULL DEFAULT 1000,
    rating        INT DEFAULT 0,
    language      VARCHAR(50) DEFAULT 'English',
    description   VARCHAR(200) DEFAULT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    time          VARCHAR(50),
    FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE RESTRICT
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

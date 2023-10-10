CREATE DATABASE yeticave
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;

USE yeticave;

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name_category VARCHAR(128),
    character_code VARCHAR(128)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(128) NOT NULL UNIQUE,
    user_name VARCHAR(128),
    user_password CHAR(12),
    contact TEXT
);

CREATE TABLE lots (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_create DATETIME DEFAULT CURRENT_TIMESTAMP,
    lot_name VARCHAR(128),
    lot_desc TEXT,
    lot_image VARCHAR(128),
    lot_price INT,
    date_expiration DATE,
    rate_interval INT,
    user_id INT,
    winner_id INT,
    category_id INT,
    FOREIGN KEY  (user_id) REFERENCES users(id),
    FOREIGN KEY (winner_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE rates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rate_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_price INT,
    user_id INT,
    lot_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (lot_id) REFERENCES lots(id)
);

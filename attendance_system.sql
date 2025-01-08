CREATE DATABASE attendance_system;
USE attendance_system;

CREATE TABLE attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    count INT DEFAULT 0
);
SHOW TABLES;
SELECT * FROM attendance;
DESCRIBE attendance;

DROP TABLE attendance;
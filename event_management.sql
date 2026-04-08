CREATE DATABASE event_management;
USE event_management;r
CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(50) NOT NULL,
    event_date DATE NOT NULL,
    location VARCHAR(50)
);
CREATE TABLE participants (
    participant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(15)
);
CREATE TABLE registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    participant_id INT,
    registration_date DATE,
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (participant_id) REFERENCES participants(participant_id)
);
DESCRIBE events;
DESCRIBE participants;
DESCRIBE registrations;
INSERT INTO events (event_name, event_date, location) VALUES
('Tech Fest','2025-02-10','Chennai'),
('Cultural Night','2025-02-15','Bangalore'),
('Startup Meet','2025-03-01','Hyderabad'),
('AI Workshop','2025-03-05','Pune'),
('Music Concert','2025-03-10','Mumbai'),
('Hackathon','2025-03-20','Delhi'),
('Art Exhibition','2025-03-25','Kolkata'),
('Sports Meet','2025-04-01','Jaipur'),
('Literary Fest','2025-04-05','Bhubaneswar'),
('Photography Walk','2025-04-10','Goa');
INSERT INTO participants (name, email, phone) VALUES
('Satya','satya@gmail.com','9876543210'),
('Amit','amit@gmail.com','9876543211'),
('Ravi','ravi@gmail.com','9876543212'),
('Neha','neha@gmail.com','9876543213'),
('Priya','priya@gmail.com','9876543214'),
('Rahul','rahul@gmail.com','9876543215'),
('Anita','anita@gmail.com','9876543216'),
('Karan','karan@gmail.com','9876543217'),
('Suman','suman@gmail.com','9876543218'),
('Vikas','vikas@gmail.com','9876543219');
INSERT INTO registrations (event_id, participant_id, registration_date) VALUES
(1,1,'2025-01-01'),
(2,2,'2025-01-02'),
(3,3,'2025-01-03'),
(4,4,'2025-01-04'),
(5,5,'2025-01-05'),
(6,6,'2025-01-06'),
(7,7,'2025-01-07'),
(8,8,'2025-01-08'),
(9,9,'2025-01-09'),
(10,10,'2025-01-10');
UPDATE events SET location='Coimbatore' WHERE event_id=1;
UPDATE participants SET phone='9999999999' WHERE participant_id=1;
UPDATE registrations SET registration_date='2025-01-15' WHERE registration_id=1;
SELECT * FROM events;
SELECT * FROM participants;
SELECT * FROM registrations;
DROP TABLE registrations;








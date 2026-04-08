DROP DATABASE IF EXISTS freelancer_db;
CREATE DATABASE freelancer_db;
USE freelancer_db;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    role ENUM('client', 'freelancer'),
    rating DECIMAL(2,1) DEFAULT 0
);

CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    title VARCHAR(200),
    description TEXT,
    budget DECIMAL(10,2),
    deadline DATE,
    status ENUM('open', 'closed') DEFAULT 'open',
    FOREIGN KEY (client_id) REFERENCES Users(user_id)
);

CREATE TABLE Bids (
    bid_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    freelancer_id INT,
    amount DECIMAL(10,2),
    delivery_days INT,
    status ENUM('pending', 'accepted', 'rejected') DEFAULT 'pending',
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (freelancer_id) REFERENCES Users(user_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    amount DECIMAL(10,2),
    payment_status ENUM('pending', 'completed'),
    payment_date DATE,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    reviewer_id INT,
    freelancer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (reviewer_id) REFERENCES Users(user_id),
    FOREIGN KEY (freelancer_id) REFERENCES Users(user_id)
);

INSERT INTO Users (name, email, role, rating) VALUES
('Alice', 'alice@mail.com', 'client', 0),
('Ethan', 'ethan@mail.com', 'client', 0),
('Bob', 'bob@mail.com', 'freelancer', 4.5),
('Charlie', 'charlie@mail.com', 'freelancer', 4.2),
('David', 'david@mail.com', 'freelancer', 3.8),
('Frank', 'frank@mail.com', 'freelancer', 4.7),
('Grace', 'grace@mail.com', 'freelancer', 4.3),
('Helen', 'helen@mail.com', 'freelancer', 3.9);

INSERT INTO Projects (client_id, title, description, budget, deadline, status) VALUES
(1, 'Logo Design', 'Need a modern logo', 2000, '2026-04-10', 'open'),
(1, 'Website Development', 'Build a portfolio website', 10000, '2026-04-20', 'open'),
(2, 'Mobile App UI', 'Design UI for app', 5000, '2026-04-15', 'open'),
(2, 'SEO Optimization', 'Improve website SEO', 3000, '2026-04-25', 'open');

INSERT INTO Bids (project_id, freelancer_id, amount, delivery_days, status) VALUES
(1, 3, 1800, 3, 'pending'),
(1, 4, 1500, 5, 'accepted'),
(1, 5, 1700, 4, 'rejected'),
(2, 3, 9500, 7, 'pending'),
(2, 6, 9000, 10, 'pending'),
(2, 7, 8700, 8, 'accepted'),
(3, 4, 4800, 6, 'pending'),
(3, 5, 4500, 7, 'accepted'),
(3, 8, 4600, 5, 'pending'),
(4, 6, 2800, 4, 'pending'),
(4, 7, 2600, 5, 'accepted'),
(4, 3, 2700, 6, 'pending');

INSERT INTO Payments (project_id, amount, payment_status, payment_date) VALUES
(1, 1500, 'completed', '2026-04-05'),
(2, 8700, 'completed', '2026-04-18'),
(3, 4500, 'completed', '2026-04-16'),
(4, 2600, 'pending', '2026-04-26');

INSERT INTO Reviews (project_id, reviewer_id, freelancer_id, rating, comment) VALUES
(1, 1, 4, 5, 'Excellent work'),
(2, 1, 7, 4, 'Very good'),
(3, 2, 5, 5, 'Outstanding UI'),
(4, 2, 7, 4, 'Good SEO work');

SELECT * FROM Projects;
SELECT * FROM Reviews;
SELECT * FROM Payments;
SELECT * FROM Bids;
SELECT * FROM Users;
SELECT * FROM Users WHERE role = 'freelancer';

SELECT B.bid_id, U.name AS freelancer, B.amount, B.delivery_days
FROM Bids B
JOIN Users U ON B.freelancer_id = U.user_id;

SELECT P.title, U.name AS client
FROM Projects P
JOIN Users U ON P.client_id = U.user_id;

SELECT project_id, MIN(amount) AS lowest_bid
FROM Bids
GROUP BY project_id;

SELECT freelancer_id, AVG(rating) AS avg_rating
FROM Reviews
GROUP BY freelancer_id;

SELECT name
FROM Users
WHERE user_id = (
    SELECT freelancer_id
    FROM Reviews
    GROUP BY freelancer_id
    ORDER BY AVG(rating) DESC
    LIMIT 1
);

SELECT * FROM Bids WHERE status = 'accepted';

SELECT u.name AS freelancer_name, SUM(pay.amount) AS total_earnings
FROM Users u
JOIN Bids b ON u.user_id = b.freelancer_id
JOIN Payments pay ON b.project_id = pay.project_id
WHERE b.status = 'accepted' AND pay.payment_status = 'completed'
GROUP BY u.user_id;
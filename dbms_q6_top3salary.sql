CREATE DATABASE dbms_q6_top3salary;
USE dbms_q6_top3salary;
CREATE TABLE Department (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department(id)
);
INSERT INTO Department VALUES
(1, 'IT'),
(2, 'HR');

INSERT INTO Employee VALUES
(1, 'Alice', 90000, 1),
(2, 'Bob', 85000, 1),
(3, 'Chris', 80000, 1),
(4, 'David', 75000, 1),
(5, 'Eva', 72000, 2),
(6, 'Frank', 70000, 2),
(7, 'Grace', 68000, 2);
SELECT * FROM Department;
SELECT * FROM Employee;
WITH RankedEmployees AS (
    SELECT 
        d.name AS Department,
        e.name AS Employee,
        e.salary,
        DENSE_RANK() OVER (
            PARTITION BY e.departmentId
            ORDER BY e.salary DESC
        ) AS rnk
    FROM Employee e
    JOIN Department d
      ON e.departmentId = d.id
)

SELECT Department, Employee, salary
FROM RankedEmployees
WHERE rnk <= 3;
department
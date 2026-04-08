CREATE DATABASE student;
USE student;
CREATE TABLE student_details (
    reg_no INT PRIMARY KEY,
    stud_name VARCHAR(25),
    dob DATE,
    address VARCHAR(50),
    phone_no BIGINT,
    branch VARCHAR(5),
    semester INT,
    percentage DECIMAL(5,2)
);
ALTER TABLE student_details
MODIFY stud_name VARCHAR(40);
ALTER TABLE student_details
ADD gender CHAR(1);
ALTER TABLE student_details
DROP gender;
CREATE TABLE student_copy AS
SELECT * FROM student_details;
DROP TABLE student_copy;
CREATE TABLE department (
    dept_id INT,
    dept_name VARCHAR(30) NOT NULL,
    location VARCHAR(20) DEFAULT 'BLOCK-A',
    CONSTRAINT pk_department PRIMARY KEY (dept_id),
    CONSTRAINT uq_dept_name UNIQUE (dept_name)
);
CREATE TABLE student (
    student_id INT,
    student_name VARCHAR(30) NOT NULL,
    email VARCHAR(40),
    age INT,
    dept_id INT,
    status VARCHAR(10) DEFAULT 'ACTIVE',

    CONSTRAINT pk_student PRIMARY KEY (student_id),
    CONSTRAINT uq_email UNIQUE (email),
    CONSTRAINT chk_age CHECK (age >= 18),
    CONSTRAINT fk_dept FOREIGN KEY (dept_id)
        REFERENCES department(dept_id)
);
INSERT INTO department VALUES (10, 'CSE', NULL);
INSERT INTO department VALUES (20, 'ECE', 'BLOCK-B');
INSERT INTO student VALUES (101, 'Anu', 'anu@gmail.com', 17, 10, NULL);
INSERT INTO student VALUES (102, NULL, 'ram@gmail.com', 18, 20, 'ACTIVE');
INSERT INTO student VALUES (103, 'Raj', 'anu@gmail.com', 19, 30, 'ACTIVE');
create table employee (empno int primary key,ename varchar(50),eaddress varchar(50),ephone int ,deptno int unique , jobid int,deptname varchar(5),designation varchar(50),salary int)
values into (;










show databases;
create database midterm;
drop database midterm;
create database satya;
use satya;
create table midterm (id int primary key auto_increment,name varchar(50) not null, age int,department varchar(50),marks int,city varchar(50));
show tables;
describe midterm;
insert into midterm (name,age,department,marks,city) values ('Rahul', 20, 'CSE', 85, 'Delhi'),
('Anita', 21, 'ECE', 90, 'Mumbai'),
('Vikram', 19, 'CSE', 75, 'Chennai'),
('Priya', 22, 'EEE', 88, 'Delhi'),
('Arjun', 20, 'CSE', 92, 'Kolkata');
select * from midterm;
#general insertion-insert into midterm values (,)(,);
/* the above seelctio which i have execute is specific selection and there is anothertype of insertionthat is as follows:
insert into student  (column) select (* or column) from tab where mark>400*/
select name ,department, marks,city from midterm where department='CSE' or department='ECE' and marks>85 and city ='Delhi' or city='Mumbai';
SELECT name, department, marks, city
FROM midterm
WHERE (department = 'CSE' OR department = 'ECE')
AND marks > 85
AND (city = 'Delhi' OR city = 'Mumbai');
#and has more priority than or
select * from midterm order  by marks desc;
SELECT MAX(marks) FROM midterm;
SELECT MIN(marks) FROM midterm;
SELECT AVG(marks) FROM midterm;
SELECT SUM(marks) FROM midterm;
SELECT COUNT(*) FROM midterm;
select department ,avg(marks) from midterm group by department having avg(marks)>85;
select name,city from midterm where name like '%a';
update midterm set marks=88 ,city='Hyderabad' where id = 2;
/*truncate table midterm
delete from midterm where id=3;*/
alter table midterm add no int;
select * from midterm;
alter table midterm modify marks float;  
alter table midterm change city location varchar(50);

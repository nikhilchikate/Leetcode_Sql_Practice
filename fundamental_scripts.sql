CREATE DATABASE temp1;

DROP DATABASE temp1;

CREATE DATABASE SQL_PRACTICE;

USE SQL_PRACTICE;

CREATE TABLE
    student (
        id INT PRIMARY KEY,
        name VARCHAR(20),
        age INT NOT NULL
    );

--  comment
-- DDL (Data definition Language) - create, alter, rename, truncate, drop
-- DQL (Data Query Language) - select
-- DML (Data manipulation Language) - insert, update, delete
-- DCL (Data Control Language) - grant, revoke
-- TCL (Transaction Control Language) - start transaction, commit, rollback
CREATE DATABASE STUDY;

CREATE DATABASE IF NOT EXISTS STUDY;

DROP DATABASE STUDY;

DROP DATABASE IF EXISTS STUDY;

SHOW DATABASES;

SHOW TABLES;

DROP TABLE student;

CREATE TABLE
    student (rollno INT PRIMARY KEY, name VARCHAR(50));

SELECT
    *
FROM
    student;

INSERT INTO
    student (rollno, name)
VALUES
    (101, "NIKHIL"),
    (102, "AMOL"),
    (103, "ABHIJEET"),
    (104, "RAMESH");

INSERT INTO
    student
VALUES
    (105, "PRIYA");

CREATE DATABASE xyz_company;

use xyz_company;

create table
    employee (id INT PRIMARY KEY, name varchar(50), salary int);

insert into
    Employee
values
    (1001, "RAMESH", 75000),
    (1002, "AMOL", 25000),
    (1003, "RAJ", 30000),
    (1004, "OREO", 20000);

select
    *
from
    employee;

-- constraints - NOT NULL, UNIQUE, PRIMARY KEY
create table
    temp1 (id int UNIQUE);

insert into
    temp1
values
    (101);

--  insert into temp1 values (101);  
--  will throw error due to UNIQUE constraint
use SQL_practice;

create table
    temp1 (id int primary key);

create table
    temp2 (
        id int,
        name varchar(50),
        age int,
        city varchar(50),
        primary key (city, age)
    );

--  default - to set default values
create table
    temp3 (id int primary key, sal int default 25000);

insert into
    temp3 (id)
values
    (101);

select
    *
from
    temp3;

-- check constraint - to check values
create table
    temp4 (id int, age int check (age > 18));

use sql_practice;

drop table stud;

create table
    stud (
        rollno int primary key,
        name varchar(50),
        marks int not null,
        grade varchar(1),
        city varchar(20)
    );

insert into
    stud (rollno, name, marks, grade, city)
values
    (101, "Nikhil", 98, "A", "Pune"),
    (102, "Amol", 78, "C", "Mumbai"),
    (103, "Ramesh", 85, "B", "Mumbai"),
    (104, "Abhijeet", 96, "A", "Nashik"),
    (105, "Raj", 30, "F", "Nashik"),
    (106, "Scot", 82, "B", "Nashik");

select
    *
from
    stud;

select
    name,
    marks
from
    stud;

select
    city
from
    stud;

select distinct
    city
from
    stud;

-- where clause
select
    *
from
    stud
where
    marks > 80;

select
    *
from
    stud
where
    name like '%e%';

select
    *
from
    stud
where
    grade = 'B';

-- operator 
-- arithematic + - * / %
select
    *
from
    stud
where
    marks + 10 > 80;

-- comparison =, != , >, <, >=, <=
select
    *
from
    stud
where
    city != 'Pune';

-- logical and or not in between all like any
select
    *
from
    stud
where
    city = 'Pune'
    or city = 'Nashik';

select
    *
from
    stud
where
    marks between 80 and 90;

select
    *
from
    stud
where
    city not in ('Nashik');

--  bitwise &, |
--  Order by - ASC, desc
select
    *
from
    stud
order by
    city desc;

select
    *
from
    stud
order by
    marks desc
limit
    3;

-- aggregate function - count(), max(), min(), sum(), avg()
select
    avg(marks) avg_marks
from
    stud;

select
    max(marks)
from
    stud;

select
    sum(marks)
from
    stud;

select
    count(name)
from
    stud
where
    city = 'Nashik';

-- group by - we have to put all select atribute in group by
select
    city,
    count(name)
from
    stud
group by
    city;

select
    city,
    avg(marks)
from
    stud
group by
    city;

select
    city,
    name,
    count(name)
from
    stud
group by
    city,
    name;

select
    city,
    avg(marks) avg_marks
from
    stud
group by
    city
order by
    avg(marks) desc;

select
    grade,
    count(rollno)
from
    stud
group by
    grade
order by
    grade;

-- having clause
select
    count(name),
    city
from
    stud
group by
    city
having
    max(marks) > 90;

-- general order: select - from - where - group by - having - order by
select
    city
from
    stud
where
    grade = 'A'
group by
    city
having
    max(marks) > 90
order by
    city;

-- update query
select
    *
from
    stud;

update stud
set
    grade = 'O'
where
    grade = 'A';

set
    SQL_SAFE_UPDATES = 0;

update stud
set
    marks = 82
where
    rollno = 105;

update stud
set
    grade = 'B'
where
    marks between 80 and 90;

update stud
set
    marks = marks + 1;

-- delete 
delete from stud
where
    marks < 40;

-- delete from table name to delete table
-- foreign key
drop table dept;

drop table teacher;

create table
    dept (id int primary key, name varchar(50));

create table
    teacher (
        id int primary key,
        name varchar(50),
        dept_id int,
        foreign key (dept_id) references dept (id) on delete cascade on update cascade
    );

-- cascading foreign concept
-- ondelete cascade onupdate cascade
insert into
    dept
values
    (101, "English"),
    (102, "IT");

select
    *
from
    dept;

insert into
    teacher
values
    (101, "Nikhil", 101),
    (102, "Abhijeet", 102);

select
    *
from
    teacher;

update dept
set
    id = 105
where
    id = 101;

-- alter - add col, drop col, rename table
select
    *
from
    stud;

alter table stud
add column age int default 25;

alter table stud
drop column age;

alter table stud
add column age int default 19;

alter table stud modify column age varchar(2);

insert into
    stud
values
    (107, 'Test', 87, 'B', 'Delhi', 12);

alter table stud change age stu_age int;

insert into
    stud
values
    (108, 'Test1', 87, 'B', 'Delhi', 102);

alter table stud
drop column stu_age;

alter table stud
rename to studd;

alter table studd
rename to stud;

-- truncate delete table data
truncate table stud;

select
    *
from
    stud;

alter table stud change name full_name varchar(50);

delete from stud
where
    marks < 90;

alter table stud
drop column grade;

-- Joins
--  Inner join - intersection
--  Left join - all of left side
--  Right join - all of right side
--  Full join - all of left and right side
drop table stud1;

drop table course;

create table
    stud1 (id int primary key, name varchar(50));

create table
    course (id int, course_name varchar(50));

insert into
    stud1
values
    (101, "Nik"),
    (102, "Abhi"),
    (103, "Ram");

insert into
    course
values
    (102, "English"),
    (105, "Math"),
    (103, "Science"),
    (107, "CS");

--  inner join
select
    *
from
    stud1
    inner join course on stud1.id = course.id;

-- alias
select
    *
from
    stud1 as s
    inner join course as c on s.id = c.id;

-- left join
select
    *
from
    stud1
    left join course on stud1.id = course.id;

-- right join
select
    *
from
    stud1
    right join course on stud1.id = course.id;

-- full join
select
    *
from
    stud1
    left join course on stud1.id = course.id
union
select
    *
from
    stud1
    right join course on stud1.id = course.id;

--  Left exclusive join - only left by removing whole of right
select
    *
from
    stud1
    left join course on stud1.id = course.id
where
    course.id is null;

--  Right Exclusive join - only right by removing whole of left
select
    *
from
    stud1
    right join course on stud1.id = course.id
where
    stud1.id is null;

--  full exclusive join - except intersection
select
    *
from
    stud1
    left join course on stud1.id = course.id
where
    course.id is null
union
select
    *
from
    stud1
    right join course on stud1.id = course.id
where
    stud1.id is null;

--  self join 
create table
    employee (
        id int primary key,
        name varchar(50),
        manager_id int
    );

insert into
    employee
values
    (101, "Abhijeet", 103),
    (102, "Amol", 104),
    (103, "Nikhil", NULL),
    (104, "Ramesh", 103);

select
    *
from
    employee;

select
    a.name as manager_name,
    b.name
from
    employee a
    join employee b on a.id = b.id;

-- unions
select
    name
from
    employee
union
select
    name
from
    employee;

--  Union All
select
    name
from
    employee
union all
select
    name
from
    employee;

-- Sub query
select
    name,
    marks
from
    stud
where
    marks > (
        select
            avg(marks)
        from
            stud
    );

-- select name, rollno from stud where rollno in (
-- select rollno from stud where rollno % 2 = 0);
select
    max(marks)
from
    (
        select
            *
        from
            stud
        where
            city = 'Nashik'
    ) as temp;

select
    (
        select
            max(marks)
        from
            stud
    ),
    name
from
    stud;

-- Views - virtual table
create view
    marksview as
select
    rollno,
    name,
    marks
from
    stud;

select
    *
from
    marksview;

select
    *
from
    view1;

drop view view1;
-- Create database
create database company;
-- use database
use company;

-- create Employee table

create table Employee ( 
Ssn int Not Null PRIMARY KEY identity(1,1),
Fname VARCHAR(20) NOT NULL,
Lname VARCHAR(20) NOT NULL,
Minit VARCHAR(20) NOT NULL,
Bdate DATE NOT NULL,
EmpAddress VARCHAR(50) NOT NULL,
Sex VARCHAR(20) NOT NULL,
Salary int Constraint Ck_Emp_Sal CHECK (Salary between 100 and 1500),
Super_ssn int , foreign key (Super_ssn) references Employee(Ssn));


-- Create Department table	

create table Department ( 
Dnumber int Not Null PRIMARY KEY identity(1,1),
Dname VARCHAR(20) NOT NULL,
Mgr_ssn  int ,foreign key (Mgr_ssn) references Employee(Ssn),
Mgr_Start_Date  DATE );


-- create Dept_Locations table

create table Dept_Locations (
Dnumber int NOT NULL, foreign key (Dnumber) references Department(Dnumber),
Dlocation VARCHAR(50) NOT NULL,
primary key (Dnumber, Dlocation));


-- create Project table

create table Project(
Pname VARCHAR(20) NOT NULL,
Pnumber int Not Null PRIMARY KEY identity(1,1),
Plocation VARCHAR(50) NOT NULL,
Dnum int , foreign key (Dnum) references Department(Dnumber)
);

-- create Works_on table

create table Work_On (
Pno int , foreign key (Pno) references Project(Pnumber),
Hours Time 
);

-- create Dependent table

create table Dependent(
Essn int NOT NULL, foreign key (Essn) references Employee(Ssn),
Dependent_Name VARCHAR(50) NOT NULL,
Bdate DATE NOT NULL,
Relationship VARCHAR(50) NOT NULL,
Sex VARCHAR(20) NOT NULL,
primary key (Essn, Dependent_Name)
);

-- add ess in works_on
alter table Work_On
add Essn int foreign key (Essn) references Employee(Ssn)


-- add not null on work on table for Pno column
alter table Work_On
alter column Pno int Not null 
-- add not null on work on table for Essn column
alter table Work_On
alter column Essn int Not null

-- add not null on Project table for Dnum column

alter table Project
alter column Dnum int Not null

-- add not null on Employee table for Super_ssn column 

alter table Employee
alter column Super_ssn int null



------------------------------
-- insert Data to Employee table
-- use database
use company;

--------------------
INSERT INTO Employee (Fname, Lname, Minit, Bdate, EmpAddress, Sex, Salary, Super_ssn)
VALUES
('John', 'Doe', 'A', '1990-05-12', '123 Elm St', 'Male', 1200, null),     
('Sarah', 'Mills', 'B', '1985-07-18', '456 Oak St', 'Female', 1100, 39),
('Alice', 'Smith', 'C', '1992-09-10', '789 Pine St', 'Female', 1000, 39),
('Tom', 'Brown', 'D', '1995-03-22', '321 Maple St', 'Male', 1050, 39),
('Eva', 'Johnson', 'E', '1991-12-05', '654 Cedar St', 'Female', 1300, 39);

select * from Employee;

truncate table Employee;

-- insert data in department table
INSERT INTO Department (Dname, Mgr_ssn, Mgr_Start_Date)
VALUES ('Finance', 39, '2022-01-01'),
       ('HR', 39, '2022-03-15'),
       ('IT', 39, '2022-06-01');

select * from Department;


INSERT INTO Dept_Locations (Dnumber, Dlocation)
VALUES 
(2, 'New York'),
(2, 'Los Angeles'),
(2, 'Chicago'),
(3, 'San Francisco'),
(3, 'Seattle');

select * from Dept_Locations;

SELECT * FROM Project;

INSERT INTO Project( Pname,Plocation,Dnum)
VALUES 
('Airport Expansion', 'Muscat', 2),
('Runway Maintenance', 'Dubai', 2),
('Cargo Facility Upgrade', 'Doha', 3),
('Terminal Redesign', 'Abu Dhabi', 4),
('Ground Systems Upgrade', 'Bahrain',3);

ALTER TABLE Project
ALTER COLUMN Pname VARCHAR(300);

--------------------


select * from Work_On;

INSERT INTO Work_On (Pno, Hours , Essn)
VALUES 
(5,'08:00', 45),
(6,'06:40',55);

-----------------------------



select * from Dependent;

INSERT INTO Dependent (Essn,Dependent_Name , Bdate , Relationship , Sex )
VALUES
(51,'Ali Khan', '2010-05-14', 'Son', 'M'),
(54,'Ayesha Khan', '2012-08-20', 'Daughter', 'F'),
(45,'Fatima Bibi', '1985-11-03', 'Wife', 'F'),
(39,'Yusuf Khan', '1955-01-30', 'Father', 'M'),
(56,'Zainab Bibi', '1960-04-12', 'Mother', 'F');
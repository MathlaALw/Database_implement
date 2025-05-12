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
Salary int Constraint Ck_Emp_Sal CHECK (Salary between 100 and 1500),Super_ssn int , foreign key (Super_ssn) references Employee(Ssn));

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
alter column Super_ssn int Not null
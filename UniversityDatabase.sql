-- Create database
create database university;
-- use database
use university;

-- create Student table

create table Student (
SID int NOT NULL PRIMARY KEY identity(1,1),
Fname VARCHAR(20) NOT NULL,
Lname VARCHAR(20) NOT NULL,


);
-- create Faculty table
create table Faculty(
FID int NOT NULL PRIMARY KEY identity(1,1),
F_Name VARCHAR(20) NOT NULL,
Department VARCHAR(20) NOT NULL,
Salary int Constraint Ck_Emp_Sal CHECK (Salary > 0),


);

-- create FacultyMopile table

create table FacultyMopile (
FID int NOT NULL, foreign key (FID) references Faculty(FID),
Mobile_No VARCHAR(20) NOT NULL ,
PRIMARY KEY (FID,Mobile_No)

);

-- create Subjects table

create table Subjects(
Subject_ID int NOT NULL PRIMARY KEY identity(1,1),
Subject_Name VARCHAR(20) NOT NULL ,
FID int NOT NULL, foreign key (FID) references Faculty(FID),

);

-- create StudentPhone table

create table StudentPhone (
SID int NOT NULL, foreign key (SID) references Student(SID),
Mobile_No VARCHAR(20) NOT NULL ,
PRIMARY KEY (SID,Mobile_No)

);

-- create StudentAddress table
create table StudentAddress(
SID int NOT NULL, foreign key (SID) references Student(SID),
City VARCHAR(20) NOT NULL ,
State VARCHAR(20) NOT NULL ,
Pin_Code VARCHAR(20) NOT NULL ,
PRIMARY KEY ( SID , City , State , Pin_Code)
);

-- create Hostel table

create table Hostel (
Hostel_ID int NOT NULL PRIMARY KEY identity(1,1),
Hostel_Name VARCHAR(50) NOT NULL ,
No_OF_Seats int NOT NULL 

);

-- create Course table

create table Course (
Course_ID int NOT NULL PRIMARY KEY identity(1,1),
Duration Time NOT NULL ,
Course_Name VARCHAR(50) NOT NULL ,

);

-- create Exam table

create table Exam (
Exam_Code int NOT NULL PRIMARY KEY identity(1,1),
Room VARCHAR(20) NOT NULL ,
E_Date Date  NOT NULL,
E_Time Time  NOT NULL,


);

-- create Department table 

create table Department (
Department_ID int NOT NULL PRIMARY KEY identity(1,1),
D_Name VARCHAR(50) NOT NULL ,

);

-- create StudentCourse table

create table StudentCourse (
SID int NOT NULL, foreign key (SID) references Student(SID),
Course_ID int NOT NULL, foreign key (Course_ID) references Course(Course_ID),


);

-- add department_ID as foreign key in Faculty table

alter table Faculty
add Department_ID int NOT NULL foreign key (Department_ID) references Department(Department_ID)

-- add FID as foreign key in Subjects table

alter table Subjects
add FID int NOT NULL foreign key (FID) references Faculty(FID)


-- add FID, Hostel_ID,Course_ID as foreign key in Student table
alter table Student
add FID int NOT NULL foreign key (FID) references Faculty(FID)


alter table Student
add Hostel_ID int NOT NULL foreign key (Hostel_ID) references Hostel(Hostel_ID)

alter table Student
add Course_ID int NOT NULL foreign key (Course_ID) references Course(Course_ID)



-- add SID, Depatrtment_ID as foreign key in Course table


alter table Course
add SID int NOT NULL foreign key (SID) references Student(SID)



alter table Course
add Department_ID int NOT NULL foreign key (Department_ID) references Department(Department_ID)


-- add Depatrtment_ID as foreign key in Exams table

alter table Exam
add Department_ID int NOT NULL foreign key (Department_ID) references Department(Department_ID)


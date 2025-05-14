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
E_Date DATE  NOT NULL,
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

-- modify the data type of date column in exam table
ALTER TABLE Exam
ADD E_Date DATE;
-- DELETE DEPARTMENT COLUMN IN FACULTY TABLE
ALTER TABLE Faculty DROP COLUMN Department;
--- rename table name

EXEC sp_rename 'FacultyMopile','FacultyMobile';

---------------------------





------------------------


--------------------
INSERT INTO Department (D_Name)
VALUES ('IT'),
		('HR'),
		('BUSINESS'),
		('ENGINEERING')

SELECT * FROM Department;
-----------------
INSERT INTO Hostel (Hostel_Name,No_OF_Seats)
VALUES ('ALNOOR',50),
		('Green Leaf Hostel',120),
		('Dormitory Den',70),
		('GradHouse Hostel',30),
		('Campus Corner Hostel',90);

SELECT * FROM Hostel;
---------------
INSERT INTO Exam (Room, E_Date, E_Time, Department_ID)
VALUES 
(1, '2025-01-01', '08:30:00', 1),
(2, '2025-10-21', '10:15:00', 2),
(3, '2025-10-22', '12:50:00', 3),
(4, '2025-10-24', '13:30:00', 4);
		
SELECT * FROM Exam;

------

SELECT * FROM Faculty;

INSERT INTO Faculty (F_Name, Salary, Department_ID)
VALUES 
('Ahmed',800.40,1),
('Salim',600,2),
('Safa',400,3),
('Ali',750.4,4);

------

SELECT * FROM FacultyMobile;

INSERT INTO FacultyMobile (FID,Mobile_No)
	VALUES 
	(1,98765432),
	(1,96325874),
	(2,99887766),
	(3,98745633),
	(4,78495162)



-------
---FK Delete column---
-- modify Student table delete course id column wich is Fk 
ALTER TABLE Student DROP CONSTRAINT FK__Student__Course___534D60F1;
ALTER TABLE Student DROP COLUMN Course_ID;
---------------------------




SELECT * FROM Student ;


-- adding data in student table


INSERT INTO Student (Fname, Lname,FID , Hostel_ID)
VALUES ('Salim' , 'alwahaibi',1,1),
		('Omar','Alwahaibi',1,2),
		('Fatma','Alwahaibi',2,3),
		('Sara','Alwahaibi',2,4)

--- adding data in course table



SELECT * FROM Course ;


INSERT INTO Course (Duration, Course_Name,SID , Department_ID)
VALUES 
('08:30:00', 'Mathematics', 2, 3),
('04:30:00', 'Physics', 3, 4),
('05:30:00', 'Computer Science', 4, 1);


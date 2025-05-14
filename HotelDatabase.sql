-- Create database
create database hotel;
-- use database
use hotel;

-- create Customers table

create table Customer(
C_ID int NOT NULL PRIMARY KEY identity(1,1),
C_Name VARCHAR(20) NOT NULL ,
Email VARCHAR(50) NOT NULL ,

);


-- create CustomersPhone table

create table CustomersPhone(
C_ID int NOT NULL, foreign key (C_ID) references Customer(C_ID),
Phone VARCHAR(20) NOT NULL ,
Primary key (C_ID,Phone)
);

-- create Staff table

create table Staff(
S_ID int NOT NULL PRIMARY KEY identity(1,1),
S_Name VARCHAR(20) NOT NULL ,
Job_Title VARCHAR(50) NOT NULL ,
Salary int Constraint Ck_Emp_Sal CHECK (Salary > 0),

);

-- create Branch table
create table Branch (
Branch_ID int NOT NULL PRIMARY KEY identity(1,1),
B_Name  VARCHAR(20) NOT NULL ,
Location VARCHAR(50) NOT NULL ,
S_ID int NOT NULL , foreign key (S_ID) references Staff(S_ID),

);
-- fot modifing the error 
-- drop table Booking;
-- create Booking table 

create table Booking (
Booking_ID int NOT NULL PRIMARY KEY identity(1,1),
Check_In_Date Date NOT NULL,
Check_Out_Date Date NOT NULL,
C_ID int NOT NULL, foreign key (C_ID) references Customer(C_ID),
S_ID int NOT NULL , foreign key (S_ID) references Staff(S_ID),
);


-- create Room table
create table Room (
Room_Number int NOT NULL PRIMARY KEY identity(1,1),
R_Type VARCHAR(20) NOT NULL ,
Nightly_rate int Not null CHECK (Nightly_rate BETWEEN 1 AND 5),
CheckAvailability nvarchar(10) check (CheckAvailability In ('Available','NotAvailable')),
Branch_ID int NOT NULL ,foreign key (Branch_ID) references Branch(Branch_ID),
C_ID int NOT NULL, foreign key (C_ID) references Customer(C_ID),
Booking_ID int NOT NULL,foreign key (Booking_ID) references Booking(Booking_ID),

);


-- use database
use hotel;
-------------- adding data into tables ------------------------

SELECT * FROM Staff;
INSERT INTO Staff ( S_Name , Job_Title , Salary)
VALUES
('Fatima Al-Mahrouqi', 'Branch Manager', 1200.00),
('Hassan Al-Habsi', 'Accountant', 950.00),
('Salma Al-Kalbani', 'Receptionist', 600.00),
('Majid Al-Balushi', 'Loan Officer', 1000.00),
('Alya Al-Siyabi', 'IT Support', 850.00);

-------------------------------------
SELECT * FROM Branch;
INSERT INTO Branch ( B_Name , Location , S_ID)
VALUES 
('Central Branch', 'Muscat', 1),
('North Branch', 'Sohar', 2),
('East Branch', 'Sur', 3),
('South Branch', 'Salalah', 4),
('West Branch', 'Nizwa', 5);

---------------------------------

SELECT * FROM Customer;
INSERT INTO Customer ( C_Name ,Email )
VALUES 
('Ahmed Al-Mamari', 'ahmedmamari@gmail.com'),
('Salma Al-Busaidi', 'salmabusaidi@gmail.com'),
('Yousef Al-Lawati', 'youseflawati@gmail.com'),
('Alya Al-Harthy', 'alyaharthy@gmail.com'),
('Khalid Al-Shukaili', 'khalidshukaili@gmail.com');

--------------------------------------

SELECT * FROM CustomersPhone;
INSERT INTO CustomersPhone(C_ID, Phone)
VALUES 
(1, '97865432'),
(2, '92345678'),
(3, '90123456'),
(4, '98765432'),
(5, '93456789');

----------------------------

SELECT * FROM Booking;

INSERT INTO Booking ( Check_In_Date , Check_Out_Date , C_ID , S_ID)
VALUES
('2025-05-15', '2025-05-18', 1, 2),
('2025-06-01', '2025-06-05', 2, 3),
('2025-06-10', '2025-06-12', 3, 4),
('2025-07-01', '2025-07-10', 4, 5),
('2025-07-15', '2025-07-20', 5, 1);

------------------------------

SELECT * FROM Room;
INSERT INTO Room ( R_Type , Nightly_rate , CheckAvailability , Branch_ID , C_ID , Booking_ID)
VALUES 
('Single', 1, 'Available', 1, 1, 1),
('Double', 2, 'NotAvailable',    2, 2, 2),
('Suite',  4, 'Available', 3, 1, 1),
('Single', 5, 'NotAvailable',    4, 3, 3);

ALTER TABLE Room
alter COLUMN CheckAvailability nvarchar(60);


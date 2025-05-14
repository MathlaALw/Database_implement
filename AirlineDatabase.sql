-- Create database
create database airline;
-- use database
use airline;

-- create Airport table

create table Airport(
Airport_Code int NOT NULL PRIMARY KEY identity(1,1),
City  VARCHAR(20) NOT NULL ,
A_State  VARCHAR(20) NOT NULL ,
A_Name  VARCHAR(20) NOT NULL ,

);

-- create Airplane_Type table

create table Airplane_Type(
Type_Name VARCHAR(200) NOT NULL PRIMARY KEY ,
Company  VARCHAR(200) NOT NULL ,
Max_Seats  int NOT NULL ,
A_Name  VARCHAR(200) NOT NULL ,
Airport_Code int NOT NULL, foreign key (Airport_Code) references Airport(Airport_Code),

);

-- create Airplane_Airport table

create table Airplane_Airport (
Airport_Code int NOT NULL, foreign key (Airport_Code) references Airport(Airport_Code),
Type_Name int NOT NULL, foreign key (Type_Name) references Airplane_Type(Type_Name),
PRIMARY KEY ( Airport_Code,Type_Name)

);

-- create Airplane table

create table Airplane(
Airplane_ID int NOT NULL PRIMARY KEY identity(1,1),
Total_No_Of_Seats  int NOT NULL ,

Type_Name int NOT NULL, foreign key (Type_Name) references Airplane_Type(Type_Name),

);


-- create LegInstance table

create table LegInstance(
Leg_Date Date NOT NULL PRIMARY KEY ,
NO_Of_Available_Seats  int NOT NULL ,
Dep_Time Time NOT NULL ,
Arr_Time Time NOT NULL ,
Ariport_Code int NOT NULL , foreign key (Ariport_Code) references Airport(Airport_Code),

);


-- create Seats table


create table Seats(
Seat_No int NOT NULL PRIMARY KEY ,
NO_Of_Available_Seats int NOT NULL ,
Leg_Date date NOT NULL , foreign key (Leg_Date) references LegInstance(Leg_Date),

);


-- create Reservation table

create table Reservation(
Seat_No int NOT NULL , foreign key (Seat_No) references Seats(Seat_No),
Leg_Date date NOT NULL , foreign key (Leg_Date) references LegInstance(Leg_Date),
R_Date date NOT NULL ,
Customer_Name VARCHAR(50) NOT NULL ,
CPhone VARCHAR(20) NOT NULL ,
PRIMARY KEY ( Seat_No, Leg_Date)
);

-- create FlightLeg table
create table FlightLeg(
Leg_No int NOT NULL PRIMARY KEY identity(1,1),
Sechuled_Dep_Time Time NOT NULL,
Sechuled_Arr_Time Time NOT NULL,
Airport_Code int NOT NULL, foreign key (Airport_Code) references Airport(Airport_Code),


);

-- create Flight table
create table Flight(
Number int NOT NULL PRIMARY KEY identity(1,1),
Airline varchar(50) NOT NULL,
Weekdays int Not null CHECK (Weekdays BETWEEN 1 AND 7),

);

-- create Fare table

create table Fare(
Code int NOT NULL PRIMARY KEY identity(1,1),
Amount float(5) Not null ,
Relations nvarchar(20) not null ,
Number int NOT NULL ,  foreign key (Number) references Flight(Number)
);

-- add Leg_No as foreign key in LegInstance table

alter table LegInstance
add Leg_No int NOT NULL foreign key (Leg_No) references FlightLeg(Leg_No)


-- add Leg_No as foreign key in LegInstance table

alter table FlightLeg
add Number int NOT NULL foreign key (Number) references Flight(Number)

ALTER TABLE Airplane 
add Type_Name int NOT NULL, foreign key (Type_Name) references Airplane_Type(Type_Name)


--------------adding data into tables -----( DML ) ----------------
-- use database
use airline;

-- airport table

SELECT * FROM Airport;

INSERT INTO Airport(City,A_State,A_Name)
VALUES 
('Muscat', 'Muscat', 'Muscat International Airport'),
('New York', 'New York', 'JFK International Airport'),
('Los Angeles', 'California', 'LAX Airport');

-- data type of A_Name the width 

ALTER TABLE Airport
ALTER COLUMN A_Name VARCHAR(100);


-------------------

-- Airplane type

SELECT * FROM Airplane_Type;

-- CHANGE THE DATA TYPE OF PK IN AIRPLANE_TYPE 
--SELECT name FROM sys.foreign_keys WHERE PERENT = OBJECT_ID('Airplane_Type');
ALTER TABLE Student DROP CONSTRAINT FK_Airplane_Type;
ALTER TABLE Student DROP COLUMN Course_ID;
-- -- Which column is the PK and what is its type?
EXEC sp_pkeys @table_name = 'Airplane_Type';

ALTER TABLE dbo.Airplane DROP CONSTRAINT FK_Airplane_Type;

ALTER TABLE dbo.Airplane_Type
DROP CONSTRAINT PK__Airport___622A225CCED9DCB2; 



ALTER TABLE Airplane_Type
ALTER COLUMN Type_Name varchar(100) NOT NULL;

ALTER TABLE dbo.Airplane_Airport
ADD CONSTRAINT PK_Airport_Code
PRIMARY KEY (Airport_Code);

ALTER TABLE dbo.Airplane
ADD CONSTRAINT PK_Airplane_ID
PRIMARY KEY (Airplane_ID);



ALTER TABLE Airplane_Airport DROP CONSTRAINT FK__Airplane___Type___3E52440B;
ALTER TABLE Airplane DROP CONSTRAINT FK__Airplane__Type_N__412EB0B6;
ALTER TABLE Airplane_Type DROP CONSTRAINT PK__Airport___622A225CCED9DCB2;

drop table Airplane_Type;

--create table Airplane_Type with the fixed type

--then : 
ALTER TABLE Airplane_Airport DROP COLUMN Type_Name;
ALTER TABLE Airplane DROP COLUMN Type_Name;

ALTER TABLE Airplane_Type DROP COLUMN A_Name;
ALTER TABLE Airplane 
add Type_Name VARCHAR(200) NOT NULL, foreign key (Type_Name) references Airplane_Type(Type_Name)


ALTER TABLE Airplane_Airport 
add Type_Name VARCHAR(200) NOT NULL, foreign key (Type_Name) references Airplane_Type(Type_Name)

----------------------


INSERT INTO Airplane_Type (Type_Name,Company,Max_Seats,Airport_Code)
VALUES 
('Boeing 737', 'Boeing', 189, 2),
('Airbus A320', 'Airbus', 180, 2),
('Embraer E190', 'Embraer', 114, 3),
('Bombardier CRJ900', 'Bombardier', 90, 3);

SELECT * FROM Airplane_Type;

---------------------------
SELECT  * FROM Airplane_Airport;

ALTER TABLE dbo.Airplane_Airport
drop CONSTRAINT PK_Airport_Code;

INSERT INTO Airplane_Airport (Airport_Code,Type_Name)
VALUES 
(2, 'Boeing 737'),
(2, 'Airbus A320'),
(3, 'Embraer E190'),
(3, 'Bombardier CRJ900')

--------------------------

SELECT  * FROM Airplane;

INSERT INTO Airplane ( Total_No_Of_Seats,Type_Name)
values
(189, 'Boeing 737'),
(180, 'Airbus A320'),
(114, 'Embraer E190'),
(90,  'Bombardier CRJ900')

-------------------

select * FROM Flight;

INSERT INTO Flight ( Airline, Weekdays)
VALUES 
('Oman Air', 2),  -- Monday
('Qatar Airways', 5),  -- Thursday
('Emirates', 7);  -- Saturday

--------------------------
SELECT  * FROM Fare;

INSERT INTO Fare ( Amount, Relations ,Number)
VALUES 
(50.00, 'Child', 1),
(75.00, 'Student', 2),
(100.00, 'Business Class', 3)

---------------------------------

select * FROM FlightLeg;

INSERT INTO FlightLeg ( Sechuled_Dep_Time,Sechuled_Arr_Time,Airport_Code,Number)
VALUES
('08:00', '10:30', 2, 1),
('12:00', '14:45', 2, 2),
('15:15', '17:50', 3, 3),
('19:00', '21:30', 3, 1)


-------------------------------

SELECT * FROM LegInstance;

INSERT INTO LegInstance (Leg_Date,NO_Of_Available_Seats,Dep_Time,Arr_Time,Ariport_Code,Leg_No)
VALUES 
('2025-07-01', 150, '08:00', '10:30', 2, 6),
('2025-07-02', 120, '11:15', '13:45', 2, 7),
('2025-07-03', 100, '14:30', '17:00', 3, 8),
('2025-07-04',  90, '18:00', '20:40', 3, 9);

-------------------------

SELECT * FROM Seats;

INSERT INTO Seats (Seat_No,NO_Of_Available_Seats,Leg_Date)
VALUES 
(1,150, '2025-07-01'),
(2,120, '2025-07-02'),
(3,100, '2025-07-03'),
(4,90,  '2025-07-04');

----------------------

SELECT * FROM Reservation;

INSERT INTO Reservation ( Seat_No,R_Date,Customer_Name,CPhone,Leg_Date)
VALUES 
(1, '2025-07-01', 'John Doe', '9997890', '2025-07-01'),
(2, '2025-07-02', 'Jane Smith', '9879910', '2025-07-02'),
(3, '2025-07-03', 'Alice Johnson', '99354567', '2025-07-03'),
(4, '2025-07-04', 'Bob Brown', '99996543', '2025-07-04');
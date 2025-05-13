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
Type_Name int NOT NULL PRIMARY KEY identity(1,1),
Company  VARCHAR(50) NOT NULL ,
Max_Seats  int NOT NULL ,
A_Name  VARCHAR(20) NOT NULL ,
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




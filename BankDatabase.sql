-- Create database
create database bank;
-- use database
use bank;

-- create Customers table

create table Customer (
Customer_ID int NOT NULL PRIMARY KEY identity(1,1),
CName VARCHAR(20) NOT NULL ,
Date_Of_Birth Date not null ,
Issue_Date Date not null ,
Action_Type VARCHAR(20) NOT NULL ,


);

-- create Employee table

create table Employee (
Employee_ID int NOT NULL PRIMARY KEY identity(1,1),
E_Name VARCHAR(20) NOT NULL ,
Position VARCHAR(20) NOT NULL 
);


-- create Branch table

create table Branch (
Branch_ID int NOT NULL PRIMARY KEY identity(1,1),
Branch_Address VARCHAR(50) NOT NULL 
);

--drop table BranchPhone;
-- create BranchPhone table

create table BranchPhone (
Branch_ID int NOT NULL ,foreign key (Branch_ID) references Branch(Branch_ID),
Phone VARCHAR(50) NOT NULL ,


);


-- create Loans table
create table Loans (
Loans_ID int NOT NULL PRIMARY KEY identity(1,1),
Amount float(5) Not null ,
L_Type VARCHAR(50) NOT NULL ,
Issue_Date Date not null ,
Customer_ID int NOT NULL,foreign key (Customer_ID) references Customer(Customer_ID),
Employee_ID int NOT NULL, foreign key (Employee_ID) references Employee(Employee_ID),
);


-- create Accounts table
create table Accounts (
Account_Number int NOT NULL PRIMARY KEY identity(1,1),
Balance  float(20) Not null ,
A_Type VARCHAR(50) NOT NULL ,
Date_Of_Creation Date NOT NULL ,
Customer_ID int NOT NULL,foreign key (Customer_ID) references Customer(Customer_ID),
);

-- create Transactions table
create table Transactions (
Transactions_ID int NOT NULL PRIMARY KEY identity(1,1),
T_Date date  NOT NULL,
Amount float(20) Not null ,
Account_Number int NOT NULL,foreign key (Account_Number) references Accounts(Account_Number)
);

-- create TransactionsType table
create table TransactionsType (
Transactions_ID int NOT NULL ,foreign key (Transactions_ID) references Transactions(Transactions_ID),
T_Type VARCHAR(50) NOT NULL ,
Primary key ( Transactions_ID,T_Type)
);



-- add Branch_ID as foreign key in Branch table

alter table Employee
add Branch_ID int NOT NULL foreign key (Branch_ID) references Branch(Branch_ID)

-- add Branch_ID as foreign key in Customer table

alter table Customer
add Loans_ID int NOT NULL foreign key (Loans_ID) references Loans(Loans_ID)


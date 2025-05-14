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

-- CREATE CustomerPhone table
create table CustomerPhone (
Customer_ID int NOT NULL,foreign key (Customer_ID) references Customer(Customer_ID),
Phone VARCHAR(50) NOT NULL , 

);

-- add Branch_ID as foreign key in Branch table

alter table Employee
add Branch_ID int NOT NULL foreign key (Branch_ID) references Branch(Branch_ID)

-- add Branch_ID as foreign key in Customer table

alter table Customer
add Loans_ID int NOT NULL foreign key (Loans_ID) references Loans(Loans_ID)

---------------------------------------------
-- Insert value into customer table
-- use database
use bank;
-------------------

INSERT INTO Customer (CName, Date_Of_Birth, Issue_Date, Action_Type)
VALUES 
('Rahma', '1995-04-12', '2023-09-01', 'Open'),
('Salim', '1988-11-30', '2024-01-15', 'Update'),
('Noor', '2000-06-22', '2024-02-10', 'Close'),
('Ali', '1993-09-19', '2023-12-05', 'Open'),
('Fatma', '1997-01-08', '2024-03-20', 'Update');

SELECT * FROM Customer;

ALTER TABLE Customer 
DROP COLUMN Loans_ID;
-- delete FK --
ALTER TABLE Customer
drop CONSTRAINT FK__Customer__Loans___4D94879B;

ALTER TABLE Customer
drop COLUMN Loans_ID;

---------------

SELECT * FROM Branch; 
INSERT INTO Branch ( Branch_Address)
VALUES
('Muscat'),
('Sohar');

-----------------------
SELECT * FROM BranchPhone;
INSERT INTO BranchPhone (Branch_ID,Phone)
VALUES (3,'99887766'),
(4,'99665544');

--------------

SELECT * FROM Employee ;

INSERT INTO Employee ( E_Name, Position , Branch_ID)
VALUES 
('Omar Al-Kindi', 'Manager', 1),
('Layla Al-Zahra', 'Teller', 2),
('Yusuf Al-Farsi', 'Clerk', 1),
('Aisha Al-Harthy', 'Security', 2),
('Khalid Al-Busaidi', 'Cashier', 1);

------------------------------

SELECT * FROM Loans;

INSERT INTO Loans ( Amount , L_Type , Issue_Date , Customer_ID , Employee_ID)
VALUES 
(5000.00, 'Personal', '2025-05-10', 4, 1),
(15000.00, 'Home', '2025-04-22', 5, 2),
(2500.00, 'Education', '2025-03-15', 6, 3),
(10000.00, 'Auto', '2025-05-01', 7, 4),
(3000.00, 'Business', '2025-02-28', 8, 5);

------------------------------------
SELECT * FROM Accounts;
INSERT INTO Accounts (Balance, A_Type,Date_Of_Creation,Customer_ID)
VALUES
(1500.00, 'Saving', '2025-05-01', 4),
(3200.50, 'Current', '2025-04-25', 5),
(2000.00, 'Saving', '2025-03-18', 6),
(8700.00, 'Business', '2025-01-30', 7),
(500.00,  'Student', '2025-05-14', 8);

-------------
SELECT * FROM Transactions;

INSERT INTO Transactions ( T_Date , Amount,Account_Number)
VALUES
('2025-05-10', 500.00, 2),
('2025-05-12', -200.00, 3),
('2025-05-13', 1000.00, 4),
('2025-05-14', -150.00, 5),
('2025-05-15', 750.00, 6);

------------------------

SELECT * FROM TransactionsType;

INSERT INTO TransactionsType (Transactions_ID, T_Type)
VALUES
(1, 'Deposit'),
(2, 'Withdrawal'),
(3, 'Transfer'),
(4, 'Interest'),
(5, 'Fee');


-----------------------


SELECT * FROM CustomerPhone;
INSERT INTO CustomerPhone ( Customer_ID, Phone)
VALUES
(4,98653223),
(5,99887766),
(6,95865896),
(7,91591599);


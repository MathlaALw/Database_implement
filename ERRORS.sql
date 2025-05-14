Msg 3728, Level 16, State 1, Line 165
'PK__Airplane__E418848B5B7A7419' is not a constraint.
Msg 3727, Level 16, State 0, Line 165
Could not drop constraint. See previous errors.

------------------------

DELETE THE PK constraint OF THE TABLE Airplane

SOLVE THE ERROR : 

ALTER TABLE dbo.Airplane
ADD CONSTRAINT PK_Airplane_ID
PRIMARY KEY (Airplane_ID);


----------------------------------
--2. 
-- CHANGE THE DATA TYPE OF PK IN AIRPLANE_TYPE 
--SELECT name FROM sys.foreign_keys WHERE PERENT = OBJECT_ID('Airplane_Type');
ALTER TABLE Student DROP CONSTRAINT FK_Airplane_Type;
ALTER TABLE Student DROP COLUMN Course_ID;



----------------------------

--3. MODIFY THE PK TYPE FROM AIRPLANE_TYPE TABLE


ALTER TABLE dbo.Airplane_Airport
DROP CONSTRAINT FK_Airplane_Type; 


ALTER TABLE dbo.Airplane
DROP CONSTRAINT FK__Airplane__E418848B5B7A7419; 


DELETE THE CONSTRAINT FROM ALL TABLES THAT CONNECT WITH THE MAIN TABLE ..

THEN 

ALTER TABLE dbo.Airplane_Type
DROP CONSTRAINT PK__Airport___622A225CCED9DCB2;

DELETE THE PK CONSTRAINT FROM THE MAIN TABLE (



create table Airplane_Type with the fixed type

then : 
ALTER TABLE Airplane_Airport DROP COLUMN Type_Name;
ALTER TABLE Airplane DROP COLUMN Type_Name;


ALTER TABLE Airplane 
add Type_Name VARCHAR(200) NOT NULL, foreign key (Type_Name) references Airplane_Type(Type_Name)


ALTER TABLE Airplane_Airport 
add Type_Name VARCHAR(200) NOT NULL, foreign key (Type_Name) references Airplane_Type(Type_Name)

---------------------------

Msg 2627, Level 14, State 1, Line 211
Violation of PRIMARY KEY constraint 'PK_Airport_Code'. Cannot insert duplicate key in object 'dbo.Airplane_Airport'. The duplicate key value is (2).
The statement has been terminated.


ALTER TABLE dbo.Airplane_Airport
drop CONSTRAINT PK_Airport_Code;

-----------------------------------------

Msg 2628, Level 16, State 1, Line 134
String or binary data would be truncated in table 'company.dbo.Project', column 'Pname'. Truncated value: 'Cargo Facility Upgra'.
The statement has been terminated.

-- Pname varchar(20)

ALTER TABLE Project
ALTER COLUMN Pname VARCHAR(300);

------------------------------
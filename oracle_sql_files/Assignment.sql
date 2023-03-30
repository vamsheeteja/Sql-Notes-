
-- Assignment-2

create table Sports_House(
    
    House_Code varchar2(5),
    House_Colour varchar2(6),
    House_Name VARCHAR2(10),
    
    CONSTRAINT pk_Hcode PRIMARY KEY (House_Code)
);

select * from sports_house;
desc sports_house;

create table Students(
    
    Student_id VARCHAR2(6),
    First_Name varchar2(50),
    Last_Name  varchar2(50),
    Gender VARCHAR2(1) CHECK (Gender in ('M', 'F')),
    
    CONSTRAINT pk_Sid PRIMARY KEY (Student_id)
);

select * from Students;
desc students;

create table Roll_Class(
    
    Roll_Class_Code VARCHAR2(10),
    Roll_Class_Standard NUMBER(2),
    Roll_Class_Division  varchar2(1),
    Roll_Class_Year VARCHAR2(4) DEFAULT 2012,
    
    CONSTRAINT pk_RCCode PRIMARY KEY (Roll_Class_Code)
);

select * from Roll_Class;
desc Roll_Class;

create table Student_Roll_details(
    Student_ID varchar2(6),
    Roll_Class_Code VARCHAR2(10),
    
    CONSTRAINT fk_Sid FOREIGN KEY (Student_Id) REFERENCES students(student_id),
    CONSTRAINT fk_Rcc FOREIGN KEY (Roll_Class_Code) REFERENCES Roll_Class(Roll_Class_Code)
);


select * from Student_Roll_details;
desc Student_Roll_details;


select * from user_cons_columns
where table_name='STUDENT_ROLL_DETAILS';



-- 2. Alter the Students table to add DOB column with Date datatype.
ALTER TABLE students
ADD DOB date;

select * from students;


-- 3. Modify the size of House name column to 20 characters long.
ALTER TABLE Sports_House
MODIFY house_name varchar2(20);

desc Sports_House;

-- 4. Modify the Students table add House_code column as foreign key references to Sports_house table House_code column.
ALTER TABLE students
ADD house_code varchar2(5) CONSTRAINT fk_hcode REFERENCES Sports_House(house_code);

-- 5. Rename table Student_Roll_details to std_roll_details
ALTER TABLE Student_Roll_details
RENAME TO std_roll_details;

SELECT * FROM std_roll_details;

-- ------------------END---------------------------

DESC Sports_House;
DESC students;
DESC Roll_Class;
DESC std_roll_details;

-- Assignment-3

-- 1. Populating table

INSERT ALL
    INTO sports_house VALUES ('5','Pink','Busybees')
    INTO sports_house VALUES ('6','BGreen','Parrot')
    INTO sports_house VALUES ('1','RED','BUDS')
    INTO sports_house VALUES ('2','GREEN','BLOOM')
    INTO sports_house VALUES ('3','BLUE','RAINDROPS')
    INTO sports_house VALUES ('4','WHITE','SUNSHINE')
    INTO sports_house VALUES ('7','PURPLE','SNOWFALL')
    
    INTO students VALUES ('1','Amit','Sharma','M','18-Aug-06','1')
    INTO students VALUES ('2','Kens','Dole','M','23-Aug-04','2')
    INTO students VALUES ('3','PRIYA','Raina','F','18-Aug-06','1')
    INTO students VALUES ('4','Mukta','Singh','F','19-Sep-05','2')
    INTO students VALUES ('5','Ana','George','F','23-Jul-06','1')
    INTO students VALUES ('6','Teena','Sharma','F','19-Oct-03','2')
    INTO students VALUES ('7','Anushree','Kale','F','21-Oct-01','3')
    INTO students VALUES ('8','Sanaya','Sathe','F','19-Nov-00','3')
    INTO students VALUES ('9','Kahan','Parekar','M','15-Jul-01','3')
    INTO students VALUES ('10','Aneesh','Acharya','M','6-May-00','4')
    
    INTO Roll_Class VALUES ('4_A_16',4,'A','2016')
    INTO Roll_Class VALUES ('4_B_16',4,'B','2016')
    INTO Roll_Class VALUES ('10_A_16',10,'A','2016')
    INTO Roll_Class VALUES ('10_B_16',10,'B','2016')
    INTO Roll_Class VALUES ('4_A_09',4,'A','2009')
    INTO Roll_Class VALUES ('4_B_09',4,'B','2009')
    INTO Roll_Class VALUES ('8_A_16',8,'A','2016')
    INTO Roll_Class VALUES ('8_B_16',8,'B','2016')
    INTO Roll_Class VALUES ('10_B_09',10,'B','2009')
    INTO Roll_Class VALUES ('6_C_14',6,'C','2014')
    INTO Roll_Class VALUES ('10_C_14',10,'C','2014')
    
    INTO Std_roll_details VALUES ('1','4_A_16')
    INTO Std_roll_details VALUES ('2','8_A_16')
    INTO Std_roll_details VALUES ('3','4_A_16')
    INTO Std_roll_details VALUES ('4','10_B_16')
    INTO Std_roll_details VALUES ('6','10_A_16')
    INTO Std_roll_details VALUES ('5','4_A_16')
    INTO Std_roll_details VALUES ('8','10_B_16')
    INTO Std_roll_details VALUES ('7','6_C_14')
    INTO Std_roll_details VALUES ('9','8_A_16')
    INTO Std_roll_details VALUES ('10','10_B_16')

SELECT * FROM dual;

select * from Sports_House;
select * from students;
select * from Roll_Class;
select * from std_roll_details;



-- 2. Modify the House name as ‘Rose’ and House Colour as ‘Orange’ for Sports House Code 6
update Sports_House
set house_name = 'Rose', house_colour = 'Orange'
where house_code = 6;

-- 3. Remove the record for Standard 8 Division B from roll class table.
delete from Roll_Class
where roll_class_standard = 8 and roll_class_division = 'B';

-- 4. Insert the new House code details in Sports_house table. Accept the values at run time.
insert into Sports_House
values('&house_code', null, null);

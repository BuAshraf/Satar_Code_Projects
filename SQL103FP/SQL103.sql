USE company;

--  FOREIGN KEY وطريقة إضافته في الجدول
CREATE TABLE Company(
Company_id INT NOT NULL ,
Company_City  VARCHAR(200) NOT NULL ,
Company_Name VARCHAR(200) NOT NULL,
PRIMARY KEY (Company_id));


CREATE TABLE Product(
Product_id INT NOT NULL ,
Product_Name  INT NOT NULL ,
Company_id INT ,
PRIMARY KEY (Product_id),
FOREIGN KEY (Company_id) REFERENCES Company(Company_id));



-- طريقة إضافة FOREIGN KEY.

/*ALTER TABLE Product
ADD FOREIGN KEY (Company_id) REFERENCES Company (Company_id);*/


-- مفهوم العلاقات بين الجداول.

/* ONE TO ONE 

 ONE TO MANY / MANY TO ONE 

  MANY TO MANY */
  
  CREATE TABLE Custmer(
Custmer_id INT NOT NULL ,
Custmer_Name VARCHAR(255) NOT NULL,
PRIMARY KEY (Custmer_id));

CREATE TABLE UserAcount(
User_id INT NOT NULL ,
User_Name VARCHAR(255) NOT NULL ,
User_password INT NOT NULL  ,
Custmer_id INT NOT NULL ,
PRIMARY KEY (User_id),
FOREIGN KEY (Custmer_id) REFERENCES Custmer(Custmer_id));

CREATE TABLE Orders(
Orders_id INT NOT NULL ,
Orders_Date DATETIME NOT NULL ,
Price INT NOT NULL  ,
Custmer_id INT NOT NULL ,
PRIMARY KEY (Orders_id),
FOREIGN KEY (Custmer_id) REFERENCES Custmer(Custmer_id));

  CREATE TABLE Course(
Course_id INT NOT NULL ,
Course_Name VARCHAR(255) NOT NULL,
PRIMARY KEY (Course_id));

  CREATE TABLE Student(
Student_id INT NOT NULL ,
Student_Name VARCHAR(255) NOT NULL,
PRIMARY KEY (Student_id));


-- علاقة One to One .
  -- 1. One-to-One Relationship
     -- Each Teacher has exactly one Office
/*
CREATE TABLE Teachers (
  teacher_id   INT PRIMARY KEY,
  name         VARCHAR(100) NOT NULL
);

CREATE TABLE Offices (
  office_id    INT PRIMARY KEY,
  teacher_id   INT UNIQUE,               -- ensures one-to-one
  room_number  VARCHAR(10) NOT NULL,
  FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

-- Example inserts
INSERT INTO Teachers VALUES (1, 'Alice');
INSERT INTO Offices  VALUES (1, 1, 'A101');

*/


--  علاقة One to Many.
  -- 2. One-to-Many (Many-to-One) Relationship
    -- Each Department has many Students, but each Student belongs to one Department


/*
CREATE TABLE Departments (
  dept_id   INT PRIMARY KEY,
  dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE Students (
  student_id   INT PRIMARY KEY,
  name         VARCHAR(100) NOT NULL,
  dept_id      INT,                       -- many students → one department
  FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Example inserts
INSERT INTO Departments VALUES (10, 'Science'), (20, 'Arts');
INSERT INTO Students    VALUES
  (100, 'Bob', 10),
  (101, 'Carol', 10),
  (102, 'Dave', 20);
*/
  
  
  
-- علاقة many to many.
  -- 3. Many-to-Many Relationship
    -- Students can enroll in many Subjects, and each Subject can have many Students


/*
CREATE TABLE Subjects (
  subject_id   INT PRIMARY KEY,
  title        VARCHAR(100) NOT NULL
);

CREATE TABLE Student_Subjects (
  student_id   INT,
  subject_id   INT,
  PRIMARY KEY (student_id, subject_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

-- Example inserts
INSERT INTO Subjects VALUES (1, 'Math'), (2, 'Physics');
INSERT INTO Student_Subjects VALUES
  (100, 1),
  (100, 2),
*/

-- INNER JOINS Example: 

/*
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name=table2.column_name;
*/

SELECT Product_id , Company_Name
FROM Product
INNER JOIN Company
ON Product.Company_id = Company.Company_id;

ALTER TABLE Employee
RENAME COLUMN  id to  Employee_id;

-- LEFT OUTER JOINS


-- LEFT OUTER JOINS Example: 

/*
SELECT column_name(s)
FROM table1
LEFT OUTER JOIN table2
ON table1.column_name = table2.column_name;
*/



CREATE TABLE Project(
Project_id INT NOT NULL,
Project_Manager VARCHAR(100),
Project_Star DATETIME NOT NULL,
Project_End DATETIME NOT NULL
);

SELECT Employee_name , Employee_id , Project_id
FROM Employee
LEFT OUTER JOIN Project
ON Employee_name = Project_Manager ;




-- RIGHT OUTER JOINS


-- RIGHT OUTER JOINS Example :
/*
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
*/


SELECT Employee_name , Employee_id , Project_id
FROM Employee
RIGHT JOIN Project
ON Employee_name = Project_Manager ;


-- CROSS JOINS

-- CROSS JOINS Example : 
/*
SELECT [column_name(s) | *]
FROM table1 CROSS JOIN table2;
*/


-- CREATE Department TABLE

CREATE TABLE Department (
Department_id INT NOT NULL,
Department_Name VARCHAR(60) NOT NULL
);


SELECT  *
FROM Employee CROSS JOIN Department;


-- NATURAL JOINS

-- NATURAL JOINS Example : 

/*
SELECT [column_name(s) | *]
FROM table1
NATURAL JOIN table2;
*/

SELECT Company_Name , Product_Name
FROM Company
NATURAL JOIN  Product;

--  VIEW    طريقة   إنشاء
USE tamayoz_school;
ALTER TABLE students
ADD exam_result VARCHAR (7); -- TO ADD NEW COLUMN USEING ALTER

ALTER TABLE subjects
RENAME TO course; --  TO CHANGE NAME OF TABLE

SELECT * FROM course ;

CREATE VIEW passed_students
AS
SELECT name ,course,exam_result
FROM students
WHERE exam_result = "Passed";

SELECT * FROM passed_students ;

--  VIEW حذف 
DROP VIEW passed_students;

-- INDEXES

-- INDEXES Eample
/*CREATE INDEX IndexName
ON TableName (ColumnName);*/


CREATE INDEX EmployeeName
ON Employee (Employee_name);


--  SHOW INDEXES  

SHOW INDEX FROM  Employee;


-- DROP INDEX
DROP INDEX EmployeeName ON Employee;


-- PROCEDURE  وطريقة إنشائه


-- PROCEDURE Example:
/*
DELIMITER // 
CREATE PROCEDURE PROCEDURE_Name(parameter_list)
BEGIN
  statements;
END */



DELIMITER // 
CREATE PROCEDURE display_employee()
BEGIN
  SELECT * FROM Employee;
END
;

-- PROCEDURE طريقة استدعاء

-- CALL PROCEDURE EXAMPLE:

-- CALL stored_procedure_name(argument_list);

CALL display_employee;

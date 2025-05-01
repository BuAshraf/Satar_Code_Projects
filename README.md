## Star_Code_Projects  👨🏽‍💻
Welcome to Star Code Projects (مهام منصة سطر). Here are the projects I made in [Satr.codes](https://profile.satr.codes/buashraf/public/overview) courses.


## License

[![Licence](https://img.shields.io/github/license/Ileriayo/markdown-badges?style=for-the-badge)](./LICENSE)

## 🏅 Badges

<table>
  <tr>
    <td align="center">
      <img src="./Python_101_Phone_Book/badges-45_Python101.png" alt="Python101 Completed" width="100"/><br/>
       Python 101  إتمام 🏁
    </td>
    <td align="center">
      <img src="./GitHub.png" alt="GitHub Badge" width="100"/><br/>
      GitHub  وسام 🥇
    </td>
    <td align="center">
      <img src="./SQL101Project/badges-49_SQL101.png" alt="SQL101 Completed" width="100"/><br/>
       SQL 101  إتمام 🏁
    </td>
    <td align="center">
      <img src="./SQL102Project/badges-49_اتمام SQL 102.png" alt="SQL102 Completed" width="100"/><br/>
       SQL 102  إتمام 🏁
    </td>
     </td>
    <td align="center">
      <img src="./SQL103FP/badges-49_اتمام SQL 103.png" alt="SQL103 Completed" width="100"/><br/>
       SQL 103  إتمام 🏁
    </td>
  </tr>
</table>

</div>





<hr>
<hr>

# Project_Python_101  👨🏽‍💻
📞 Phone Book

 - This is the task on Course Python 101 on star.code.
![1](./Python_101_Phone_Book/Phone_Book.PNG?raw=true "Phone_Book")

![2](./Python_101_Phone_Book/1.PNG?raw=true "1")

- Here is the capture of the code.
![3](./Python_101_Phone_Book/Capture_Code.PNG?raw=true "Capture_Code")

- Here is the capture of the terminal.
![4](./Python_101_Phone_Book/Capture_Terminal.PNG?raw=true "Capture_Terminal")

- This is the is the certificate you will get after you finish the course. 
![5](./Python_101_Phone_Book/certificate_Python101.png?raw=true "certificate_Python101")

_____________________________________________________________________________________________________
## 🛢️ Project_SQL_101  
### 📚 Tamayoz School Database  

This project was completed as part of the **SQL 101** course on [Satr.codes](https://satr.codes), where I built a structured database for a school named **Tamayoz School**.

### 🔍 Key Highlights:
- Created 3 main tables: `students`, `teachers`, and `subjects`
- Inserted realistic mock data:
  - 30 student records
  - 10 teacher records
  - 6 subject entries
- Demonstrated SQL queries such as `SELECT`, `ORDER BY`, `UPDATE`, and `RENAME TABLE`
- Covered important SQL concepts:
  - ✅ Data types & constraints
  - ✅ Aliasing
  - ✅ Table relationships
  - ✅ Basic data manipulation

### 💻 Example Queries:

```sql
-- Display all students ordered by name
SELECT * FROM students ORDER BY Student_name ASC;

-- Update student email
UPDATE students SET Student_email = 'updated_email@tamayoz.edu' WHERE id = 1;

-- Rename teachers table to instructors
RENAME TABLE teachers TO instructors
```

- This is the is the certificate you will get after you finish the course. 
![6](./SQL101Project/SQL101.png?raw=true "SQL101")
_____________________________________________________________________________________________________
## 🛢️ Project_SQL_102  
### 📚 Tamayoz School Database – Advanced SQL  

This project was completed as part of the **SQL 102** course on [Satr.codes](https://satr.codes), where I built on the original schema with advanced queries, functions, and data transformations.

### 🔍 Key Highlights:
- **Derived Tables:**  
  - `top_students` (GPA > 90)  
  - `failing_students` (GPA < 60)  
- **Filtering & Search:**  
  - Names starting with `A` (LIKE)  
  - Names of length 4 (CHAR_LENGTH)  
- **Aggregate Analytics:**  
  - `AVG`, `MAX`, `MIN` on GPA  
- **Special Cases:**  
  - Level 6 students with GPA = 100  
  - Level 1 students aged 15–16 (TIMESTAMPDIFF)  
  - Count of level 2 students  
- **Distinct & Formatting:**  
  - `DISTINCT Major`  
  - `UPPER(Subject_name)`  
- **Functions & Updates:**  
  - `FLOOR(AVG(GPA))`  
  - `REPLACE` to map `M`→`Male`, `F`→`Female`  
  - Increase GPA by 5 for all GPA < 60  

### 💻 Example Queries:

```sql
-- 1. Create derived tables
CREATE TABLE top_students     AS SELECT * FROM students WHERE GPA > 90;
CREATE TABLE failing_students AS SELECT * FROM students WHERE GPA < 60;

-- 2. Search & filter
SELECT Student_name
FROM students
WHERE Student_name LIKE 'A%';

SELECT Student_name
FROM students
WHERE CHAR_LENGTH(Student_name) = 4;

-- 3. Aggregate functions
SELECT 
  AVG(GPA) AS average_gpa, 
  MAX(GPA) AS highest_gpa, 
  MIN(GPA) AS lowest_gpa
FROM students;

-- 4. Special-case queries
SELECT Student_name
FROM students
WHERE Academic_level = 6
  AND GPA = 100;

SELECT *
FROM students
WHERE Academic_level = 1
  AND TIMESTAMPDIFF(YEAR, Student_dob, CURDATE()) BETWEEN 15 AND 16;

SELECT COUNT(*) AS level_2_count
FROM students
WHERE Academic_level = 2;

-- 5. Distinct & uppercase
SELECT DISTINCT Major
FROM students;

SELECT UPPER(Subject_name) AS Subject_name
FROM subjects;

-- 6. Numeric & string updates
SELECT FLOOR(AVG(GPA)) AS floored_avg_gpa
FROM students;

UPDATE students
SET Gender = REPLACE(REPLACE(Gender, 'M', 'Male'), 'F', 'Female');

UPDATE students
SET GPA = GPA + 5
WHERE GPA < 60;
```

- This is the is the certificate you will get after you finish the course. 
![7](./SQL102Project/SQL102.png?raw=true "SQL102")
_____________________________________________________________________________________________________
## 🛢️ Project_SQL_103  
### 📚 Tamayoz School Database – Relational Design & Advanced Queries  

This project was completed as part of the **SQL 103** course on [Satr.codes](https://satr.codes), where I mastered relational integrity, joining strategies, views, indexes, and procedural logic through a mini project and a final capstone.

### 🔍 Key Highlights:
- **Foreign Keys:**  
  - Introduction to `FOREIGN KEY`  
  - Adding a `FOREIGN KEY` after table creation  
- **Relations:**  
  - One-to-One, One-to-Many, Many-to-Many relationships  
- **JOINS:**  
  - `INNER JOIN`, `LEFT OUTER JOIN`, `RIGHT OUTER JOIN`  
  - `CROSS JOIN`, `NATURAL JOIN`  
- **Views:**  
  - Creating a `VIEW`  
  - Dropping a `VIEW`  
- **Indexes:**  
  - Creating, listing & dropping indexes  
- **Procedures:**  
  - Creating stored procedures  
  - Invoking procedures  
- **Mini Project:**  
  - Build relationship tables, procedures, view & index  
- **Final Capstone:**  
  - Unified solution leveraging skills from SQL 1, 2 & 3  

### 💻 Example Queries:

```sql
-- 1. Add FK to existing table
ALTER TABLE Teachers
  ADD FOREIGN KEY (subject_id) REFERENCES subjects(subject_id);

-- 2. Create many-to-many join table
CREATE TABLE teacher_students (
  teacher_id INT,
  student_id INT,
  PRIMARY KEY (teacher_id, student_id),
  FOREIGN KEY (teacher_id) REFERENCES teachers(Teacher_id),
  FOREIGN KEY (student_id) REFERENCES students(Students_id)
);

-- 3. Create & call stored procedure
DELIMITER $$
CREATE PROCEDURE student_info()
BEGIN
  SELECT s.Student_name, sub.Subject_name
  FROM students s
  JOIN student_subjects ss ON s.Students_id = ss.student_id
  JOIN subjects sub      ON ss.subject_id = sub.subject_id;
END $$
DELIMITER ;
CALL student_info();

-- 4. Create & drop a view
CREATE VIEW teacher_info AS
  SELECT t.Teacher_name, o.Office_number, sub.Subject_name
  FROM teachers t
  JOIN Offices o  ON t.Teacher_id = o.Teacher_id
  JOIN subjects sub ON t.subject_id = sub.subject_id;
SELECT * FROM teacher_info;
DROP VIEW teacher_info;

-- 5. Create & drop an index
CREATE INDEX idx_student_name ON students(Student_name);
SHOW INDEX FROM students;
DROP INDEX idx_student_name ON students;
```
- This is the is the certificate you will get after you finish the course. 
![8](./SQL103FP/SQL103.png?raw=true "SQL103")
_____________________________________________________________________________________________________

## 🏁 SQL Final Project – Twitter Clone  
### 📚 Social Network Simulation  

Simulate a Twitter-like platform to manage users, profiles, follows, tweets, and likes.

### 🔍 Key Highlights
- **Schema & Relationships**  
  - `Users` ↔ `Profiles` (1:1)  
  - `Users` ↔ `Tweets` (1:N)  
  - `Users` ↔ `Users` via `Follows` (M:N)  
  - `Users` ↔ `Tweets` via `Likes` (M:N)  
- **ER Diagram**  
  ![ER Diagram](/SQL_FP/ERD_FP.png)  
- **Stored Procedures**  
  - `createAccount(username, email, password, bio)`  
  - `User_Follow(followerUsername, followeeUsername)`  
- **Auto-Increment & Constraints**  
  - `AUTO_INCREMENT` keys  
  - `UNIQUE` & `FOREIGN KEY` constraints  
- **Security**  
  - Passwords hashed with `MD5()` and stored as `BINARY(64)`  
- **Sample Queries**  
  ```sql
  CALL createAccount('alice','alice@ex.com','pass123','Hello!');
  CALL User_Follow('alice','bob');
  SELECT COUNT(*) AS tweet_count 
    FROM Tweets t 
    JOIN Profiles p ON t.user_id = p.user_id 
    WHERE p.username = 'alice';
  ```
  ___________________________________________________________________
## Get to Know Me  😁

- 🌐 **Website:**  I will add it in the future 😅
  
- 🌐 **Star.Code:** [See my Profile](https://profile.satr.codes/buashraf/public/overview)

- 💼 **LinkedIn:** [Connect with me](www.linkedin.com/in/muhammed-alkulaib-773492238)

- ✖ **Twitter:** [Follow me](https://twitter.com/bo_ashraf)

- 📬 **Email:** [Connect with me](muhammedalmugera21@gmail.com)

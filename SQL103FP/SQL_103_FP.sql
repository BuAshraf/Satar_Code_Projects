USE Tamayoz_School;

CREATE TABLE Offices (
    office_id INT PRIMARY KEY,
    Teacher_id INT UNIQUE,
    Office_number VARCHAR(10) NOT NULL,
    FOREIGN KEY (Teacher_id)
        REFERENCES Teachers (Teacher_id)
);



-- 1. Many-to-Many: Teachers ↔ Students
CREATE TABLE teacher_students (
  teacher_id INT,
  student_id INT,
  PRIMARY KEY (teacher_id, student_id),
  FOREIGN KEY (teacher_id) REFERENCES teachers(Teacher_id),
  FOREIGN KEY (student_id) REFERENCES students(students_id)
);


-- 2. One-to-Many: Subjects → Teachers
ALTER TABLE teachers
  ADD COLUMN subject_id INT,
  ADD FOREIGN KEY (subject_id) REFERENCES subjects(subject_id);

-- 3. Many-to-Many: Students ↔ Subjects
CREATE TABLE student_subjects (
  student_id INT NOT NULL,
  subject_id INT NOT NULL,
  PRIMARY KEY (student_id, subject_id),
  FOREIGN KEY (student_id) REFERENCES students(Students_id),
  FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

DROP PROCEDURE student_info;

-- 4. Stored Procedure: student_info
DELIMITER $$
CREATE PROCEDURE student_info()
BEGIN
  SELECT
    s.Students_id    AS student_id,
    s.Student_name   AS student_name,
    sub.subject_id   AS subject_id,
    sub.Subject_name AS subject_name
  FROM students s
  JOIN student_subjects ss ON s.Students_id = ss.student_id
  JOIN subjects sub      ON sub.subject_id = ss.subject_id;
END $$
DELIMITER ;

-- Call the procedure
CALL student_info();


-- 5. View: teacher_info
CREATE VIEW teacher_info AS
SELECT
  t.Teacher_id,
  t.Teacher_name,
  o.Office_number,
  sub.Subject_name
FROM Teachers t
JOIN Offices o  ON t.Teacher_id = o.Teacher_id
JOIN subjects sub ON t.subject_id = sub.subject_id;


-- Display the view
SELECT * FROM teacher_info;

-- Drop the view
DROP VIEW teacher_info;

-- 6. Index on student names for alphabetical search
CREATE INDEX idx_student_name ON students(Student_name);

-- Show indexes on students
SHOW INDEX FROM students;

-- Drop the index
DROP INDEX idx_student_name ON students;


SELECT * FROM teacher_students;



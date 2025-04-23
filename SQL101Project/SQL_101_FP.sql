-- 1. إنشاء قاعدة البيانات
CREATE DATABASE Tamayoz_School;
-- استخدام قاعدة البيانات
USE Tamayoz_School;

-- 2. إنشاء جدول الطلاب
CREATE TABLE students (
  id INT PRIMARY KEY COMMENT 'الرقم التسلسلي للطالب',
  Student_name VARCHAR(100) NOT NULL COMMENT 'اسم الطالب',
  Student_dob DATE COMMENT 'تاريخ الميلاد',
  Gender CHAR(1) COMMENT 'جنس الطالب (M أو F)',
  Enrollment_date DATE COMMENT 'تاريخ الالتحاق',
  Student_email VARCHAR(100) COMMENT 'البريد الإلكتروني للطالب',
  Academic_level TINYINT COMMENT 'المستوى الدراسي (1–6)',
  Major VARCHAR(20) COMMENT 'المسار (علمي أو انساني)',
  GPA DECIMAL(5,2) COMMENT 'المعدل التراكمي من 100'
);

-- 3. إنشاء جدول المعلمين
CREATE TABLE teachers (
  id INT PRIMARY KEY COMMENT 'الرقم التسلسلي للمعلم',
  Teacher_name VARCHAR(100) NOT NULL COMMENT 'اسم المعلم',
  Teacher_dob DATE COMMENT 'تاريخ الميلاد',
  Gender CHAR(1) COMMENT 'جنس المعلم (M أو F)',
  Teacher_email VARCHAR(100) COMMENT 'البريد الإلكتروني للمعلم',
  Office_number VARCHAR(20) COMMENT 'رقم المكتب'
);

-- 4. إنشاء جدول المواد
CREATE TABLE subjects (
  id INT PRIMARY KEY COMMENT 'الرقم التسلسلي للمادة',
  Subject_name VARCHAR(100) NOT NULL COMMENT 'اسم المادة'
);

-- 5. عرض الجداول المتاحة في قاعدة البيانات
SHOW TABLES;

-- 6. إدخال بيانات 30 طالبًا كحدٍّ أدنى
INSERT INTO students
  (id, Student_name, Student_dob, Gender, Enrollment_date, Student_email, Academic_level, Major, GPA)
VALUES
  (1,  'Student1',  '2006-01-01', 'M', '2022-09-01', 'student1@tamayoz.edu', 1, 'علمي', 61.00),
  (2,  'Student2',  '2006-02-02', 'F', '2022-09-01', 'student2@tamayoz.edu', 2, 'انساني', 62.00),
  (3,  'Student3',  '2006-03-03', 'M', '2022-09-01', 'student3@tamayoz.edu', 3, 'علمي', 63.00),
  (4,  'Student4',  '2006-04-04', 'F', '2022-09-01', 'student4@tamayoz.edu', 4, 'انساني', 64.00),
  (5,  'Student5',  '2006-05-05', 'M', '2022-09-01', 'student5@tamayoz.edu', 5, 'علمي', 65.00),
  (6,  'Student6',  '2006-06-06', 'F', '2022-09-01', 'student6@tamayoz.edu', 6, 'انساني', 66.00),
  (7,  'Student7',  '2006-07-07', 'M', '2022-09-01', 'student7@tamayoz.edu', 1, 'علمي', 67.00),
  (8,  'Student8',  '2006-08-08', 'F', '2022-09-01', 'student8@tamayoz.edu', 2, 'انساني', 68.00),
  (9,  'Student9',  '2006-09-09', 'M', '2022-09-01', 'student9@tamayoz.edu', 3, 'علمي', 69.00),
  (10, 'Student10', '2006-10-10', 'F', '2022-09-01', 'student10@tamayoz.edu', 4, 'انساني', 70.00),
  (11, 'Student11', '2006-11-11', 'M', '2022-09-01', 'student11@tamayoz.edu', 5, 'علمي', 71.00),
  (12, 'Student12', '2006-12-12', 'F', '2022-09-01', 'student12@tamayoz.edu', 6, 'انساني', 72.00),
  (13, 'Student13', '2006-01-13', 'M', '2022-09-01', 'student13@tamayoz.edu', 1, 'علمي', 73.00),
  (14, 'Student14', '2006-02-14', 'F', '2022-09-01', 'student14@tamayoz.edu', 2, 'انساني', 74.00),
  (15, 'Student15', '2006-03-15', 'M', '2022-09-01', 'student15@tamayoz.edu', 3, 'علمي', 75.00),
  (16, 'Student16', '2006-04-16', 'F', '2022-09-01', 'student16@tamayoz.edu', 4, 'انساني', 76.00),
  (17, 'Student17', '2006-05-17', 'M', '2022-09-01', 'student17@tamayoz.edu', 5, 'علمي', 77.00),
  (18, 'Student18', '2006-06-18', 'F', '2022-09-01', 'student18@tamayoz.edu', 6, 'انساني', 78.00),
  (19, 'Student19', '2006-07-19', 'M', '2022-09-01', 'student19@tamayoz.edu', 1, 'علمي', 79.00),
  (20, 'Student20', '2006-08-20', 'F', '2022-09-01', 'student20@tamayoz.edu', 2, 'انساني', 80.00),
  (21, 'Student21', '2006-09-21', 'M', '2022-09-01', 'student21@tamayoz.edu', 3, 'علمي', 81.00),
  (22, 'Student22', '2006-10-22', 'F', '2022-09-01', 'student22@tamayoz.edu', 4, 'انساني', 82.00),
  (23, 'Student23', '2006-11-23', 'M', '2022-09-01', 'student23@tamayoz.edu', 5, 'علمي', 83.00),
  (24, 'Student24', '2006-12-24', 'F', '2022-09-01', 'student24@tamayoz.edu', 6, 'انساني', 84.00),
  (25, 'Student25', '2006-01-25', 'M', '2022-09-01', 'student25@tamayoz.edu', 1, 'علمي', 85.00),
  (26, 'Student26', '2006-02-26', 'F', '2022-09-01', 'student26@tamayoz.edu', 2, 'انساني', 86.00),
  (27, 'Student27', '2006-03-27', 'M', '2022-09-01', 'student27@tamayoz.edu', 3, 'علمي', 87.00),
  (28, 'Student28', '2006-04-28', 'F', '2022-09-01', 'student28@tamayoz.edu', 4, 'انساني', 88.00),
  (29, 'Student29', '2006-05-29', 'M', '2022-09-01', 'student29@tamayoz.edu', 5, 'علمي', 89.00),
  (30, 'Student30', '2006-06-30', 'F', '2022-09-01', 'student30@tamayoz.edu', 6, 'انساني', 90.00);

-- 7. إدخال بيانات 10 معلمين كحدٍّ أدنى
INSERT INTO teachers
  (id, Teacher_name, Teacher_dob, Gender, Teacher_email, Office_number)
VALUES
  (1,  'Teacher1',  '1980-01-01', 'M', 'teacher1@tamayoz.edu', '101'),
  (2,  'Teacher2',  '1981-02-02', 'F', 'teacher2@tamayoz.edu', '102'),
  (3,  'Teacher3',  '1982-03-03', 'M', 'teacher3@tamayoz.edu', '103'),
  (4,  'Teacher4',  '1983-04-04', 'F', 'teacher4@tamayoz.edu', '104'),
  (5,  'Teacher5',  '1984-05-05', 'M', 'teacher5@tamayoz.edu', '105'),
  (6,  'Teacher6',  '1985-06-06', 'F', 'teacher6@tamayoz.edu', '106'),
  (7,  'Teacher7',  '1986-07-07', 'M', 'teacher7@tamayoz.edu', '107'),
  (8,  'Teacher8',  '1987-08-08', 'F', 'teacher8@tamayoz.edu', '108'),
  (9,  'Teacher9',  '1988-09-09', 'M', 'teacher9@tamayoz.edu', '109'),
  (10, 'Teacher10', '1989-10-10', 'F', 'teacher10@tamayoz.edu','110');

-- 8. إدخال بيانات 6 مواد كحدٍّ أدنى
INSERT INTO subjects (id, Subject_name) VALUES
  (1, 'الرياضيات'),
  (2, 'الفيزياء'),
  (3, 'الكيمياء'),
  (4, 'الأحياء'),
  (5, 'التاريخ'),
  (6, 'اللغة العربية');

-- 9. عرض محتويات جميع الجداول
SELECT * FROM students;
SELECT * FROM teachers;
SELECT * FROM subjects;

-- 10. عرض جدول الطلاب مرتبًا تصاعديًا حسب اسم الطالب
SELECT * FROM students
ORDER BY Student_name ASC;

-- 11. عرض جدول الطلاب مع إعطاء اسم مستعار لحقل "اسم الطالب"
SELECT
  id,
  Student_name AS اسم_الطالب,
  Student_dob,
  Gender,
  Enrollment_date,
  Student_email,
  Academic_level,
  Major,
  GPA
FROM students;

-- 12. التعديل على بيانات أحد الطلاب (تغيير البريد الإلكتروني)
UPDATE students
SET Student_email = 'updated_email@tamayoz.edu'
WHERE id = 1;

-- 13. التعديل على بيانات أحد المعلمين (تغيير رقم المكتب)
UPDATE teachers
SET Office_number = '201'
WHERE id = 2;

-- 14. تعديل اسم أحد الجداول (مثال: تغيير teachers إلى instructors)
RENAME TABLE teachers TO instructors;

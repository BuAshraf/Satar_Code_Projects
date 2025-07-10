-- استخدام قاعدة البيانات
USE Tamayoz_School;

-- 1. إنشاء جدول الطلاب المتفوقين (معدل تراكمي > 90)
CREATE TABLE top_students AS
SELECT * FROM students
WHERE GPA > 90;

-- 2. إنشاء جدول الطلاب غير المجتازين (معدل تراكمي < 60)
CREATE TABLE failing_students AS
SELECT * FROM students
WHERE GPA < 60;

-- 3. عرض أسماء الطلاب التي تبدأ بحرف 'A'
SELECT Student_name
FROM students
WHERE Student_name LIKE 'A%';

-- 4. عرض أسماء الطلاب التي تحتوي أسمائهم على أربع خانات
SELECT Student_name
FROM students
WHERE CHAR_LENGTH(Student_name) = 4;

-- 5. تطبيق الدوال التجميعية AVG, MAX, MIN على المعدل التراكمي
SELECT
  AVG(GPA) AS متوسط_المعدل,
  MAX(GPA) AS أعلى_معدل,
  MIN(GPA) AS أدنى_معدل
FROM students;

-- 6. حصر وعرض أسماء الطلاب المتفوقين في المستوى السادس الحاصلين على معدل = 100
SELECT Student_name
FROM students
WHERE Academic_level = 6
  AND GPA = 100;

-- 7. عرض الطلاب في المستوى الأول وأعمارهم بين 15 و16 سنة
SELECT *
FROM students
WHERE Academic_level = 1
  AND TIMESTAMPDIFF(YEAR, Student_dob, CURDATE()) BETWEEN 15 AND 16;




-- 8. عرض عدد الطلاب الموجودين في المستوى 2
SELECT COUNT(*) AS عدد_طلاب_المستوى_2
FROM students
WHERE Academic_level = 2;

-- 9. استعراض مسارات الطلاب في المدرسة بدون تكرار
SELECT DISTINCT Major AS المسار
FROM students;

-- 10. عرض أسماء المواد بالأحرف الكبيرة
SELECT UPPER(Subject_name) AS المادة_بأحرف_كبيرة
FROM subjects;

-- 11. حساب المتوسط الحسابي للمعدل التراكمي وتقريبه لأقرب عدد أصغر
SELECT FLOOR(AVG(GPA)) AS متوسط_معدل_مقرب_للأسفل
FROM students;

-- 1. تعطيل Safe Updates للجلسة الجارية
SET SQL_SAFE_UPDATES = 0;

-- 2. تعديل تعريف عمود Gender ليستوعب القيم الكاملة
ALTER TABLE students
  MODIFY COLUMN Gender VARCHAR(6) NOT NULL;

-- 3. تحديث القيم من 'F' → 'Female' و 'M' → 'Male'
UPDATE students
SET Gender = REPLACE(
               REPLACE(Gender, 'M', 'Male'),
               'F', 'Female'
             );

SELECT * FROM students;


-- (optional) re-enable safe updates afterward
SET SQL_SAFE_UPDATES = 1;

-- 13. تحديث المعدل التراكمي للطلاب ذوي معدل أقل من 60 بزيادة 5 درجات
UPDATE students
SET GPA = GPA + 5
WHERE GPA < 60;

SELECT * FROM students;

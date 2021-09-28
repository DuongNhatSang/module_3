USE quanlysinhvien;
SELECT * FROM student WHERE student_name LIKE "h%";
SELECT * FROM class WHERE month(start_date) = 12;
SELECT * FROM `subject` WHERE credit BETWEEN 3 AND 5;
UPDATE student SET student.class_id = 2 WHERE student.student_name = "hung";
SELECT student.student_name,`subject`.sub_name,mark.mark
FROM mark
INNER JOIN `subject` on `subject`.SubId = mark.sub_id
INNER JOIN student on student.student_id = mark.student_id
ORDER BY mark.mark DESC,student.student_name;
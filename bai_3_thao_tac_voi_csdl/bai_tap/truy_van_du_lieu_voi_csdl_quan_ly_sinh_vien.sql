USE quanlysinhvien;
SELECT * FROM student WHERE StudentName LIKE "h%";
SELECT * FROM class WHERE month(StartDate) = 12;
SELECT * FROM `subject` WHERE Credit BETWEEN 3 AND 5;
UPDATE student SET student.ClassId = 2 WHERE student.StudentName = "hung";
SELECT student.StudentName,`subject`.SubName,mark.Mark
FROM mark
INNER JOIN `subject` on `subject`.SubId = mark.SubId
INNER JOIN student on student.StudentId = mark.StudentId
ORDER BY mark.Mark DESC,student.StudentName;
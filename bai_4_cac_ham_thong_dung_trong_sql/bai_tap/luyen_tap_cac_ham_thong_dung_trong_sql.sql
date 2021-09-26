USE quanlysinhvien;
SELECT * FROM `subject` 
WHERE Credit = (SELECT max(`subject`.Credit) FROM `subject`);
SELECT `subject`.SubId, `subject`.SubName, `subject`.Credit, `subject`.`Status`, mark FROM `subject`
LEFT JOIN mark on `subject`.SubId = mark.SubId
GROUP BY SubName
HAVING Mark = (SELECT max(Mark) FROM mark);
SELECT student.StudentId, student.StudentName, student.Address, student.Phone, student.ClassId, AVG(Mark)
FROM mark 
JOIN student on student.StudentId = mark.StudentId
GROUP BY student.StudentId 
ORDER BY AVG(Mark);
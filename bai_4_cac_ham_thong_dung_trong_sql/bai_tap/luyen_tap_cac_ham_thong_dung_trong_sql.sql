USE quanlysinhvien;
SELECT * FROM `subject` 
WHERE Credit = (SELECT max(`subject`.Credit) FROM `subject`);
SELECT * FROM`subject`
LEFT JOIN mark on `subject`.SubId = mark.SubId
GROUP BY SubName
HAVING Mark = (SELECT max(Mark) FROM mark);
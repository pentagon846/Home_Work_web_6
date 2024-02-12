--sql_11
SELECT AVG(g.grade) as average_grade, t.name, s.name
FROM grades g
JOIN subjects sub ON g.subject_id = sub.subject_id
JOIN teachers t ON sub.teacher_id = t.teacher_id
JOIN students s ON g.student_id = s.student_id
WHERE t.teacher_id  = 3 AND s.student_id  = 39;
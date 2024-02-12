--sql_10
SELECT sub.subject_name, s.name, t.name
FROM subjects sub
JOIN grades g ON sub.subject_id = g.subject_id
JOIN students s ON g.student_id = s.student_id
JOIN teachers t ON sub.teacher_id = t.teacher_id
WHERE s.student_id  = 22 AND t.teacher_id  = 5
LIMIT 10;

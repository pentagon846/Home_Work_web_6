--sql_8
SELECT s.name, s.student_id,  sub.subject_name
FROM subjects sub
JOIN grades g ON sub.subject_id = g.subject_id
JOIN students s ON g.student_id = s.student_id
WHERE s.student_id  = 23
LIMIT 20;
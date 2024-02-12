--sql_5
SELECT DISTINCT sub.subject_name, t.name, t.teacher_id
FROM subjects sub
JOIN teachers t ON sub.teacher_id = t.teacher_id
WHERE t.name = t.name ;
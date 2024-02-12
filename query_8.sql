--sql_8
SELECT t.name as teacher_name, sub.subject_name,  AVG(g.grade) as average_grade
FROM teachers t
JOIN subjects sub ON t.teacher_id = sub.teacher_id
JOIN grades g ON sub.subject_id = g.subject_id
GROUP BY t.name;
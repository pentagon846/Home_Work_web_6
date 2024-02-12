--sql_7
SELECT s.name, g.grade, gr.group_name, sub.subject_name
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN subjects sub ON g.subject_id = sub.subject_id
JOIN groups gr ON gr.group_name = gr.group_name
WHERE s.group_id = 3 AND g.subject_id = 5
LIMIT 30;
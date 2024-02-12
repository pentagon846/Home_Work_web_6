--sql_12
SELECT s.name as student_name, s.group_id, gr.group_name, g.grade, g.date_received
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN subjects sub ON g.subject_id = sub.subject_id
JOIN groups gr ON gr.group_name = gr.group_name
WHERE s.group_id = 2
AND sub.subject_id = 4
AND g.date_received = (SELECT MAX(date_received) FROM grades WHERE sub.subject_id = sub.subject_id)
LIMIT 20;
--sql_3
SELECT gr.group_name, sub.subject_name, AVG(g.grade) as average_grade
FROM groups gr
JOIN students s ON gr.group_id = s.group_id
JOIN grades g ON s.student_id = g.student_id
JOIN subjects sub ON g.subject_id = sub.subject_id
WHERE sub.subject_id = 4
GROUP BY gr.group_name
ORDER BY average_grade DESC;
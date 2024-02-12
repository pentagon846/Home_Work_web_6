--sql_1
SELECT s.student_id, s.name, AVG(g.grade) as average_grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id
ORDER BY average_grade DESC
LIMIT 5;
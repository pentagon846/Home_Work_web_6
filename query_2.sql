--sql_2
SELECT s.name, sub.subject_name, AVG(g.grade) as average_grade
FROM students s
JOIN grades g ON sub.subject_id  = g.student_id
JOIN subjects sub ON g.subject_id = sub.subject_id
WHERE sub.subject_id = 4
GROUP BY s.name
ORDER BY average_grade DESC
LIMIT 1;


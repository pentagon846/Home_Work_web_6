--sql_6
SELECT s.name as student_name, g.group_name
FROM students s
JOIN groups g ON s.group_id = g.group_id
WHERE g.group_id = 2
LIMIT 30;
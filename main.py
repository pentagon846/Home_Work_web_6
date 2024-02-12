import sqlite3
from faker import Faker
import random

# Ініціалізація Faker
fake = Faker('uk-UA')


def create_tables(cursor):
    # Створення таблиць
    cursor.execute('''CREATE TABLE IF NOT EXISTS groups (
                        group_id INTEGER PRIMARY KEY,
                        group_name TEXT
                     )''')

    cursor.execute('''CREATE TABLE IF NOT EXISTS students (
                        student_id INTEGER PRIMARY KEY,
                        name TEXT,
                        group_id INTEGER,
                        FOREIGN KEY(group_id) REFERENCES groups(group_id)
                     )''')

    cursor.execute('''CREATE TABLE IF NOT EXISTS teachers (
                        teacher_id INTEGER PRIMARY KEY,
                        name TEXT
                     )''')

    cursor.execute('''CREATE TABLE IF NOT EXISTS subjects (
                        subject_id INTEGER PRIMARY KEY,
                        subject_name TEXT,
                        teacher_id INTEGER,
                        FOREIGN KEY(teacher_id) REFERENCES teachers(teacher_id)
                     )''')

    cursor.execute('''CREATE TABLE IF NOT EXISTS grades (
                        grade_id INTEGER PRIMARY KEY,
                        student_id INTEGER,
                        subject_id INTEGER,
                        grade INTEGER,
                        date_received TEXT,
                        FOREIGN KEY(student_id) REFERENCES students(student_id),
                        FOREIGN KEY(subject_id) REFERENCES subjects(subject_id)
                     )''')

    # Заповнення таблиць даними
    group_names = ['ED-102', 'MD-104', 'MT-106']
    for name in group_names:
        cursor.execute('INSERT INTO groups (group_name) VALUES (?)', (name,))

    for _ in range(5):
        cursor.execute('INSERT INTO teachers (name) VALUES (?)', (fake.name(),))

    subjects = ['Math', 'Physics', 'Chemistry', 'Biology', 'History']
    for subject in subjects:
        cursor.execute('INSERT INTO subjects (subject_name, teacher_id) VALUES (?, ?)', (subject, random.randint(1, 5)))
        # cursor.execute("INSERT INTO subjects (subject_name, teacher_id) VALUES (?, ?)", (fake.word(), (random.randint(1, 5))))

    for _ in range(50):
        cursor.execute('INSERT INTO students (name, group_id) VALUES (?, ?)', (fake.name(), random.randint(1, 3)))

    for _ in range(1000):
        cursor.execute('INSERT INTO grades (student_id, subject_id, grade, date_received) VALUES (?, ?, ?, ?)',
                       (random.randint(1, 50), random.randint(1, 9), random.randint(1, 10), fake.date_this_year()))


def execute_query_from_file(cursor, file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        query = file.read()
        cursor.execute(query)
        return cursor.fetchall()


def main():
    # Підключення до бази даних
    conn = sqlite3.connect('university.db')  # шлях до бази даних
    c = conn.cursor()

    # Створення таблиць і заповнення даними
    create_tables(c)
    conn.commit()

    for i in range(1, 12 + 1):
        query_file_path = f'query_{i}.sql'  # Формування шляху до файлу запиту
        try:
            results = execute_query_from_file(c, query_file_path)
            print(f"Results for query {i}:")
            for result in results:
                print(result)
            print("\n" + '=' * 80)
        except Exception as e:
            print(f"Error executing query {i}: {e}")

    conn.close()


if __name__ == '__main__':
    main()

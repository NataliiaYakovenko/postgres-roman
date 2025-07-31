-- Створюємо таблицю предметів першою, оскільки на неї є посилання
CREATE TABLE subjects(
    name VARCHAR(50) PRIMARY KEY
);

DROP TABLE subjects

INSERT INTO subjects
VALUES ('Biologi'),
       ('Math'),
       ('SistemsAI');

-- Створюємо таблицю викладачів
CREATE TABLE teachers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    subject VARCHAR(50) REFERENCES subjects(name)
);

DROP TABLE teachers

INSERT INTO teachers(name, subject)
VALUES ('Daniel','Biologi'),
       ('Gabriella','Math'),
       ('Loren','SistemsAI');

-- Створюємо таблицю студентів
CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

DROP TABLE students

INSERT INTO students(name)
VALUES ('Nataliia'),
       ('Rolland'),
       ('Nick');

-- Створюємо таблицю зв'язку між викладачами і студентами
-- (правильні зовнішні ключі)
CREATE TABLE teachers_to_students(
    teacher_id INT REFERENCES students(id),
    student_id INT REFERENCES teachers(id),
    PRIMARY KEY (teacher_id, student_id)
);

DROP TABLE teachers_to_students

-- Вставляємо зв’язки між викладачами та студентами
INSERT INTO teachers_to_students 
VALUES (1, 1),  -- Daniel -> Nataliia
       (1, 2),  -- Daniel -> Rolland
       (2, 1),  -- Gabriella -> Nataliia
       (3, 3);  -- Loren -> Nick
//-------------------------------------------------------

-- відобразити який студент, який предмет вивчає і хто викладає предмет

--який студент
SELECT *
FROM students

--який студент, який предмет вивчає і хто викладає предмет
SELECT *
FROM students AS s JOIN teachers_to_students AS tts 
ON s.id = tts.student_id
                  JOIN teachers AS t 
                  ON tts.teacher_id = t.id
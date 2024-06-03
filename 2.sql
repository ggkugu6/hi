-- добавление данных в таблицу Students
INSERT INTO "Students" (first_name, last_name, date_of_birth, email, phone_number, address, enrollment_date, gpa) VALUES
('Иван', 'Иванов', '2000-01-15', 'ivan@gmail.com', NULL, 'Тулла', '2021-09-01', 3.5),
('Юля', 'Приветкова', '1999-02-20', 'jane.hi@gmail.com', '555-1234', 'Тюм, ул. мира 10', '2021-09-01', 3.8),
('Алиса', 'Бронова', '2001-03-25', 'alice.bronay@gmail.com', '896-5678', 'ул. важных дел, 10', '2022-01-15', NULL),
('Биб', 'Боб', '2002-04-10', 'bob.bib@gmail.com', NULL, 'ул. марпл д. 22', '2022-01-15', 3.2),
('Шип', 'Шеп', '2003-05-30', 'sip.shep@example.com', '343-2367', 'ул. нижняя 10', '2023-02-01', NULL);

-- добавление данных в таблицу Courses
INSERT INTO "Courses" (course_name, description, credits, department) VALUES
('Программируем для себя', 'Программируем для себя на Фортране', 3, 'Комп. науки'),
('Пи, что это?', 'Узнаешь что такое пи', 4, 'Математика'),
('История прошлого', 'История о прошлом, прошлого', 3, 'История');

-- добавление данных в таблицу Enrollments
INSERT INTO "Enrollments" (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2023-02-01', '5'),
(2, 2, '2023-02-01', '4'),
(3, 3, '2023-02-01', NULL),
(4, 1, '2023-02-01', '2'),
(5, 2, '2023-02-01', NULL);

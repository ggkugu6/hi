/*Удалите студента, который был зачислен на курс.*/
-- Удаление записей о зачислениях студента из таблицы Enrollments
DELETE FROM "Enrollments"
WHERE student_id = 3

-- Удаление студента из таблицы Students
DELETE FROM "Students"
WHERE student_id = 3

/*Удалите курс, который не имеет зачисленных студентов.*/
DELETE FROM "Courses"
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM "Enrollments")


/*Итог: Алиса Бронова, удалена сначала и таблы Enrollments, потом из таблы Students, т.к. она одна была зачислена на course_id = 3 История, то последним запросом удаляю в табле Courses course_id = 3 История*/

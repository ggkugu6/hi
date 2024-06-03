/*Обновите информацию о студенте, изменив его адрес и номер телефона.*/
UPDATE "Students"
SET address = 'г. Ньютайн', phone_number = '88003335569'
WHERE student_id = 2;

/*Обновление описания одного из курсов*/
UPDATE "Courses"
SET description = 'Учим бейсккк'
WHERE course_id = 1;

/*Обновление оценки за курс для одного из зачислений*/
UPDATE "Enrollments"
SET grade = '5'
WHERE enrollment_id = 3;

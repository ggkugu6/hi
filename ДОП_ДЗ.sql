/*1. Создайте представление (VIEW), которое объединяет информацию о студентах и их зачислениях на курсы.*/
CREATE VIEW StudentEnrollments AS
SELECT
    s.student_id AS student_id,
    s.first_name AS student_first_name,
    s.last_name AS student_last_name,
    s.date_of_birth AS student_date_of_birth,
    s.email AS student_email,
    s.phone_number AS student_phone_number,
    s.address AS student_address,
    s.enrollment_date AS student_enrollment_date,
    s.gpa AS student_gpa,
    e.enrollment_id AS enrollment_id,
    e.course_id AS enrollment_course_id,
    e.enrollment_date AS enrollment_course_date,
    e.grade AS enrollment_grade,
    c.course_id AS course_id,
    c.course_name AS course_name,
    c.description AS course_description,
    c.credits AS course_credits,
    c.department AS course_department
FROM "Students" s
LEFT JOIN "Enrollments" e ON s.student_id = e.student_id
LEFT JOIN "Courses" c ON e.course_id = c.course_id

SELECT * FROM public.studentenrollments

/*2. Создайте хранимую процедуру для добавления нового студента и автоматического зачисления его на определенный курс.*/

CREATE OR REPLACE FUNCTION add_student_and_enroll(
    func_first_name VARCHAR,
    func_last_name VARCHAR,
    func_date_of_birth DATE,
    func_email VARCHAR,
    func_phone_number VARCHAR,
    func_address TEXT,
    func_enrollment_date DATE,
    func_gpa NUMERIC,
    func_course_id INTEGER
) 
RETURNS VOID AS $$
DECLARE
    func_student_id INTEGER;
BEGIN
    /*Добавление нового студента в таблицу Students*/
    INSERT INTO "Students" (first_name, last_name, date_of_birth, email, phone_number, address, enrollment_date, gpa)
    VALUES (func_first_name, func_last_name, func_date_of_birth, func_email, func_phone_number, func_address, func_enrollment_date, func_gpa)
    RETURNING student_id INTO func_student_id;
    
    -- Автоматическое зачисление студента на указанный курс
    INSERT INTO "Enrollments" (student_id, course_id, enrollment_date)
    VALUES (func_student_id, func_course_id, func_enrollment_date);
END;
$$ LANGUAGE plpgsql;

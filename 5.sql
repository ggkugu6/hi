
  /*1.Получите список всех студентов, зачисленных на определенный курс, отсортированный по фамилии*/
SELECT 
	s.first_name, 
	s.last_name
FROM "Students" s
LEFT JOIN "Enrollments" e ON s.student_id = e.student_id
WHERE e.course_id = 2
ORDER BY s.last_name

  /*2.Получите список курсов с указанием количества студентов, зачисленных на каждый курс:*/
SELECT 
	c.course_name, 
	COUNT(e.student_id) AS student_count
FROM "Courses" c
LEFT JOIN "Enrollments" e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY student_count DESC

  /*3. Получите список студентов, которые имеют средний балл (GPA) выше определенного значения:*/
SELECT 
	s.first_name, 
	s.last_name, 
	s.gpa
FROM "Students" s
WHERE gpa > 3.0
ORDER BY gpa DESC

  /*4. Получите полную информацию о зачислениях (включая имя студента и название курса), произошедших в течение последнего месяца:*/
SELECT 
	s.first_name, 
	s.last_name, 
	c.course_name, 
	e.enrollment_date, 
	e.grade
FROM "Enrollments" e
LEFT JOIN "Students" s ON e.student_id = s.student_id
LEFT JOIN "Courses" c ON e.course_id = c.course_id
WHERE e.enrollment_date >= now() - INTERVAL '1 month'
  /*5. Получите список студентов, у которых нет номера телефона, отсортированный по дате зачисления:*/
SELECT 
	first_name, 
	last_name, 
	enrollment_date
FROM "Students" s
WHERE phone_number IS NULL
ORDER BY enrollment_date

  /*6. Получите список курсов, которые проводятся в определенном департаменте, и отсортируйте их по количеству кредитов:*/
SELECT 
	course_name, 
	description, 
	credits
FROM "Courses"
WHERE department = 'Комп. науки'
ORDER BY credits DESC

  /*7. Получите полную информацию о студентах, включая курсы, на которые они зачислены, и их оценки по этим курсам:*/
SELECT 
	s.student_id, 
	s.first_name, 
	s.last_name, 
	c.course_name, 
	e.grade
FROM "Students" s
LEFT JOIN "Enrollments" e ON s.student_id = e.student_id
LEFT JOIN "Courses" c ON e.course_id = c.course_id
ORDER BY s.last_name, s.first_name, c.course_name

  /*8. Получите список студентов, которые зачислены более чем на один курс:*/
SELECT 
	s.student_id, 
	s.first_name, 
	s.last_name, 
	COUNT(e.course_id) AS course_count
FROM "Students" s
LEFT JOIN "Enrollments" e ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(e.course_id) > 1
ORDER BY course_count DESC



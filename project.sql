create DATABASE CollegeDB;
USE CollegeDB;

CREATE TABLE Hostel (
    hostel_id INT PRIMARY KEY,
    hostel_name VARCHAR(100) NOT NULL,
    no_of_seats INT,
    room_no INT
);


CREATE TABLE Student (
    student_PRN INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT,
    date_of_birth DATE NOT NULL,
    hostel_id INT,
    FOREIGN KEY (hostel_id) REFERENCES Hostel(hostel_id) 
);


CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL,
    mobile_no VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    salary DECIMAL(10,2) 
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_credit INT NOT NULL,
    department_id INT,
    faculty_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id) 
);

CREATE TABLE Exam (
    exam_id INT PRIMARY KEY,
    exam_date DATE NOT NULL,
    exam_time TIME NOT NULL,
    course_id INT,
    department_id INT,
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id) 
);

CREATE TABLE Placement (
    placement_id INT PRIMARY KEY,
    student_PRN INT,
    company_name VARCHAR(100) NOT NULL,
    package DECIMAL(10,2),
    company_type VARCHAR(50),
    FOREIGN KEY (student_PRN) REFERENCES Student(student_PRN) 
);

INSERT INTO Hostel (hostel_id, hostel_name, no_of_seats, room_no) VALUES
(1, 'Boys Hostel', 100, 101),
(2, 'Girls Hostel', 80, 202),
(3, 'New Boys Hostel', 120, 303);

INSERT INTO Student (student_PRN, first_name, last_name, email, age, date_of_birth, hostel_id) VALUES
(101, 'Nikhil', 'Puppalwar', 'nikhil.puppalwar23@pccorpune.org', 20, '2004-03-15', 1),
(102, 'Atharv', 'Sakhare', 'atharv.sakhare23@pccorpune.org', 21, '2003-08-22', 3),
(103, 'Shivam', 'Salvi', 'shivam.salvi23@pccorpune.org', 22, '2002-07-10', 1),
(104, 'Vijay', 'Dhame', 'vijay.dhame23@pccorpune.org', 23, '2001-06-19', 3),
(105, 'Pratik', 'Ghavate', 'pratik.ghavate23@pccorpune.org', 20, '2004-04-05', 1),
(106, 'Yadnesh', 'Patil', 'yadnesh.patil23@pccorpune.org', 21, '2003-05-25', 3),
(107, 'Tushar', 'Nagwani', 'tushar.nagwani23@pccorpune.org', 22, '2002-02-12', 1),
(108, 'Keshav', 'Valvi', 'keshav.valvi23@pccorpune.org', 23, '2001-12-30', 3),
(109, 'Tripti', 'Dimri', 'tripti.dimri23@pccorpune.org', 21, '2003-09-08', 2),
(110, 'Rashmika', 'Mandanna', 'rashmika.mandanna23@pccorpune.org', 22, '2002-11-15', 2);

INSERT INTO Department (department_id, department_name) VALUES
(1, 'Computer Engineering'),
(2, 'Mechanical Engineering'),
(3, 'Electronics & Telecommunication'),
(4, 'Civil Engineering');

INSERT INTO Faculty (faculty_id, faculty_name, mobile_no, email, salary) VALUES
(1, 'Ganesh Deshmukh', '9876543210', 'ganesh.deshmukh@pccoepune.org', 75000.00),
(2, 'Minal Shahakar', '9823456789', 'minal.shahakar@pccoepune.org', 68000.00),
(3, 'Sandeep Patil', '9832145678', 'sandeep.patil@pccoepune.org', 72000.00),
(4, 'Meera Joshi', '9841234567', 'meera.joshi@pccoepune.org', 70000.00);

INSERT INTO Course (course_id, course_name, course_credit, department_id, faculty_id) VALUES
(101, 'Database Management System', 4, 1, 1),
(102, 'Data Structures', 3, 2, 2),
(103, 'Microprocessors', 4, 3, 3),
(104, 'Constitution of India', 3, 4, 4);


INSERT INTO Exam (exam_id, exam_date, exam_time, course_id, department_id) VALUES
(1, '2025-04-10', '10:00:00', 101, 1),
(2, '2025-04-15', '14:00:00', 102, 2),
(3, '2025-04-20', '09:00:00', 103, 3),
(4, '2025-04-25', '13:00:00', 104, 4);

INSERT INTO Placement (placement_id, student_PRN, company_name, package, company_type) VALUES
(1, 101, 'TCS', 8.50, 'IT'),
(2, 102, 'Infosys', 7.20, 'IT'),
(3, 103, 'L&T', 9.00, 'Core Engineering'),
(4, 104, 'Mahindra', 6.80, 'Automobile'),
(5, 105, 'Cognizant', 7.50, 'IT'),
(6, 106, 'Wipro', 6.00, 'IT'),
(7, 107, 'Siemens', 10.00, 'Core Engineering'),
(8, 108, 'Google', 25.00, 'IT'),
(9, 109, 'Microsoft', 22.00, 'IT'),
(10, 110, 'Amazon', 20.00, 'E-Commerce');

-- 1. Retrieve all students' details.
SELECT * FROM Student;

-- 2. Find the names and emails of students who are 21 years old.
SELECT first_name, last_name, email 
FROM Student 
WHERE age = 21;

-- 3. Display the names of all courses offered.
SELECT course_name FROM Course;

-- 4. Find the highest package offered in placements.
SELECT MAX(package) AS highest_package FROM Placement;

-- 5. Find the total number of students in the database.
SELECT COUNT(*) AS total_students FROM Student;

-- 6. Find the number of students in each hostel.
SELECT hostel_id, COUNT(student_PRN) AS total_students
FROM Student
GROUP BY hostel_id;

-- 7. Find the number of students in each hostel, but only show hostels with more than 2 students.
SELECT hostel_id, COUNT(student_PRN) AS total_students
FROM Student
GROUP BY hostel_id
HAVING COUNT(student_PRN) > 2;

-- 8. Find students who have been placed with a package greater than 10 LPA.
SELECT first_name, last_name, student_PRN 
FROM Student 
WHERE student_PRN IN (SELECT student_PRN FROM Placement WHERE package > 10);

-- 9. Find the average salary of all faculty members.
SELECT AVG(salary) AS avg_salary FROM Faculty;

-- 10. Find all exams scheduled for April 2025.
SELECT * FROM Exam
WHERE exam_date BETWEEN '2025-04-01' AND '2025-04-30';

-- 11. Find the total number of courses offered by the college.
SELECT COUNT(*) AS total_courses FROM Course;

-- 12. Find the department names along with the number of courses offered in each department.
SELECT department_id, COUNT(course_id) AS total_courses
FROM Course
GROUP BY department_id;

-- 13. Find students who are not staying in any hostel (NULL values).
SELECT first_name, last_name 
FROM Student 
WHERE hostel_id IS NULL;

-- 14. Find the faculty member with the highest salary.
SELECT faculty_name, salary
FROM Faculty
WHERE salary = (SELECT MAX(salary) FROM Faculty);

-- 15. Find all students who have their first name starting with 'A'.
SELECT * FROM Student WHERE first_name LIKE 'A%';


create database erp;
use erp;

-- Creating Students table
CREATE TABLE Students (
    Student_PRN VARCHAR(20) PRIMARY KEY NOT NULL,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Student_Email VARCHAR(100),
    Student_Phone VARCHAR(15),
    Student_DOB DATE,
    Student_Course VARCHAR(100)
);

-- Inserting data into Students
INSERT INTO Students (Student_PRN, First_Name, Last_Name, Student_Email, Student_Phone, Student_DOB, Student_Course)
VALUES('1', 'Atharv', 'sakhare', 'atharv.sakhare@example.com', '9518594233', '2004-09-16', 'B.TECH'),
    ('2', 'shivam', 'salve', 'shivam.salve@example.com', '9284998275', '2005-02-26', 'B.TECH'),
    ('3', 'Laxman', 'Patil', 'laxman.patil@example.com', '9322716008', '2004-10-02', 'B.TECH'),
    ('4', 'Pratik', 'Bhosale', 'pratik.bhosale@example.com', '9856453728', '2003-01-25', 'MCA'),
    ('5', 'Tejaswini', 'Kadam', 'tejaswini.kadam@example.com', '9845216879', '2000-08-05', 'BBA');
    
INSERT INTO Students (Student_PRN, First_Name, Last_Name, Student_Course)
VALUES  ('7', 'nikhil', 'pupplawar','B.TECH');
  
  
-- Creating Faculty table
CREATE TABLE Faculty (
    Faculty_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    Faculty_Name VARCHAR(100),
    Faculty_Email VARCHAR(100),
    Faculty_Contact VARCHAR(15),
    Department VARCHAR(100)
);
  
-- Inserting data into Faculty
INSERT INTO Faculty (Faculty_ID, Faculty_Name, Faculty_Email, Faculty_Contact, Department)
VALUES
    ('F1', 'Ganesh Deshmukh', 'ganesh.deshmukh@example.com', '9423881868', 'Computer Science(rl)'),
    ('F2', 'Rucha Shinde', 'rucha.shinde@example.com', '95522768250', 'Management'),
    ('F3', 'Minal Shahakar', 'minal.shahakar@example.com', '8208381476', 'IT'),
    ('F4', 'Rachana Patil', 'rachana.patil@example.com', '9421307607', 'Civil'),
    ('F5', 'Vinayak Mali', 'vinayak.mali@example.com', '9420631872', 'Mechanical');

-- Creating Courses table
CREATE TABLE Courses (
    Course_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    Course_Name VARCHAR(100),
    Credits INT
);

-- Inserting data into Courses
INSERT INTO Courses (Course_ID, Course_Name, Credits)
VALUES
    ('C1', 'Advance Data Structure', 2),
    ('C2', 'M3', 2),
    ('C3', 'Proiect Management', 4),
    ('C4', 'Gen Ai', 3),
    ('C5', 'Database Management', 4);

-- Creating Enrollment table
CREATE TABLE Enrollment (
    Student_PRN VARCHAR(20),
    Course_ID VARCHAR(20),
    PRIMARY KEY (Student_PRN, Course_ID),
    FOREIGN KEY (Student_PRN) REFERENCES Students(Student_PRN),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

-- Inserting data into Enrollment
INSERT INTO Enrollment (Student_PRN, Course_ID)
VALUES
    ('1', 'C1'),
    ('2', 'C2'),
    ('3', 'C3'),
    ('4', 'C4'),
    ('5', 'C5');

-- Creating Attendance table
CREATE TABLE Attendance (
    Student_PRN VARCHAR(20),
    Course_ID VARCHAR(100),
    Status VARCHAR(2) CHECK (Status IN ('A', 'P')),
    PRIMARY KEY (Student_PRN, Course_ID),
    FOREIGN KEY (Student_PRN) REFERENCES Students(Student_PRN),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);


-- Inserting data into Attendance
INSERT INTO Attendance (Student_PRN, Course_ID, Status)
VALUES
    ('1', 'C1', 'P'),
    ('2', 'C2', 'A'),
    ('3', 'C3', 'P'),
    ('4', 'C4', 'P'),
    ('5', 'C5', 'A');

-- Creating Faculty Salary table
CREATE TABLE Faculty_Salary (
    Faculty_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    Amount DECIMAL(10,2),
    Department VARCHAR(100),
    FOREIGN KEY (Faculty_ID) REFERENCES Faculty(Faculty_ID)
);

-- Inserting data into Faculty Salary
INSERT INTO Faculty_Salary (Faculty_ID, Amount, Department)
VALUES
    ('F1', 150000.00, 'Computer Science(rl)'),
    ('F2', 100000.00, 'Management'),
    ('F3', 120000.00, 'IT'),        
    ('F4', 200000.00, 'Civil'),
    ('F5', 900000.00, ' ');

-- Creating Fees table
CREATE TABLE Fees (
    Student_PRN VARCHAR(20),
    Course_Name VARCHAR(100),
    Amount DECIMAL(10,2),
    Dept_ID VARCHAR(20),
    PRIMARY KEY (Student_PRN, Course_Name),
    FOREIGN KEY (Student_PRN) REFERENCES Students(Student_PRN)
);

-- Inserting data into Fees
INSERT INTO Fees (Student_PRN, Course_Name, Amount, Dept_ID)
VALUES
    ('1', 'Advance Data Structure', 15000.00, 'D1'),
    ('2', 'M3', 18000.00, 'D2'),
    ('3', 'Proiect Management', 16000.00, 'D3'), 
    ('4', 'Gen Ai', 14000.00, 'D4'),
    ('5', 'Database Management', 17500.00, 'D5');

-- Creating Feedback table
CREATE TABLE Feedback (
    Student_PRN VARCHAR(20),
    Course_ID VARCHAR(100),
    Message TEXT,
    FOREIGN KEY (Student_PRN) REFERENCES Students(Student_PRN),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

-- Inserting data into Feedback
INSERT INTO Feedback (Student_PRN, Course_ID, Message)
VALUES
    ('1', 'C1', 'Great course!'),
    ('2', 'C2', 'Very informative sessions.'),
    ('3', 'C3', 'Good content, but needs more case studies.'),
    ('4', 'C4', 'Helpful for understanding finance.'),
    ('5', 'C5', 'Well-structured and practical.');

-- Creating Department table
CREATE TABLE Department (
    Dept_ID VARCHAR(20) PRIMARY KEY,
    Dept_Name VARCHAR(100)
);

-- Inserting data into Department
INSERT INTO Department (Dept_ID, Dept_Name)
VALUES
    ('D1', 'Computer Science(rl)'),
    ('D2', 'Management'),
    ('D3', 'IT'), 
    ('D4', 'Civil'),
    ('D5', 'Mechanical');

-- Creating Exam table
CREATE TABLE Exam (
    Course_ID VARCHAR(100),
    Date DATE,
    Time TIME,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

-- Inserting data into Exam
INSERT INTO Exam (Course_ID, Date, Time)
VALUES
    ('C1', '2025-05-10', '10:00:00'),
    ('C2', '2025-05-12', '11:00:00'),
    ('C3', '2025-05-14', '10:30:00'),
    ('C4', '2025-05-16', '12:00:00'),
    ('C5', '2025-05-18', '09:30:00');
    SELECT DISTINCT Course_Name FROM Courses;

show tables;

select*from department;

select*from enrollment;

select*from exam;

select*from faculty;

select*from faculty_salary;

select*from feedback;

select*from fees;

 select*from students;

 select*from attendance;
 
  select*from courses;
  
  
  
  
  
  
  
  
UPDATE Students
SET Student_Course = 'M.TECH'
WHERE Student_PRN = '2';
DELETE FROM Students
WHERE Student_PRN = '7';

select * from Students;

SELECT * FROM Students
 WHERE Student_Phone LIKE '951%';
 
 SELECT Course_ID, Course_Name, Credits FROM Courses ORDER BY Credits DESC;

SELECT Course_ID, Date, Time FROM Exam WHERE Date BETWEEN '2025-05-01' AND '2025-06-30';

SELECT Dept_ID, SUM(Amount) AS Total_Fees FROM Fees GROUP BY Dept_ID;

SELECT Student_Course, COUNT(Student_PRN) AS Total_Students FROM Students GROUP BY Student_Course HAVING COUNT(Student_PRN) >= 1;

SELECT Students.Student_PRN, Students.First_Name FROM Students INNER JOIN Enrollment ON Students.Student_PRN = Enrollment.Student_PRN;

SELECT Students.Student_PRN, Enrollment.Course_ID
FROM Students
LEFT JOIN Enrollment ON Students.Student_PRN = Enrollment.Student_PRN;



SELECT Courses.Course_ID, Courses.Course_Name, Students.First_Name FROM Students RIGHT JOIN Enrollment ON Students.Student_PRN = Enrollment.Student_PRN RIGHT JOIN Courses ON Enrollment.Course_ID = Courses.Course_ID; 

SELECT Faculty_ID, Faculty_Name, Department FROM Faculty WHERE Department = (SELECT Dept_Name FROM Department WHERE Dept_ID = (SELECT MIN(Dept_ID) FROM Department));

SELECT Course_ID, Date FROM Exam WHERE Date > (SELECT MIN(Date) FROM Exam);

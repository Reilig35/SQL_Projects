--Creating Database
CREATE DATABASE School_2021;

--Telling DBMS to use School_2021
USE School_2021;

--Creating Classes table
CREATE TABLE Classes (
	Class_ID INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	Class_Name varchar(50) NOT NULL
);

--Creating Students Table
CREATE TABLE Students (
	Student_ID INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	Student_Name varchar(50) NOT NULL
);

--Creating Instructors Table
CREATE TABLE Instructors (
	Instructor_ID INT PRIMARY KEY NOT NULL IDENTITY(1000, 1),
	Instrustor_Name varchar(50) NOT NULL
);

--Adding in 2 new columns for foregin keys
ALTER TABLE Students
ADD Class INT

ALTER TABLE Students
ADD Instructor INT

--Adding in the foregin keys
ALTER TABLE Students
ADD CONSTRAINT FK_ClassID
FOREIGN KEY(Class) REFERENCES Classes(Class_ID) ON UPDATE CASCADE ON DELETE CASCADE


ALTER TABLE Students
ADD CONSTRAINT FK_InstructorID
FOREIGN KEY(Instructor) REFERENCES Instructors(Instructor_ID) ON UPDATE CASCADE ON DELETE CASCADE


--Populating Classes Table
INSERT INTO Classes (Class_Name)
	VALUES
	('Software Developer Bootcamp'),
	('C# Boot Camp')
;

--Populating Students Table
INSERT INTO Students(Student_Name)
	VALUES
	('Matthew Berry'),
	('Alice Jordan'),
	('William Thompson'),
	('Nicole Daly'),
	('Gerry Springton'),
	('Mary Kennedy')
;


INSERT INTO Instructors(Instrustor_Name)
	VALUES
	('Susan Flynn'),
	('Anthony McCarthy')
;


--Updating the Class_ID Column to have a value for each student
UPDATE Students
	SET Class = 1
	WHERE Student_ID = 1
;

UPDATE Students
	SET Class = 1
	WHERE Student_ID = 3
;

UPDATE Students
	SET Class = 1
	WHERE Student_ID = 4
;

UPDATE Students
	SET Class = 2
	WHERE Student_ID = 2
;

UPDATE Students
	SET Class = 2
	WHERE Student_ID = 5
;

UPDATE Students
	SET Class = 2
	WHERE Student_ID = 6
;

--Updating the Instructor_ID Column to have a value for each student
UPDATE Students
	SET Instructor = 1000
	WHERE Student_ID = 1
;

UPDATE Students
	SET Instructor = 1000
	WHERE Student_ID = 3
;

UPDATE Students
	SET Instructor = 1000
	WHERE Student_ID = 4
;

UPDATE Students
	SET Instructor = 1001
	WHERE Student_ID = 2
;

UPDATE Students
	SET Instructor = 1001
	WHERE Student_ID = 5
;

UPDATE Students
	SET Instructor = 1001
	WHERE Student_ID = 6
;

--Selecting Instructors Name with an alias
SELECT Instrustor_Name AS Instructor 
	FROM Instructors
;

--Selecting Students Names in alphabetical Order
SELECT Student_Name AS Pupil
	FROM Students
	ORDER BY Student_Name
;

--Using Inner join to get students, Courses and Instructors
SELECT Students.Student_Name AS 'Student',
		Classes.Class_Name AS 'Course',
		Instructors.Instrustor_Name AS 'Instructor'
		FROM Students 
		INNER JOIN Classes on Students.Class = Classes.Class_ID
		INNER JOIN Instructors on Students.Instructor = Instructors.Instructor_ID
;

	

	

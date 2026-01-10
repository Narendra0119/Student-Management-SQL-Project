/* =======================================
   STUDENT MANAGEMENT DATABASE – SQL SERVER
   ===================================*/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'StudentManagement')
BEGIN
    CREATE DATABASE StudentManagement;
END
GO

-- 2. Use Database
USE StudentManagement;
GO

-- 3. Create Students Table
IF OBJECT_ID('Students', 'U') IS NOT NULL
    DROP TABLE Students;
GO

CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Gender CHAR(1),
    Age INT,
    Grade VARCHAR(2),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);
GO

-- 4. Insert Data (10 Records)
INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES
('Rahul', 'M', 16, 'A', 85, 88, 90),
('Ananya', 'F', 15, 'A', 92, 91, 89),
('Rohan', 'M', 17, 'B', 78, 80, 75),
('Sneha', 'F', 16, 'B', 81, 84, 86),
('Arjun', 'M', 15, 'C', 65, 70, 68),
('Priya', 'F', 17, 'A', 95, 93, 96),
('Karan', 'M', 16, 'C', 60, 62, 58),
('Neha', 'F', 15, 'B', 79, 82, 80),
('Vikram', 'M', 17, 'A', 88, 85, 90),
('Pooja', 'F', 16, 'C', 72, 74, 76);
GO

-------------------------------------------------
-- DATA ANALYSIS QUERIES
-------------------------------------------------

-- 1. Show all students
SELECT * FROM Students;
GO

-- 2. Average score in each subject
SELECT
    AVG(MathScore * 1.0) AS AvgMath,
    AVG(ScienceScore * 1.0) AS AvgScience,
    AVG(EnglishScore * 1.0) AS AvgEnglish
FROM Students;
GO

-- 3. Top performer (highest total score)
SELECT TOP 1
    Name,
    (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC;
GO

-- 4. Count students per grade
SELECT
    Grade,
    COUNT(*) AS StudentCount
FROM Students
GROUP BY Grade;
GO

-- 5. Average score by gender
SELECT
    Gender,
    AVG(MathScore * 1.0) AS AvgMath,
    AVG(ScienceScore * 1.0) AS AvgScience,
    AVG(EnglishScore * 1.0) AS AvgEnglish
FROM Students
GROUP BY Gender;
GO

-- 6. Students with Math score > 80
SELECT
    Name,
    MathScore
FROM Students
WHERE MathScore > 80;
GO

-- 7. Update a student's grade
UPDATE Students
SET Grade = 'A'
WHERE Name = 'Rohan';
GO

-- Verify Update
SELECT Name, Grade FROM Students WHERE Name = 'Rohan';
GO

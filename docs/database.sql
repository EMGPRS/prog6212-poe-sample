-- Sample SQL Server schema and seed data for student records.
IF OBJECT_ID(N'dbo.Students', N'U') IS NULL
BEGIN
	CREATE TABLE dbo.Students
	(
		StudentId INT IDENTITY(1, 1) NOT NULL CONSTRAINT PK_Students PRIMARY KEY,
		StudentNumber VARCHAR(20) NOT NULL CONSTRAINT UQ_Students_StudentNumber UNIQUE,
		FirstName NVARCHAR(100) NOT NULL,
		LastName NVARCHAR(100) NOT NULL,
		Email NVARCHAR(255) NOT NULL CONSTRAINT UQ_Students_Email UNIQUE,
		DateOfBirth DATE NOT NULL,
		Programme NVARCHAR(150) NOT NULL,
		EnrollmentDate DATE NOT NULL,
		IsActive BIT NOT NULL CONSTRAINT DF_Students_IsActive DEFAULT (1),
		CreatedAt DATETIME2 NOT NULL CONSTRAINT DF_Students_CreatedAt DEFAULT (SYSUTCDATETIME())
	);
END;
GO

-- Insert sample records only when they do not already exist.
INSERT INTO dbo.Students
	(StudentNumber, FirstName, LastName, Email, DateOfBirth, Programme, EnrollmentDate, IsActive)
SELECT
	seed.StudentNumber,
	seed.FirstName,
	seed.LastName,
	seed.Email,
	seed.DateOfBirth,
	seed.Programme,
	seed.EnrollmentDate,
	seed.IsActive
FROM
(
	VALUES
		('STU2026001', N'Ayanda', N'Mokoena', N'ayanda.mokoena@example.com', CONVERT(DATE, '2004-03-12'), N'Diploma in Information Technology', CONVERT(DATE, '2026-01-15'), CAST(1 AS BIT)),
		('STU2026002', N'Liam', N'Jacobs', N'liam.jacobs@example.com', CONVERT(DATE, '2003-08-24'), N'Diploma in Software Development', CONVERT(DATE, '2026-01-15'), CAST(1 AS BIT)),
		('STU2026003', N'Zanele', N'Nkosi', N'zanele.nkosi@example.com', CONVERT(DATE, '2005-01-30'), N'Diploma in Data Analytics', CONVERT(DATE, '2026-02-02'), CAST(1 AS BIT)),
		('STU2026004', N'Jordan', N'Williams', N'jordan.williams@example.com', CONVERT(DATE, '2002-11-05'), N'Bachelor of Business Administration', CONVERT(DATE, '2025-07-21'), CAST(0 AS BIT)),
		('STU2026005', N'Naledi', N'Dlamini', N'naledi.dlamini@example.com', CONVERT(DATE, '2004-06-18'), N'Diploma in Information Technology', CONVERT(DATE, '2026-01-15'), CAST(1 AS BIT))
) AS seed (StudentNumber, FirstName, LastName, Email, DateOfBirth, Programme, EnrollmentDate, IsActive)
WHERE NOT EXISTS
(
	SELECT 1
	FROM dbo.Students AS student
	WHERE student.StudentNumber = seed.StudentNumber
);
GO

SELECT
	StudentId,
	StudentNumber,
	FirstName,
	LastName,
	Email,
	DateOfBirth,
	Programme,
	EnrollmentDate,
	IsActive,
	CreatedAt
FROM dbo.Students
ORDER BY StudentId;

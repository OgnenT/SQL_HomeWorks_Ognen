CREATE DATABASE FirstHomeWork

USE FirstHomeWork

create table [MyCustomeTable]
(
Id int IDENTITY (1,1) not null,
FName nvarchar(100) not null,
LName nvarchar(100) null,
CONSTRAINT [pk_MyCustomeTable] PRIMARY KEY ClUSTERED (Id asc)
)

SET IDENTITY_INSERT MyCustomeTable OFF

INSERT INTO MyCustomeTable ([Id], [FName], [LName])
VALUES (1,'Ognen', 'Temelkovski')
	  ,(2,'Gorjan', 'Temelkovski')
	  ,(3,'Biljana','Temelkovska')

Select *
from MyCustomeTable

SELECT FName, LName
from MyCustomeTable
where FName = 'Stevo'

UPDATE MyCustomeTable
set FName = 'Stevo'
where FName = 'Biljana'

-- Тhis above is my table exercise :)

-- HomeWork-01
----------------- Table 01 - Student --------------------------
create table Student
(
	Id smallint identity (1,1) not null,
	FirstName nvarchar (50) not null,
	LastName nvarchar (50) not null,
	DateOfBirth date not null,
	EnriollDate date null,
	Gender nchar (1) NOT null,
	NationalIDNumber nvarchar (20) null,
	StudentCardNumber nvarchar (20) null,
CONSTRAINT pk_Student PRIMARY KEY CLUSTERED (Id asc)
)

DROP TABLE IF EXISTS Student

SET IDENTITY_INSERT Student off

insert into Student (Id, FirstName, LastName, DateOfBirth, Gender)
values (1, 'Ognen', 'Temelkovski', '04/25/1989', 'M')
insert into Student (Id, FirstName, LastName, DateOfBirth, Gender)
values (2, 'Biljana', 'Temelkovska', '01/17/1987', 'F')
insert into Student (Id, FirstName, LastName, DateOfBirth, Gender)
values (3, 'Gorjan', 'Temelkovski', '04/25/1989', 'M')

Select FirstName, LastName
from Student
where Gender = 'M'


----------------- Table 02 - Teacher --------------------------
create table Teacher
(
	Id smallint IDENTITY (1,1) not null,
	FirstName nvarchar (30) not null,
	LastName nvarchar (30)not null,
	DateOfBirth date null,
	AcademicRanc int null,
	HireDate date null,
	CONSTRAINT pk_Teacher PRIMARY KEY CLUSTERED (Id asc)
)

Select *
from Teacher


----------------- Table 03 - GradeDetails --------------------------
create table GradeDetails
(
	Id smallint IDENTITY (1,1) not null,
	GradeID int not null,
	AchievementTypeID int not null,
	AchievementPoints float not null,
	AchievementMaxPoints float not null,
	AchievementDate date not null,
CONSTRAINT pk_GradeDetails PRIMARY KEY CLUSTERED (Id asc)
)
drop table if exists GradeDetails

Select *
From GradeDetails


----------------- Table 04 - Course --------------------------
create table Course
(
	Id int IDENTITY (1,1) not null,
	Name nvarchar (50) not null,
	Credit int null,
	AcademicYear int null,
	Semester int,
Constraint pk_Course primary key clustered (Id asc)
)

Select *
from Course


----------------- Table 05 - Course --------------------------
create table Grade
(
	Id smallint Identity (1,1) not null,
	StudentID nvarchar (20) not null,
	CourseID nvarchar (20) not null,
	TeacherID nvarchar (50) null,
	Grade smallint not null,
	Comment nvarchar (100) null,
	CreatedDate date not null,
Constraint pk_Grade primary key clustered (Id asc)
)

SET IDENTITY_INSERT Grade ON

Insert into Grade (Id, StudentID, CourseID, Grade, CreatedDate)
values (2,'1Asdd23dsqw', 'SQL Management', '13', '08/05/2020')

Select *
from Grade


----------------- Table 06 - AchievementType --------------------------
create table AchievementType
(
	Id int identity (1,1) not null,
	Name nvarchar (50) not null,
	Description nvarchar (100) null,
	Participationrate int
Constraint pk_AchievementType primary key clustered (Id asc)
)

Select *
from AchievementType
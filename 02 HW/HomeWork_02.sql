USE [SEDCHome]
GO
--------------Homework requirement 1/6--------------
--Find all Students with FirstName = Antonio
Select *
from Student
where FirstName = 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’
Select *
from Student
where DateOfBirth > '01-01-1999'

--Find all Male students
Select *
from Student
where Gender = 'M'

--Find all Students with LastName starting With ‘T’
Select *
from Student
where LastName like 'T%'

--Find all Students Enrolled in January/1998
Select *
from Student
where EnrolledDate BETWEEN '01-01-1998' AND '01-31-1998'

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
Select *
from Student
where EnrolledDate BETWEEN '01-01-1998' AND '01-31-1998' and LastName like 'J%'


------------- Homework requirement 2/6------------------------
--Find all Students with FirstName = Antonio ordered by Last Name
Select *
from Student
where FirstName = 'Antonio' 
order by LastName

--List all Students ordered by FirstName
Select *
from Student
order by FirstName

--Find all Male students ordered by EnrolledDate, starting from the last enrolled
Select *
from Student
where Gender = 'M'
order by EnrolledDate desc


------------- Homework requirement 3/6------------------------
--List all Teacher First Names and Student First Names in single result set with duplicates
Select FirstName
from Teacher
union all
Select FirstName
from Student

--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
Select LastName
from Teacher
union
Select LastName
from Student

--List all common First Names for Teachers and Students
Select FirstName
from Teacher
intersect
Select FirstName
from Student


------------- Homework requirement 4/6------------------------
--Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert
alter table GradeDetails
add constraint GradeDetails_AchievementMaxPoints  --ova se kreira za izmeni i dodavanje kolona so defaultna vrednost itn.
default 100 for [AchievementMaxPoints]
GO

--Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints
alter table GradeDetails with check
add constraint [CK_GradeDetails_AchievementPoints]
check (AchievementMaxPoints > AchievementPoints)

--Change AchievementType table to guarantee unique names across the Achievement types
alter table AchievementType with check
add constraint UC_Name unique (Name)


------------- Homework requirement 5/6------------------------
--Create Foreign key constraints from diagram or with script
alter table dbo.[Grade] with check
add constraint FK_Grade_StudentID
foreign key ([StudentID]) references dbo.[Student] ([ID])

alter table dbo.[Grade] with check
add constraint FK_Grade_CourseID
foreign key ([CourseID]) references dbo.[Course] ([ID])

alter table dbo.[Grade] with check
add constraint FK_Grade_TeacherID
foreign key ([TeacherID]) references dbo.[Teacher] ([ID])

alter table dbo.[GradeDetails] with check
add constraint FK_GradeDetails_GradeID
foreign key ([GradeID]) references dbo.[Grade] ([ID])

alter table dbo.[GradeDetails] with check
add constraint FK_GradeDetails_AchievementTypeID
foreign key ([AchievementTypeID]) references dbo.[AchievementType] ([ID]) --ova ne go razbiram zasto ne mi funkcionira


------------- Homework requirement 6/6------------------------
--List all possible combinations of Courses names and AchievementType names that can be passed by student
select Course.Name, AchievementType.Name
from Course
full join [dbo].[AchievementType] on Course.ID = AchievementType.ID


--List all Teachers that has any exam Grade
select *
from Teacher
full join [dbo].[Grade] on Teacher.ID = Grade.TeacherID

--List all Teachers without exam Grade
select *
from Teacher
full join [dbo].[Grade] on Teacher.ID = Grade.TeacherID
where Grade.ID is null

--List all Students without exam Grade (using Right Join)
Select * 
from Grade 
right join [dbo].[Student] on Grade.StudentID = Student.ID
where Grade.StudentID is null

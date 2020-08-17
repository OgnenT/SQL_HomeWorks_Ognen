--Homework requirement 1/2
--Declare scalar variable for storing FirstName values
--Assign value ‘Antonio’ to the FirstName variable
--Find all Students having FirstName same as the variable
declare @firstName nvarchar(200)
set @firstName = 'Antonio'

Select *
from dbo.Student
where FirstName = @firstName
go


--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the table variable with all Female students

declare @StudentTable table 
(
StudentId int not null,
StudentName nvarchar(150),
DateOfBirth datetime
)

insert into @StudentTable (StudentId, StudentName, DateOfBirth)
values(1, 'Biljana', '1987-01-17'),
	  (2, 'Sofija', '1958-07-27'),
	  (3, 'Aleksandra', '1954-12-23')
	  
select *
from @StudentTable
go


--Declare temp table that will contain LastName and EnrolledDate columns
--Fill the temp table with all Male students having First Name starting with ‘A’
--Retrieve the students from the table which last name is with 7 characters
drop table if exists #customTempTable
create table #customTempTable
(
LastName nvarchar(100),
EnrollDate datetime
)
insert into #customTempTable
values('Aleksandar', '2020-01-26'),
	  ('Andrej', '2018-06-28'),
	  ('Anastas','2017-05-09')

select *
from #customTempTable
where LEN(LastName) = 7
go


--Find all teachers whose FirstName length is less than 5 and
--the first 3 characters of their FirstName and LastName are the same
select *
from Teacher
where LEN(FirstName) = 5 and SUBSTRING(FirstName,1,3) = SUBSTRING(LastName,1,3)
go

--Homework requirement 2/2
--Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:
--StudentCardNumber without “sc-”
--“ – “
--First character of student FirstName
--“.”
--Student LastName

alter function dbo.fn_FormatStudentName (@EmployeeID int)
returns nvarchar(100)
as
begin
	declare @result nvarchar(200)

	select @result = StudentCardNumber  + ' - ' + SUBSTRING(FirstName,1,1) + '.' + [LastName] 
	from dbo.Student
	where id = @EmployeeID

	return @result
 end
go

select *, dbo.fn_FormatStudentName(ID) as FunctionOutput
from dbo.Student

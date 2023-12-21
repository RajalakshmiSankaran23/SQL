create database SISDB;
use SISDB;

create table Students (
    student_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    date_of_birth date,
    email varchar(100),
    phone_number varchar(15)
);

create table Courses (
    course_id int primary key,
    course_name varchar(100),
    credits int,
    teacher_id int,
    foreign key(teacher_id) references Teachers(teacher_id)
);

create table Enrollments (
    enrollment_id int primary key,
    student_id int,
    course_id int,
    enrollment_date date,
    foreign key(student_id) references Students(student_id),
    foreign key (course_id) references Courses(course_id)
);

create table Teachers (
    teacher_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(100)
);

create table Payments (
    payment_id int primary key,
    student_id int,
    amount decimal(10, 2), 
    payment_date date,
    foreign key(student_id) references Students(student_id)
);

---3

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES(21, 'Aarav', 'Sena', '1996-08-14', 'aarav@gmail.com', '8765898766'),
(22, 'Aisha', 'Varma', '1997-02-28', 'aisha@gmail.com', '7654876546'),
(23, 'Arjun', 'Rajput', '1998-07-09', 'arjun@gmail.com', '9976345678'),
(24, 'Ishita', 'Sharma', '1999-12-04', 'ishita@gmail.com', '8764498776'),
(25, 'Rohan', 'Nair', '1995-05-19', 'rohan@gmail.com', '9987676789'),
(26, 'Ananya', 'Gupta', '1999-10-25', 'anany@gmail.com', '9876543211'),
(27, 'Ravi', 'Patil', '1996-03-15', 'ravi@gmail.com', '8765432112'),
(28, 'Priya', 'Kumar', '1997-08-22', 'priya@gmail.com', '7768654598'),
(29, 'Vikram', 'Shinde', '1998-01-07', 'vikram@gmail.com', '9988776655'),
(30, 'Neha', 'Chopra', '1995-06-30', 'neha@gmail.com', '8877665544');

select * from Students;

INSERT INTO Courses(course_id, course_name, credits, teacher_id)
VALUES(1, 'Introduction to Computer Science', 3, 101),
(2, 'Mathematics for Beginners', 4, 102),
(3, 'History of Art', 3, 103),
(4, 'English Literature', 3, 104),
(5, 'Physics Fundamentals', 4, 105),
(6, 'Digital Marketing Strategies', 3, 106),
(7, 'Introduction to Psychology', 3, 107),
(8, 'Spanish Language Basics', 2, 108),
(9, 'Environmental Science', 4, 109),
(10, 'Business Ethics', 3, 110);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES(1, 21, 1, '2023-01-15'),
(2, 22, 3, '2023-01-16'),
(3, 23, 5, '2023-01-17'),
(4, 24, 2, '2023-01-18'),
(5, 25, 4, '2023-01-19'),
(6, 26, 7, '2023-01-20'),
(7, 27, 10, '2023-01-21'),
(8, 28, 8, '2023-01-22'),
(9, 29, 6, '2023-01-23'),
(10, 30, 9, '2023-01-24');

INSERT INTO Teachers (teacher_id, first_name, last_name, email)
VALUES(101, 'Anita', 'Sharma', 'anita@gmail.com'),
(102, 'Raj', 'Patel', 'raj@.com'),
(103, 'Priya', 'Kumar', 'priya@gmail.com'),
(104, 'Vikram', 'Singh', 'vikram@.com'),
(105, 'Neha', 'Verma', 'neha@gmail.com'),
(106, 'Amit', 'Gupta', 'amit@gmail.com'),
(107, 'Shreya', 'Rajput', 'shreya@gmail.com'),
(108, 'Rahul', 'Singhania', 'rahul@gmail.com'),
(109, 'Sneha', 'Mishra', 'sneha@gmail.com'),
(110, 'Karan', 'Khanna', 'karan@gmail.com');

INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES(1, 21, 500.00, '2023-01-15'),
(2, 22, 600.00, '2023-01-16'),
(3, 23, 750.00, '2023-01-17'),
(4, 24, 550.00, '2023-01-18'),
(5, 25, 700.00, '2023-01-19'),
(6, 26, 800.00, '2023-01-20'),
(7, 27, 900.00, '2023-01-21'),
(8, 28, 600.00, '2023-01-22'),
(9, 29, 850.00, '2023-01-23'),
(10, 30, 700.00, '2023-01-24');

---3 b 1
insert into Students values (31,'John','Doe','1995-08-15','john.doe@example.com',1234567890);

---3 b 2


--3 b 3
UPDATE Teachers
SET email = 'ananya@gmail.com'
WHERE teacher_id = 26;

---3 b 4

delete from Enrollments
where student_id = 28 and course_id = 8;

---3 b 5

update Courses
set teacher_id = 111
where course_name = 'History of Art';

---3 b 6

delete from Enrollments where student_id = 22;
delete from Students where student_id = 22;

---3 b 7

update Payments
set amount = 600.00
where payment_id = 4;

---4 Joins
---4 1

select s.student_id,s.first_name,s.last_name,
sum(p.amount) as total_payments
from Students s
join Payments p on s.student_id  = p.student_id
where s.student_id = 29
group by s.student_id, s.first_name, s.last_name;

---4 2

select c.course_id, c.course_name, count(e.student_id) as student_count
from Courses c
left join Enrollments e on c.course_id = e.course_id
group by c.course_id, c.course_name;

---4 3

select s.student_id, s.first_name, s.last_name
from Students s
left join Enrollments e on s.student_id = e.student_id
where e.enrollment_id is null;

---4 4

select s.first_name, s.last_name, c.course_name
from Students s
join enrollments e on s.student_id = e.student_id
join Courses c on e.course_id = c.course_id;

---4 5

select t.first_name as teacher_first_name, t.last_name as teacher_last_name, c.course_name
from Teachers t
join Courses c on t.teacher_id = c.teacher_id;

---4 6

select s.first_name, s.last_name, e.enrollment_date
from Students s
join Enrollments e on s.student_id = e.student_id
join Courses c on e.course_id = c.course_id
where c.course_name = 'Business Ethics';

---4 7

select s.first_name, s.last_name
from Students s
left join Payments p on s.student_id = p.student_id
where p.payment_id is null;

---4 8

select c.course_id, c.course_name
from Courses c
left join Enrollments e on c.course_id = e.course_id
where e.enrollment_id is null;


---4 9 

select distinct e1.student_id, s.first_name, s.last_name
from Enrollments e1
join  Enrollments e2 on e1.student_id = e2.student_id and e1.enrollment_id <> e2.enrollment_id
join Students s on e1.student_id = s.student_id;


---4 10

select t.teacher_id,t.first_name, t.last_name
from Teachers t
left join Courses c on t.teacher_id = c.teacher_id
where c.course_id is null;

---5 1

select course_id, course_name,
avg(enrollment_count) AS average_students_enrolled
from (
select c.course_id, c.course_name,
count(e.student_id) AS enrollment_count
from Courses c
left join Enrollments e ON c.course_id = e.course_id
group by c.course_id, c.course_name
) as enrollment_counts
group by
course_id, course_name;

---5 2

select s.student_id, s.first_name, s.last_name, p.amount AS highest_payment_amount
from Students s
join Payments p ON s.student_id = p.student_id
where p.amount = (
select max(amount)
from Payments
);

---5 3

select c.course_id, c.course_name,enrollment_count
from Courses c
join (
select course_id, COUNT(student_id) as enrollment_count
from Enrollments
group by course_id
) as enrollment_counts on c.course_id = enrollment_counts.course_id
where enrollment_count = (
select max(enrollment_count)
from (
select count(student_id) AS enrollment_count
from Enrollments
group by  course_id
) as max_enrollment
);

---5 4

select t.teacher_id, t.first_name, t.last_name,
coalesce(sum(p.amount), 0) as total_payments
from Teachers t
left join Courses c on t.teacher_id = c.teacher_id
left join Enrollments e on c.course_id = e.course_id
left join Payments p on e.student_id = p.student_id
GROUP BY t.teacher_id, t.first_name, t.last_name;

---5 5

select student_id,first_name, last_name
from Students s
where (select count(distinct course_id)
from Enrollments
where student_id = s.student_id) = ( select count(distinct course_id)
from Courses
);

---5 6

select teacher_id, first_name, last_name
from Teachers
where teacher_id NOT IN (
select distinct teacher_id
from Courses
);

---5 8

select course_id, course_name
from Courses
where course_id NOT IN ( select distinct course_id
from Enrollments
);

---5 9 

select e.student_id, e.course_id, c.course_name,
sum(p.amount) AS total_payments
from Enrollments e
join Courses c ON e.course_id = c.course_id
left join Payments p ON e.student_id = p.student_id
group by e.student_id, e.course_id, c.course_name;

---5 10

select student_id, first_name, last_name
from Students
where student_id IN (
select student_id
from Payments
group by student_id
having count(payment_id) > 1
 );

---5 11

select s.student_id, s.first_name, s.last_name,
sum(p.amount) as total_payments
from Students s
left join Payments p ON s.student_id = p.student_id
group by s.student_id, s.first_name, s.last_name;

---5 12

select c.course_name,
(
select count(*)
from Enrollments e
where e.course_id = c.course_id
) as enrollment_count
from Courses c;

---5 13

select student_id, first_name, last_name,
( select avg(amount)
from Payments
where student_id = s.student_id
) as average_payment_amount
from Students s;


















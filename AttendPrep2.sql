create table Teacher ( 
    ID number(8) not null, 
    fname varchar2(20), 
    mname varchar2(20), 
    lname varchar2(20), 
    email varchar2(30) unique not null, 
    password varchar2(30) not null,   
constraint Teacher_pk primary key (ID) )  ;

create table Student ( 
    ID number(7) not null, 
    fname varchar2(20), 
    mname varchar2(20), 
    lname varchar2(20), 
    email varchar2(30) unique not null, 
    password varchar2(30) not null,   
constraint Student_pk primary key (ID) )  ;

create table Course ( 
    Code varchar2(10) not null, 
    name varchar2(20), 
    hours number(2), 
constraint Course_pk primary key (Code) )  ;

create table Class (  
    reference_number number(10) not null,  
    name varchar2(4),  
    Start_Time varchar2(6),  
    days varchar2(10),  
    Course_Code varchar2(10) not null,  
    Teacher_id number(8) not null,  
constraint Class_pk primary key (reference_number) )  ;

create table Attendance (   
    ID number(10) not null,   
    Attendance_Date date,   
    Statue varchar2(10),   
    Class_RN number(10) not null,  
constraint Attendance_pk primary key (ID) );

create table takes (  
    Class_RN number(10) not null,   
    Student_ID number(8) not null,  
constraint takes_pk primary key (Class_RN, Student_ID) );

create table Attend (  
    attendance_id number(10) not null,   
    Student_ID number(8) not null,  
constraint Attend_pk primary key (attendance_id, Student_ID) );

alter table Class 
Add constraint ClassCourseCode_fk foreign key(Course_Code) references Course(Code) on  
delete cascade ;

alter table Class 
Add constraint ClassTeacherID_fk foreign key(Teacher_id) references Teacher(ID) on  
delete cascade ;

alter table Attendance 
Add constraint AttendanceClassRN_fk foreign key(Class_RN) references Class(reference_number) on  
delete cascade ;

alter table takes 
Add constraint takesClassRN_fk foreign key(Class_RN) references Class(reference_number) on  
delete cascade ;

alter table takes 
Add constraint takesStudentID_fk foreign key(Student_ID) references Student(ID) on  
delete cascade ;


create database erp;

use erp;

create table department(
    departmentCode varchar(255),
    department varchar(255),
    constraint pk1 primary key(department)
);

create table subject(
    subjectCode varchar(255),
    subjectName varchar(255),
    totalLectures int,
    year int,
    department varchar(255),
    constraint pk2 primary key(subjectCode),
    constraint fk1 foreign key(department) references department(department)
);

create table admin(
    name varchar(255),
    email varchar(255),
    password varchar(255),
    username varchar(255),
    department varchar(255),
    dob date,
    joiningYear int,
    avatar varchar(10000),
    contactNumber bigint,
    passwordUpdated tinyint,
    constraint pk3 primary key(username),
    constraint fk2 foreign key(department) references department(department) on delete
    set
        null on update cascade
);

create table faculty(
    name varchar(255),
    email varchar(255),
    contactNumber bigint,
    avatar varchar(10000),
    username varchar(255),
    password varchar(255),
    gender varchar(255),
    designation varchar(255),
    department varchar(255),
    dob date,
    joiningYear int,
    passwordUpdated tinyint,
    constraint pk4 primary key(username),
    constraint fk3 foreign key(department) references department(department)
);

create table student(
    email varchar(255),
    phone bigint,
    id int,
    name varchar(255),
    avatar varchar(10000),
    password varchar(255),
    year int,
    username varchar(255) unique,
    gender varchar(255),
    fatherName varchar(255),
    motherName varchar(255),
    department varchar(255),
    section varchar(45),
    batch varchar(45),
    dob date,
    motherContactNumber bigint,
    fatherContactNumber bigint,
    passwordUpdated tinyint,
    constraint pk5 primary key(id),
    constraint fk4 foreign key (department) references department(department)
);

create table attendance(
    sid int,
    subCode varchar(255),
    lecAttended int,
    constraint pk6 primary key (sid, subCode),
    constraint fk5 foreign key(sid) references student(id),
    constraint fk6 foreign key(subCode) references subject(subjectCode)
);

create table test(
    test varchar(255),
    subjectCode varchar(255),
    department varchar(255),
    totalMarks int default 10,
    year int,
    section varchar(45),
    date date,
    constraint pk7 primary key(testId),
    constraint fk7 foreign key (subjectCode) references subject(subjectCode),
    constraint fk8 foreign key (department) references department(department)
);

create table marks(
    marks int,
    id int,
    studentId int,
    testId varchar(255),
    constraint pk8 primary key(id),
    constraint fk9 foreign key (studentId) references student(id),
    constraint fk10 foreign key (testId) references test(test)
);

create table notice(
    topic varchar(255),
    date date,
    content varchar(255),
    noticeFrom varchar(255),
    noticeFor varchar(255),
    constraint pk9 primary key(topic, date, content)
);
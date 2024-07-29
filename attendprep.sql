CREATE TABLE UserRole (
    Role_ID INT PRIMARY KEY,
    Role_Name VARCHAR(255)
);

CREATE TABLE User (
    User_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255),
    Role_ID INT,
    Barcode VARCHAR(255),
    FOREIGN KEY (Role_ID) REFERENCES UserRole(Role_ID)
);

CREATE TABLE Course (
    Course_Code INT PRIMARY KEY,
    Name VARCHAR(255),
    Hours INT
);

CREATE TABLE Class (
    Class_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Course_Code INT,
    Teacher_ID INT,
    Time DATETIME,
    Barcode VARCHAR(255),
    FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code),
    FOREIGN KEY (Teacher_ID) REFERENCES User(User_ID)
);

CREATE TABLE Attendance (
    Attendance_ID INT PRIMARY KEY,
    Date DATE,
    Status VARCHAR(255),
    User_ID INT,
    Class_ID INT,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    FOREIGN KEY (Class_ID) REFERENCES Class(Class_ID)
);

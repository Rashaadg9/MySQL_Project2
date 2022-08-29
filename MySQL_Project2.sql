DROP DATABASE IF EXISTS MySQL_Project2;
CREATE DATABASE MySQL_Project2;
USE MySQL_Project2;

CREATE TABLE EmployeeInfo
(
	EmpID INT AUTO_INCREMENT,
    EmpFname VARCHAR(30),
    EmpLname VARCHAR(30),
    Department VARCHAR(30),
    Project VARCHAR(2),
    Address VARCHAR(30),
    DOB DATE,
    Gender VARCHAR(1),
    PRIMARY KEY (EmpID)
);

CREATE TABLE EmployeePosition
(
	EmpID INT,
    EmpPosition VARCHAR(30),
    DateOfJoining DATE,
    Salary INT,
    PRIMARY KEY (EmpID, EmpPosition),
    FOREIGN KEY (EmpID) REFERENCES EmployeeInfo(EmpID)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

INSERT INTO EmployeeInfo VALUES(null, "Sanjay", "Mehra", "HR", "P1", "Hyderabad(HYD)", "1976-01-12", 'M');
INSERT INTO EmployeeInfo VALUES(null, "Ananya", "Mishra", "Admin", "P2", "Delhi(DEL)", "1968-02-05", 'F');
INSERT INTO EmployeeInfo VALUES(null, "Rohan", "Diwan", "Account", "P3", "Mumbai(BOM)", "1980-01-01", 'M');
INSERT INTO EmployeeInfo VALUES(null, "Sonia", "Kulkarni", "HR", "P1", "Hyderabad(HYD)", "1992-02-05", 'F');
INSERT INTO EmployeeInfo VALUES(null, "Ankit", "Kapoor", "Admin", "P2", "Delhi(DEL)", "1994-03-07", 'M');

INSERT INTO EmployeePosition VALUES(1, "Manager", "2022-01-05", 500000);
INSERT INTO EmployeePosition VALUES(2, "Executive", "2022-02-05", 75000);
INSERT INTO EmployeePosition VALUES(3, "Manager", "2022-01-05", 90000);
INSERT INTO EmployeePosition VALUES(2, "Lead", "2022-02-05", 85000);
INSERT INTO EmployeePosition VALUES(1, "Executive", "2022-01-05", 300000);

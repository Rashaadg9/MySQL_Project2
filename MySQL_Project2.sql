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

/* 1. Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use
the ALIAS name as EmpName.*/

SELECT UPPER(EmpFname) AS EmpName FROM EmployeeInfo;

/* 2. Write a query to fetch the number of employees working in the department ‘HR’.*/

SELECT COUNT(*) FROM EmployeeInfo WHERE Department = "HR";

/* 3. Write a query to get the current date.*/

SELECT CURDATE();

/*4. Write a query to retrieve the first four characters of EmpLname from the EmployeeInfo table.*/

SELECT EmpLname, SUBSTRING(EmpLname, 1, 4) FROM EmployeeInfo;
/* ALTERNATE ANS --> SELECT EmpLname, LEFT(EmpLname, 4) FROM EmployeeInfo; */

/* 5. Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table. */

SELECT SUBSTRING_INDEX(Address, '(', 1) FROM EmployeeInfo;

/* 6. Write a query to create a new table that consists of data and structure copied from the other table.*/

CREATE TABLE New_EmployeeInfo AS (SELECT * FROM EmployeeInfo);

SELECT * FROM New_EmployeeInfo;
DROP TABLE New_EmployeeInfo;

/* 7. Write a query to find all the employees whose salary is between 50000 to 100000. */

SELECT EmployeeInfo.EmpID, EmployeeInfo.EmpFname, SUM(EmployeePosition.Salary) AS Total_Salary
FROM EmployeeInfo
INNER JOIN EmployeePosition ON EmployeeInfo.EmpID=EmployeePosition.EmpID
GROUP BY EmpID
HAVING SUM(EmployeePosition.Salary) BETWEEN 50000 AND 100000;

/* 8. Write a query to find the names of employees that begin with ‘S’ */

SELECT EmpFname FROM EmployeeInfo WHERE EmpFname LIKE "S%";

/* 9. Write a query to fetch top N records */

-- TODO

/* 10. Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The
first name and the last name must be separated with space. */

SELECT CONCAT(EmpFname, ' ', EmpLname) AS FullName FROM EmployeeInfo;

/* 11. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975
and are grouped according to gender. */

SELECT * FROM EmployeeInfo WHERE DOB BETWEEN "1970-02-05" AND "1975-12-31" ORDER BY (Gender);

-- INSERT INTO EmployeeInfo VALUES(null, "Ankit", "TESTr", "test", "P2", "Delhi(DEL)", "1971-03-07", 'M');
-- INSERT INTO EmployeeInfo VALUES(null, "Ank2", "TESTr2", "test2", "P2", "Delhi(DEL)", "1973-03-07", 'F');
-- INSERT INTO EmployeeInfo VALUES(null, "An3", "TEST3", "test3", "P2", "Delhi(DEL)", "1974-03-07", 'M');
-- INSERT INTO EmployeeInfo VALUES(null, "An4", "TE4", "t42", "P2", "Delhi(DEL)", "1975-03-07", 'F');

/* 12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in
descending order and Department in the ascending order. */

SELECT * FROM EmployeeInfo ORDER BY Department ASC, EmpLname DESC;

/* 13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and
contains five alphabets. */

SELECT * FROM EmployeeInfo WHERE EmpLname REGEXP "^....A$";
/* ALTERNATE ANS --> SELECT * FROM EmployeeInfo WHERE EmpLname LIKE "____A"; */
/* ALTERNATE ANS --> SELECT * FROM EmployeeInfo WHERE EmpLname LIKE "%A" AND LENGTH(EmpLname) = 5; */

/* 14. Write a query to fetch details of all employees excluding the employees with first names,
“Sanjay” and “Sonia” from the EmployeeInfo table. */

SELECT * FROM EmployeeInfo WHERE NOT (EmpFname = "Sanjay" OR EmpFname = "Sonia");
 
/* 15. Write a query to fetch details of employees with the address as “DELHI(DEL)”. */
 
SELECT * FROM EmployeeInfo WHERE Address = "DELHI(DEL)";
  
/* 16. Write a query to fetch all employees who also hold the managerial position. */

SELECT EmployeeInfo.EmpID, EmployeeInfo.EmpFname, EmployeeInfo.EmpLname, EmployeePosition.EmpPosition
 FROM EmployeeInfo
 INNER JOIN EmployeePosition ON EmployeeInfo.EmpID=EmployeePosition.EmpID
 WHERE EmployeePosition.EmpPosition = "Manager";

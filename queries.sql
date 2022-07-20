--access mysql

mysql -u root -p

--crud operations

-- show database
SHOW DATABASES;

--create database
CREATE DATABASE prodapt_database;

--use database
USE prodapt_database;

--show tables / LIST TABLES
SHOW TABLES;

--create table
--VARCHAR(M) , length of varchar = 1 to 255

CREATE TABLE course_list(
    course_id INT NOT NULL AUTO_INCREMENT,
    course_title VARCHAR(69) NOT NULL,
    course_author VARCHAR(69) NOT NULL,
    course_date DATE,
    PRIMARY KEY(course_id)
);

CREATE TABLE employee_list(
    employee_id INT NOT NULL AUTO_INCREMENT,
    employee_name VARCHAR(69) NOT NULL,
    employee_profession VARCHAR(69) NOT NULL,
    employee_dateOfJoining DATE,
    PRIMARY KEY(employee_id)
);

--drop table
DROP TABLE course_list;

--insert one record data into table
INSERT INTO course_list(course_title, course_author, course_date) VALUES ("Java", "Shady", NOW());

--insert one record data into table
INSERT INTO course_list(course_title, course_author, course_date) 
    VALUES
    ("Java", "Shady", NOW()),
    ("Angular", "Shady", NOW()),
    ("API", "Shady", NOW());

INSERT INTO employee_list(employee_name, employee_profession, employee_dateOfJoining) 
    VALUES
    ("Shady", "ASE", NOW()),
    ("Eminem", "SE", NOW()),
    ("Marshal", "SSE", NOW());

-- Select data from DB
SELECT * FROM course_list;
SELECT course_title FROM course_list;

SELECT CONCAT("Apoorv ","Negi") AS "FULLNAME";

-- UPDATE records in the table
UPDATE course_list SET course_title="API-Testing" WHERE course_id=4;

--DELETE QUERY
DELETE FROM course_list WHERE course_id=4;

SELECT * FROM employee_list;
SELECT employee_name FROM employee_list;
UPDATE employee_list SET employee_name="Mathers" WHERE employee_id=3;
DELETE FROM employee_list WHERE employee_id=3;

-- rename table
RENAME TABLE old_table_name TO new_table_name

ALTER TABLE course_list RENAME TO new_table_name

RENAME TABLE course_list TO another_course

--alter tables
    --drop columns
    --add columns

--ALTER TABLE table_name
--ADD
--   new_column_name column_definition

ALTER TABLE course_list
ADD
   course_score VARCHAR(100) NOT NULL;

--FOR MULTIPLE COLUMNS
ALTER TABLE course_list
ADD course_score VARCHAR(100) NOT NULL;
ADD course_score_TWO VARCHAR(100) NOT NULL;

--DESCRIBE table
DESCRIBE table_name

--modify column type
ALTER TABLE course_list
    MODIFY course_score_TWO VARCHAR(50) NOT NULL,
    MODIFY course_title VARCHAR(59) NOT NULL;

--rename column name
ALTER TABLE course_list
    CHANGE COLUMN old_COLUMN_name  new_column_name INT NOT NULL;

ALTER TABLE course_list
    CHANGE COLUMN course_score_TWO  course_status INT NOT NULL;

--DELETE column
ALTER TABLE course_list
    DROP COLUMN column_name

--Relationships
--Foreign key relationships

CREATE TABLE orders(
    orderId INT NOT NULL,
    orderNo INT NOT NULL,
    empId INT,
    PRIMARY KEY(orderId),
    CONSTRAINT FK_EmployeOrder FOREIGN KEY(empId) REFERENCES employee_list(employee_id)
);

CREATE TABLE Project(
    projectId INT NOT NULL,
    projectDetail VARCHAR NOT NULL,
    empId INT,
    PRIMARY KEY(projectId),
    FOREIGN KEY(empId) REFERENCES employee_list(employee_id)
);

--alter foreign key
ALTER TABLE orders
    ADD CONSTRAINT FK_EmployeOrder FOREIGN KEY(empId) REFERENCES employee_list(employee_id);

--DROP FOREIGN KEY
ALTER TABLE orders
    DROP CONSTRAINT FK_EmployeOrder;

--import existing DB
--inside mysql terminal
source_path/mysql_file_name

--column alias
-- SELECT expression AS column_alias
SELECT CONCAT("Apoorv ","Negi") AS fullName;

--sort queries
SELECT
    filed_names
FROM
    table_name
ORDER BY
    column1 [asc|desc],
    column2 [asc|desc],
    ....;



--user customer table to practice sort

--ORDER BY lastname

SELECT
    contactLastName,
    contactFirstName
FROM
    customers
ORDER BY
    contactLastName;

SELECT
    contactLastName,
    contactFirstName
FROM
    customers
ORDER BY
    contactLastName DESC,
    contactFirstName ASC;


SELECT
    jobTitle
FROM
    customers
ORDER BY
    jobTitle;
    
--------ORDERDETAILS TABLE-----------
SELECT
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER BY
    quantityOrdered * priceEach DESC;

SELECT
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY
    subtotal DESC;


-- status
    -- In Process
    -- On Hold
    -- Cancelled
    -- Resolved
    -- Disputed
    -- Shipped

SELECT
    orderNumber, status
FROM
    orders
ORDER BY FIELD(status,
    "In Process"
    "On Hold"
    "Cancelled"
    "Resolved"
    "Disputed"
    "Shipped"
);

SELECT
    firstName,
    lastName,
    reportsTo
FROM
    employees
ORDER BY
    reportsTo;

SELECT
    firstName,
    lastName,
    reportsTo
FROM
    employees
ORDER BY
    reportsTo DESC;

-- --------filtering data--------
-- WHERE
-- SELECT DISTINCT
-- AND
-- OR
-- IN
-- NOT IN
-- BETWEEN
-- LIMIT
-- IS NULL

-- FROM -> WHERE -> SELECT -> ORDER BY

SELECT
    firstName,
    lastName,
    jobTitle
FROM
    employees
WHERE
    jobTitle="Sales Rep";


SELECT
    firstName,
    lastName,
    jobTitle
FROM
    employees
WHERE
    jobTitle="Sales Rep" AND
    officeCode = 1;


SELECT
    firstName,
    lastName,
    jobTitle
FROM
    employees
WHERE
    jobTitle="Sales Rep" OR
    officeCode = 1;
---------
SELECT
    firstName,
    lastName,
    jobTitle
    officeCode
FROM
    employees
WHERE
    jobTitle="Sales Rep" OR
    officeCode = 1
ORDER BY
    officeCode,
    jobTitle;
---------

SELECT
    firstName,
    lastName,
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 2 AND 6
ORDER BY officeCode;
------------

-- LIKE clause

SELECT
    firstName,
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY
    firstName;

"Tho%"
'%son'
'%att%'
"_r%"
"a_%"
"a__%"
't%n'

----IN operator


SELECT
    firstName,
    lastName,
    officeCode
FROM
    employees
WHERE
    officeCode IN (1,2,3)
ORDER BY
    officeCode;















































    
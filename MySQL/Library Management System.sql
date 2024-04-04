CREATE DATABASE library;

USE library;


# create table Branch
CREATE TABLE Branch ( 
	Branch_no INT PRIMARY KEY,
	Manager_Id INT,
	Branch_address VARCHAR (100),
	Contact_no BIGINT 
);

INSERT INTO Branch (Branch_no,Manager_Id,Branch_address,Contact_no) VALUES

	(1, 201, '12, MG Road, Kochi, Kerala', 919876543210),
	(2, 202, '23, High Court Road, Thiruvananthapuram, Kerala', 918765432109),
	(3, 203, '34, Beach Road, Kozhikode, Kerala', 917654321098),
	(4, 204, '45, Civil Lines, Thrissur, Kerala', 916543210987),
	(5, 205, '56, Railway Station Road, Kannur, Kerala', 915432109876),
	(6, 206, '67, Airport Road, Alappuzha, Kerala', 914321098765),
	(7, 207, '78, Kottayam Road, Malappuram, Kerala', 913210987654),
	(8, 208, '89, Kollam Bypass, Palakkad, Kerala', 912109876543),
	(9, 209, '90, Wayanad Road, Pathanamthitta, Kerala', 911098765432),
	(10, 210, '101, Munnar Bazaar, Idukki, Kerala', 910987654321);

SELECT * FROM Branch;


# create table Employee
CREATE TABLE Employee (
	Emp_Id INT PRIMARY KEY,
	Emp_name VARCHAR (50),
	Position VARCHAR (50),
	Salary DECIMAL(10, 2),
	Branch_no INT,             # Set as FOREIGN KEY and it should refer branch_no in EMPLOYEE table
	FOREIGN KEY (Branch_no) REFERENCES Branch (Branch_no)
);

INSERT INTO Employee (Emp_Id,Emp_name,Position,Salary,Branch_no) VALUES

	(101, 'John Doe', 'Manager', 60000,1),
    (102, 'Jane Smith', 'Assistant Manager', 50000,1),
    (103, 'Michael Johnson', 'Clerk', 40000,4),
    (104, 'Emily Brown', 'Manager', 55000,3),
    (105, 'David Wilson', 'Accountant', 45000,8),
    (106, 'Sarah Taylor', 'Clerk', 42000,9),
    (107, 'Daniel Lee', 'Customer Service Representative', 38000,3),
    (108, 'Rachel Martinez', 'Clerk', 48000,5),
    (109, 'Christopher Davis', 'Manager', 52000,8),
    (110, 'Amanda Rodriguez', 'Administrative Assistant', 36000,10);

SELECT * FROM Employee;


# create table Customer
CREATE TABLE Customer (
	Customer_Id INT PRIMARY KEY,
	Customer_name VARCHAR (50),
	Customer_address VARCHAR (100),
	Reg_date DATE
);

INSERT INTO Customer (Customer_Id,Customer_name,Customer_address,Reg_date) VALUES

	(301, 'Alice', 'Kochi', '2019-01-10'),
    (302, 'Bob', 'Kozhikode', '2024-03-02'),
    (303, 'Charlie', 'Thiruvananthapuram', '2024-04-03'),
    (304, 'David', 'Thrissur', '2020-08-23'),
    (305, 'Emily', 'Kannur', '2024-02-05'),
    (306, 'Frank', 'Alappuzha', '2021-10-03'),
    (307, 'Grace', 'Malappuram', '2023-10-07'),
    (308, 'Henry', 'Palakkad', '2023-06-08'),
    (309, 'Isabella', 'Pathanamthitta', '2023-02-09'),
    (310, 'Jack', 'Idukki', '2021-03-10');

SELECT * FROM Customer;


# create table IssueStatus
CREATE TABLE IssueStatus (
	Issue_Id INT PRIMARY KEY,
	Issued_cust INT,                 #  Set as FOREIGN KEY and it refer customer_id in CUSTOMER table
	Issued_book_name VARCHAR (100),
	Issue_date DATE,
	Isbn_book INT,                   # Set as FOREIGN KEY and it should refer isbn in BOOKS table
	FOREIGN KEY (Issued_cust) REFERENCES Customer (Customer_Id),
	FOREIGN KEY (Isbn_book) REFERENCES Books(isbn)
);

INSERT INTO IssueStatus (Issue_Id,Issued_cust,Issued_book_name,Issue_date,Isbn_book) VALUES

	(401,301,'The Ivory Throne: Chronicles of the House of Travancore','2023-06-12',3),
    (402,302,'God of Small Things','2024-03-20',1),
    (403,303,'The God of Small Things','2024-04-15',2),
    (404,304,'Kerala: A Vision of Paradise','2024-01-08',4),
    (405,305,'Chemmeen','2024-02-11',6),
    (406,305,'One Part Woman','2024-03-02',8),
    (407,307,'The God Who Failed: An Anthology of Essays','2023-11-22',9),
    (408,307,'Sita','2023-12-10',10),
    (409,309,'Anthology of Essays','2024-02-16',11),
    (410,310,'Sitased','2024-03-01',12);

SELECT * FROM IssueStatus;
  
  
# create table ReturnStatus
CREATE TABLE ReturnStatus (
	Return_Id INT PRIMARY KEY,
	Return_cust INT,
	Return_book_name VARCHAR(100),
	Return_date DATE,
	Isbn_book2 INT,                  # Set as FOREIGN KEY and it should refer isbn in BOOKS table
	FOREIGN KEY (Isbn_book2) REFERENCES Books(isbn)
);

INSERT INTO ReturnStatus (Return_Id,Return_cust,Return_book_name,Return_date,Isbn_book2) VALUES

	(1001,301,'The Ivory Throne: Chronicles of the House of Travancore','2024-02-20',3),
    (1002,302,'God of Small Things','2024-03-28',1),
    (1003,303,'The God of Small Things','2024-04-18',2),
    (1004,304,'Kerala: A Vision of Paradise','2024-03-15',4),
    (1005,305,'Chemmeen','2024-02-19',6),
    (1006,305,'One Part Woman','2024-03-14',8),
    (1007,307,'The God Who Failed: An Anthology of Essays','2024-01-22',9),
    (1008,307,'Sita','2024-02-8',10),
    (1009,309,'Anthology of Essays','2024-02-28',11),
    (1010,310,'Sitased','2024-03-09',12);

SELECT * FROM ReturnStatus;


# create table Books
CREATE TABLE Books (
	ISBN INT PRIMARY KEY,
	Book_title VARCHAR (100),
	Category VARCHAR (50),
	Rental_Price DECIMAL(10, 2),
	Status VARCHAR(10),            # [Give yes if book available and no if book not available]
	Author VARCHAR (50),
	Publisher VARCHAR (50)
);

INSERT INTO Books (ISBN,Book_title,Category,Rental_Price,Status,Author,Publisher) VALUES

	(1, 'God of Small Things', 'Fiction', 50.00, 'Yes', 'Arundhati Roy', 'Random House'),
    (2, 'The God of Small Things', 'Fiction', 55.00, 'Yes', 'Arundhati Roy', 'Viking Press'),
    (3, 'The Ivory Throne: Chronicles of the House of Travancore', 'History', 45.00, 'Yes', 'Manu S. Pillai', 'HarperCollins'),
    (4, 'Kerala: A Vision of Paradise', 'Travel', 40.00, 'Yes', 'Anita Nair', 'Penguin Books'),
    (5, 'My Story', 'Autobiography', 60.00, 'No', 'Kamala Das', 'DC Books'),
    (6, 'Chemmeen', 'Fiction', 50.00, 'Yes', 'Thakazhi Sivasankara Pillai', 'DC Books'),
    (7, 'The Legends of Khasak', 'Fiction', 55.00, 'No', 'O. V. Vijayan', 'Penguin Books'),
    (8, 'One Part Woman', 'Fiction', 45.00, 'Yes', 'Perumal Murugan', 'Penguin Books'),
    (9, 'The God Who Failed: An Anthology of Essays', 'Non-fiction', 40.00, 'Yes', 'Arundhati Roy', 'Penguin Books'),
    (10, 'Sita', 'Mythology', 60.00, 'Yes', 'Devdutt Pattanaik', 'Penguin Books'),
	(11, 'Anthology of Essays', 'Non-fiction', 60.00, 'Yes', 'Roy', 'Penguin Books'),
    (12, 'Sitased', 'Mythology', 70.00, 'Yes', 'Devdutt', 'Penguin Books');
    
SELECT * FROM Books;



# Retrieve the book title, category, and rental price of all available books.
SELECT Book_title,Category,Rental_Price FROM Books WHERE Status = 'Yes';

# List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name,Salary FROM Employee ORDER BY Salary DESC;

# Retrieve the book titles and the corresponding customers who have issued those books.
SELECT I.Issued_book_name,C.Customer_name FROM IssueStatus AS I INNER JOIN Customer AS C ON I.Issued_cust=C.Customer_Id;

# Display the total count of books in each category.
SELECT category,COUNT(*) AS TOTAL_BOOKS FROM Books GROUP BY category;

# Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name,Position,Salary FROM Employee WHERE Salary > 50000;

# List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name,Reg_date FROM customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

# Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no ,COUNT(*) AS Total_Employees FROM employee GROUP BY Branch_no;

# Display the names of customers who have issued books in the month of June 2023.
SELECT Customer_name FROM Customer WHERE Customer_Id IN (SELECT Issued_cust FROM IssueStatus WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) =2023);

# Retrieve book_title from book table containing history. 
SELECT Book_title,Category FROM  Books WHERE Category = 'History';

# Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(Emp_name) AS Total_Employee FROM Employee GROUP BY Branch_no HAVING Total_Employee>5;

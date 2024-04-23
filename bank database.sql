 -- Bank System Management project // 01
	-- hierarchy DB > Table (schema) >columns

SET FOREIGN_KEY_CHECKS=0;
	-- allows to change FK values and avoid parent child connection error
        
DROP DATABASE IF EXISTS customer_mgmt;
CREATE DATABASE customer_mgmt;
USE customer_mgmt;

CREATE TABLE customer(
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    address VARCHAR(50) DEFAULT NULL,
    phone_number VARCHAR(20) DEFAULT NULL,
    email VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (customer_id));

INSERT INTO customer (customer_id, first_name, last_name, address, phone_number, email)
VALUES 
    (3, 'Michael', 'Johnson', NULL, '123456789', 'mj@example.com'),
    (2, 'Sarah', 'Anderson', '123 Oak St', NULL, 'sa@example.com'),
    (1, 'David', 'Williams', NULL, NULL, 'dw@example.com'),
    (4, 'Emily', 'Miller', '456 Pine St', NULL, NULL),
    (6, 'Jessica', 'Wilson', '789 Elm St', NULL, NULL),
    (5, 'Brian', 'Brown', NULL, '987654321', NULL),
    (7, 'Rachel', 'Garcia', NULL, NULL, NULL),
    (8, 'Andrew', 'Martinez', '321 Birch St', '555555555', 'am@example.com'),
    (9, 'Olivia', 'Lopez', '654 Cedar St', NULL, NULL),
    (10, 'Daniel', 'Hernandez', '987 Maple St', NULL, NULL),
    (13, 'Sophia', 'Gonzalez', NULL, NULL, 'sg@example.com'),
    (12, 'James', 'Rodriguez', NULL, '111111111', NULL),
    (11, 'Ava', 'Perez', '222 Oak St', NULL, NULL),
    (14, 'Matthew', 'Torres', '333 Pine St', NULL, NULL),
    (15, 'Grace', 'Flores', NULL, NULL, NULL),
    (19, 'William', 'Nguyen', '444 Elm St', '999999999', NULL),
    (20, 'Charlotte', 'Kim', NULL, NULL, NULL),
    (18, 'Ethan', 'Singh', NULL, '777777777', 'es@example.com'),
    (16, 'Amelia', 'Patel', '555 Birch St', NULL, NULL),
    (17, 'Benjamin', 'Lee', '666 Cedar St', NULL, NULL);
    
CREATE TABLE accounts (
    account_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    balance DECIMAL (15,2) DEFAULT NULL,
    open_date DATE DEFAULT NULL,
    status VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY (account_id),
	CONSTRAINT FK_customer_id_1 FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE RESTRICT ON UPDATE CASCADE);

	-- INSERT INTO for accounts
INSERT INTO accounts (account_id, customer_id, account_type, balance, open_date, status)
VALUES 
    (105, 5, 'Checking', 1200.00, '2023-03-01', 'Active'),
    (111, 11, 'Savings', 26000.01, '2023-08-04', NULL),
    (119, 19, 'Loan', 9800000.03, '2023-11-21', 'Deactivate'),
    (120, 20, 'Investment', 150000.00, NULL, 'Active'),
    (117, 7, 'Checking', 5000.00, '2023-05-18', 'Active'),
    (108, 8, 'Savings', 23000.01, '2023-06-12', 'Active'),
    (113, 13, 'Checking', 4500.11, '2023-09-02', 'Active'),
    (116, 16, 'Savings', 32000.02, '2023-10-09', NULL),
    (103, 3, 'Investment', 80000.03, '2023-02-28', 'Active'),
    (107, 17, 'Checking', 7000.30, NULL, 'Deactivate'),
    (102, 2, 'Savings', 18000.54, '2023-01-25', 'Active'),
    (106, 6, 'Checking', 3000.67, '2023-04-12', 'Active'),
    (109, 9, 'Investment', 120000.84, '2023-07-01', 'Active'),
    (115, 15, 'Savings', 45000.78, '2023-09-25', 'Active'),
    (118, 18, 'Checking', 50000.75, '2023-10-31', NULL),
    (104, 4, 'Savings', 3000.54, NULL, 'Deactivate'),
    (112, 12, 'Investment', 200000.73, '2023-08-20', 'Active'),
    (110, 10, 'Checking', 700.45, '2023-06-29', 'Active'),
    (114, 14, 'Savings', 28000.21, '2023-09-09', 'Active'),
    (101, 1, 'Investment', 50000.84, '2023-01-15', 'Active');

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT NOT NULL,
    account_id INT (6) NOT NULL,
    transaction VARCHAR (20) NOT NULL,
    amount DECIMAL (15,2) DEFAULT NULL,
    transaction_date DATE DEFAULT NULL,
    PRIMARY KEY (transaction_id),
    CONSTRAINT FK_account_id FOREIGN KEY (account_id) REFERENCES accounts (account_id) ON DELETE RESTRICT ON UPDATE CASCADE);

INSERT INTO transactions (account_id,transaction,amount,transaction_date)
VALUES
	(107, 'deposit', 100.00, NULL),
    (105, 'withdraw', 80.00, '2024-01-01'),
    (107, 'deposit', 100.00, NULL),
    (105, 'withdraw', 80.00, '2024-01-01'),
    (102, 'transfer', 250.00, '2024-02-15'),
    (110, 'withdraw', 300.00, NULL),
    (118, 'deposit', 150.00, '2024-04-10'),
    (114, 'transfer', 400.00, '2024-06-20'),
    (109, 'withdraw', NULL, '2024-07-05'),
    (116, 'deposit', 200.00, NULL),
    (112, 'transfer', 180.00, NULL),
    (120, 'deposit', 90.00, '2024-09-18'),
    (108, 'transfer', NULL, '2024-10-22'),
    (111, 'withdraw', 70.00, '2024-12-31'),
    (103, 'transfer', 420.00, '2024-11-11'),
    (107, 'deposit', NULL, NULL),
    (190, 'withdraw', 110.00, '2024-08-14'),
    (101, 'deposit', 320.00, NULL),
    (106, 'transfer', 260.00, '2024-03-08'),
    (103, 'withdraw', 180.00, '2024-10-01'),
    (105, 'deposit', NULL, '2024-12-25'),
    (104, 'transfer', 350.00, NULL),
    (200, 'deposit', 80.00, '2024-05-20'),
    (105, 'withdraw', 200.00, '2024-06-30'),
    (118, 'deposit', NULL, NULL),
    (112, 'transfer', 290.00, '2024-08-10'),
    (109, 'withdraw', 140.00, '2024-09-28'),
    (107, 'deposit', 60.00, '2024-07-12'),
    (101, 'transfer', 400.00, '2024-11-25');


DROP DATABASE IF EXISTS emp_branch_mgmt;
CREATE DATABASE emp_branch_mgmt;
USE emp_branch_mgmt;

CREATE TABLE employees (
	employee_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR (20) NOT NULL,
    last_name VARCHAR (20) DEFAULT NULL,
    position VARCHAR (20) DEFAULT NULL,
    department VARCHAR(30) DEFAULT NULL,
    manager_id INT DEFAULT NULL,
    PRIMARY KEY (employee_id));
    
INSERT INTO employees (employee_id, first_name, last_name, position, department,manager_id)
VALUES 
    (220, 'Warren', 'Buffet', 'Manager', 'Bank of America',220),
    (221, 'John', 'Smith', 'Teller', 'Chase Bank',NULL),
    (222, 'Emily', 'Johnson', 'Analyst', 'Bank of America',NULL),
    (223, 'Michael', 'Williams', 'Customer Service', 'Rothschild',NULL),
    (230, 'Jamie ', 'Dimon', 'Manager', 'Chase Bank',230),
    (224, 'Sophia', 'Brown', 'Loan Officer', 'Blackrock',NULL),
    (225, 'Daniel', 'Davis', 'Accountant', 'Bank of America',NULL),
    (226, 'Emma', 'Miller', 'Auditor', 'Chase Bank',NULL),
    (240, 'Larry', 'Fink', 'Manager', 'Blackrock',240),
    (227, 'William', 'Wilson', 'Financial Analyst', 'Bank of America',NULL),
    (228, 'Olivia', 'Jones', 'Customer Support', 'Rothschild',NULL),
    (229, 'James', 'Garcia', 'Investment Advisor', 'Blackrock',NULL),
    (210, 'Jacob', 'Rothschild', 'Manager', 'Rothschild',210),
    (231, 'Ava', 'Martinez', 'Risk Analyst', 'Bank of America',NULL);


CREATE TABLE branches (
    branch_id INT NOT NULL AUTO_INCREMENT,
    branch_name VARCHAR(20),
    location VARCHAR(20),
    manager_id INT NOT NULL,
    PRIMARY KEY (branch_id),
    CONSTRAINT FK_manager_id FOREIGN KEY (manager_id) REFERENCES employees (employee_id) ON DELETE RESTRICT ON UPDATE CASCADE);

INSERT INTO branches (branch_name, location, manager_id)
VALUES 
	('Black Rock', 'New Jersey', 240),
    ('Rotschild', 'London', 210),
    ('Bank of America', 'New York', 220),
    ('Chase Bank', 'New York', 230);
    
CREATE TABLE loans (
	loan_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    loan_amount DECIMAL (10,2) NOT NULL,
    interest_rate DECIMAL (5,2) DEFAULT NULL,
    start_date DATE DEFAULT NULL,
    end_date DATE DEFAULT NULL,
    status VARCHAR (10) DEFAULT NULL,
    PRIMARY KEY (loan_id),
	CONSTRAINT FK_customer_id_2 FOREIGN KEY (customer_id) REFERENCES customer_mgmt.customer (customer_id) ON DELETE RESTRICT ON UPDATE CASCADE);

INSERT INTO loans (customer_id, loan_amount, interest_rate, start_date, end_date, status)
VALUES
    (5, 300.55, 5.5, '2024-05-06', '2026-09-07', 'active'),
    (7, 250.30, 4.8, '2025-01-15', '2027-04-18', NULL),
    (10, 400.20, NULL, '2024-10-20', '2026-12-31', 'active'),
    (12, 180.75, 3.7, NULL, '2027-06-22', 'defaulted'),
    (3, 430.10, 5.0, '2024-07-12', NULL, 'active'),
    (15, 290.60, NULL, '2025-05-19', '2027-08-30', 'closed'),
    (8, 150.45, 6.0, '2024-11-30', '2027-02-03', 'defaulted'),
    (4, 380.80, 5.8, NULL, '2027-05-15', 'active'),
    (20, 270.90, 4.3, '2024-08-06', NULL, 'closed'),
    (17, 220.15, 5.2, '2025-04-05', '2027-07-08', NULL),
    (9, 280.80, NULL, '2024-06-22', '2026-10-15', 'active'),
    (6, 195.25, 5.9, '2025-08-10', '2027-11-23', 'closed'),
    (13, 320.40, 6.5, NULL, '2027-01-01', 'defaulted'),
    (19, 470.70, 4.0, '2025-07-03', '2027-09-12', NULL),
    (18, 420.60, 5.3, '2024-12-12', '2027-03-30', 'closed'),
    (2, 390.95, 3.8, '2025-10-25', '2027-02-28', NULL),
    (16, 150.20, 4.9, NULL, '2026-06-10', 'active'),
    (11, 270.30, NULL, '2025-11-08', '2027-04-05', 'closed'),
    (14, 310.45, 6.1, '2024-04-12', NULL, 'defaulted'),
    (21, 180.60, 4.4, '2025-12-31', '2027-08-15', NULL);

DROP DATABASE IF EXISTS transcomp;
CREATE DATABASE transcomp;
USE transcomp;

CREATE TABLE audit_log (
	log_id INT NOT NULL,
    transaction_id INT NOT NULL,
    user_id INT NOT NULL,
    action_performed VARCHAR(50) DEFAULT NULL,
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (log_id),
    CONSTRAINT FK_transaction_id_1 FOREIGN KEY (transaction_id) REFERENCES customer_mgmt.transactions (transaction_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_user_id_1 FOREIGN KEY (user_id) REFERENCES employees (employee_id) ON DELETE RESTRICT ON UPDATE CASCADE);

INSERT INTO audit_log (log_id, transaction_id, user_id, action_performed, time_stamp)
VALUES 
	(409, 9, 229, 'Deposit made', '2024-10-30 21:30:00'),
    (405, 5, 225, 'Withdrawal made', '2024-06-10 17:30:00'),
    (401, 1, 221, 'Logged in', '2024-02-20 13:45:00'),
    (402, 2, 222, 'Account balance checked', '2024-03-25 14:15:00'),
    (406, 6, 226, 'Account created', '2024-07-15 18:45:00'),
    (408, 8, 228, 'Account closed', '2024-09-25 20:00:00'),
    (410, 13, 223, 'Transfer initiated', '2024-01-01 00:00:00'),
    (407, 7, 227, 'Account balance checked', '2024-08-20 19:10:00'),
    (404, 4, 224, 'Statement requested', '2024-05-05 16:20:00'),
    (400, 29, 231, 'Card activated', '2024-01-15 12:30:00'),
    (403, 3, 223, 'Payment received', '2024-04-30 15:00:00'),
    (414, 10, 229, 'Deposit made', '2024-11-05 22:45:00'),
    (412, 11, 221, NULL, '2023-11-11 22:00:00'),
    (411, 12, 222, 'Deposit made', '2023-12-12 23:00:00'),
    (413, 15, 225, NULL, '2024-03-03 02:00:00');

CREATE TABLE compliance_rec (
	record_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    description VARCHAR (50) DEFAULT NULL,
    compliance_status VARCHAR (50) DEFAULT NULL,
    submission_date DATE DEFAULT NULL,
    PRIMARY KEY (record_id),
	CONSTRAINT FK_customer_id_3 FOREIGN KEY (customer_id) REFERENCES customer_mgmt.customer (customer_id) ON DELETE RESTRICT ON UPDATE CASCADE);

INSERT INTO compliance_rec ( record_id,customer_id, description, compliance_status, submission_date)
VALUES  
	(625, 6, 'Quarterly compliance report', NULL, '2024-02-28'),
    (617, 18, NULL, 'Pending', '2024-02-20'),
    (605, 6, 'Quarterly review', NULL, '2024-02-07'),
    (600, 1, 'Regulatory assessment', 'Complete', '2024-01-02'),
    (601, 2, NULL, 'Incomplete', '2024-01-06'),
    (602, 3, 'Monthly compliance report', NULL, '2024-01-14'),
    (603, 4, 'Regulatory compliance check', NULL, '2024-01-22'),
    (604, 5, NULL, 'Pending', '2024-02-03'),
    (606, 7, 'Audit report', 'Pending', '2024-02-08'),
    (607, 8, 'Compliance evaluation', NULL, '2024-02-09'),
    (608, 9, 'Regulatory compliance check', NULL, '2024-02-10'),
    (609, 10, NULL, 'Pending', '2024-02-11'),
    (610, 11, NULL, NULL, '2024-02-12'),
    (611, 12, 'Annual audit', 'Complete', '2024-02-13'),
    (612, 13, NULL, NULL, '2024-02-15'),
    (613, 14, 'Monthly compliance check', 'Complete', '2024-02-16'),
    (614, 15, 'Regulatory audit', NULL, '2024-02-17'),
    (615, 16, NULL, 'Incomplete', '2024-02-18'),
    (616, 17, 'Quarterly certification', NULL, '2024-02-19'),
    (618, 19, 'Monthly audit', NULL, '2024-02-21'),
    (619, 20, 'Compliance checkup', NULL, '2024-02-22'),
    (620, 1, 'Random audit', NULL, '2024-02-23'),
    (621, 2, NULL, 'Complete', '2024-02-24'),
    (622, 3, 'Annual compliance check', 'Pending', '2024-02-25'),
    (623, 4, 'Regulatory review', NULL, '2024-02-26'),
    (624, 5, NULL, 'Incomplete', '2024-02-27'),
    (626, 7, 'Monthly assessment', 'Complete', '2024-02-29'),
    (627, 8, NULL, NULL, '2024-03-01'),
    (628, 9, 'Regulatory assessment', 'Pending', '2024-03-02'),
    (629, 10, 'Compliance review', NULL, '2024-03-03'),
    (630, 11, 'Annual report', 'Pending', '2024-03-04'),
    (631, 12, NULL, 'Complete', '2024-03-05'),
    (632, 13, 'Quarterly assessment', NULL, '2024-03-06'),
    (633, 14, 'Regulatory compliance check', NULL, '2024-03-07'),
    (634, 15, NULL, 'Incomplete', '2024-03-08'),
    (635, 16, 'Monthly review', NULL, '2024-03-09'),
    (636, 17, 'Compliance evaluation', 'Complete', '2024-03-10'),
    (637, 18, NULL, NULL, '2024-03-11'),
    (638, 19, 'Quarterly review', 'Pending', '2024-03-12'),
    (639, 20, 'Annual compliance check', NULL, '2024-03-13');

select * from compliance_rec;
    
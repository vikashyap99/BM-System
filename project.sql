create database project;
create schema project_schema;
SET SEARCH_PATH TO project_schema;
create table customer
	(
	cust_id char (10) NOT NULL,
	fname char(10) NOT NULL,
	mname char(10),
	lname char(10) NOT NULL,
	dob date NOT NULL,
	address varchar(50) NOT NULL,
	PRIMARY KEY (cust_id)
	);

create table phone_book_cust
		(
		cust_id char(10) REFERENCES customer(cust_id),
		phone_no char(10) NOT NULL
		);
create table branch
	(
	brnch_id char(10) NOT NULL,
	brnch_name varchar(20) NOT NULL,
	brnch_city varchar(20) NOT NULL,
	PRIMARY KEY (brnch_id)
	);
create table account
	(
	acnt_id char(10) NOT NULL,
	balance int NOT NULL,
	PRIMARY KEY (acnt_id)
	);
create table savings
	(
	acnt_id char (10) REFERENCES account(acnt_id),
	rate_intrst int NOT NULL,
	PRIMARY KEY (acnt_id)
	);
create table current
	(
	acnt_id char(10) REFERENCES account(acnt_id),
	overdraft_amount int NOT NULL,
	PRIMARY KEY (acnt_id)
	);
create table transaction
	(
	trans_id char(10) NOT NULL,
	acnt_id char (10) REFERENCES account(acnt_id),
	amount int NOT NULL,
	acnt_type varchar(10) NOT NULL,
	description varchar(50) NOT NULL,
	PRIMARY KEY (trans_id,acnt_id)
	);
create table payment
	(
	pay_no char(10) NOT NULL,
	pay_date date NOT NULL,
	amount int NOT NULL,
	PRIMARY KEY (pay_no)
	);
create table loan
	(
	loan_id char(10) NOT NULL,
	loan_amount int NOT NULL,
	pay_no char(10) REFERENCES payment(pay_no),
	PRIMARY KEY (loan_id)
	);
create table borrowed
	(
	cust_id char(10) REFERENCES customer(cust_id),
	loan_id char(10) REFERENCES loan(loan_id),
	brnch_id char(10) REFERENCES branch(brnch_id),
	PRIMARY KEY (cust_id,loan_id,brnch_id)
	);
create table employee
	(
	emp_id char(10) NOT NULL,
	emp_name varchar(20) NOT NULL,
	manager_id char(10) REFERENCES employee(emp_id),
	PRIMARY KEY (emp_id)
	);
create table works_at
	(
	emp_id char(10) REFERENCES employee(emp_id),
	brnch_id char(10) REFERENCES branch(brnch_id),
	PRIMARY KEY (emp_id,brnch_id)
	);
create table phone_book_emp
	(
	emp_id char(10) NOT NULL,
	phone_no char(10) NOT NULL,
	PRIMARY KEY (emp_id,phone_no)
	);


Drop database if exists g00359990;
Show databases;
create database g00359990 CHARACTER SET utf8 COLLATE UTF8_GENERAL_CI ;
Use g00359990;
Show tables;
Drop table if exists dept;

create table dept (
  deptno tinyint unsigned NOT NULL auto_increment ,  
  dname varchar(45) NOT NULL, -- maximum column length is 45 characters
  location ENUM ('Clare','Galway','Cork','Dublin') Not Null,  -- default value is first element in list
  last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (deptno)
  );

/* CHAR fixed length, Max no of char 255, right padded with space to required length, 50% faster than VARCHAR, static memory allocation
 VARCHAR variable length field, Max no of char 255, slower that CHAR, dynamic memory allocation
*/

show tables;
select * from dept;
Insert into dept values (10, 'Dr.Mulcahy', 'Clare', CURRENT_TIMESTAMP), (20, 'Dr.Keane', 'Galway',CURRENT_TIMESTAMP),(30, 'Dr.Simpson', 'Cork',CURRENT_TIMESTAMP),(40, 'Dr.White', 'Dublin',CURRENT_TIMESTAMP);

Drop table if exists emp;

Show databases;
Use g00359990;
create table emp (
  empno Int(5) unsigned zerofill auto_increment,
  title ENUM ('Mr.', 'Mrs.', 'Miss.', 'Ms.'),
  name varchar(45) not null default 'Smith',
  appointment SET ('Phone appointment', 'Post appointment', 'Online appointment', 'Drop in appointment') not null ,
  payment_type ENUM ('Online payment','Cheque payment','Credit card payment','Cash payment','Post payment', 'Drop in payment', 'Small payments'),
  rate smallint unsigned,
  appointment_date date not null,
  currency_symbol varchar(10),
  total_cost DECIMAL(6,2) unsigned,# 6 is the total number of digits and 2 is the number of digits after the decimal point, values that can be stored in the salary column range from -9999.99 to 9999.99
  specialist SET ('YES Dr.Keane', 'NO', 'YES Dr.Simpson', 'YES Dr.White') not null,
  bill SET ('PAID', 'UN-PAID', 'CANCELLED') not null,
  treatment SET ('Cleaning', 'Filling', 'Braces', 'Whitening', 'Cleaning & Whitening') not null,
  deptno TINYINT unsigned not null default 20,  
  procedure_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  picture LONGBLOB DEFAULT NULL,           # Picture in DATABASE as BLOB (up to 4.2GB)
  picture_path varchar(20) DEFAULT NULL,   # Path to where picture is stored in file system,
  primary key (empno)
)  Engine=InnoDB;

describe emp;

select * from emp;

-- Load data local infile "f:/emp.tsv" into table emp lines terminated by "\r\n"; 

INSERT INTO emp (empno, title, name, appointment, payment_type, rate, appointment_date, currency_symbol, total_cost, specialist, bill, treatment, deptno, picture ,picture_path) VALUES
(7369, 'Mr.','SMITH', ('Phone appointment'), 'Online payment', NULL, '2020-05-17', 0xE282AC, 45.00, 'YES Dr.Keane', 'PAID', 'Cleaning', 20, load_file('c:/g00359990/pic1.png'),'/pic1.png'),
(7499, 'Mr.','ALLEN', ('Post appointment'), 'Small payments', 50, '2020-04-20', 0xE282AC, 1000.00, 'YES Dr.Simpson','UN-PAID', 'Braces', 30, load_file('c:/g00359990/pic2.png'),'/pic2.png'),
(7521, 'Mr.','WARD', ('Phone appointment'), 'Small payments', 90, '2020-08-22', 0xE282AC, 1000.00, 'YES Dr.Simpson', 'PAID', 'Braces', 30, load_file('c:/g00359990/pic3.png'),'/pic3.png'),
(7566, 'Miss.','JONES', ('Online appointment'), 'Cash payment', NULL, '2020-05-06', 0xE282AC, 250.00, 'NO', 'CANCELLED', 'Filling', 20, load_file('c:/g00359990/pic4.png'),'/pic4.png'),
(7654, 'Mr.','MARTIN', ('Drop in appointment'), 'Small payments', 100, '2020-08-09', 0xE282AC, 700.00, 'YES Dr.White', 'PAID', 'Cleaning & Whitening', 30, load_file('c:/g00359990/pic5.png'),'/pic5.png'),
(7698, 'Mr.','BLAKE', ('Phone appointment'), 'Cash payment', NULL, '2020-11-09', 0xE282AC, 45.00, 'NO', 'PAID', 'Cleaning', 30, load_file('c:/g00359990/pic6.png'),'/pic6.png'),
(7782, 'Mr.','CLARK', ('Phone appointment'), 'Cheque payment', NULL, '2020-07-08', 0xE282AC, 45.00, 'NO', 'UN-PAID', 'Cleaning', 10, load_file('c:/g00359990/pic7.png'),'/pic7.png'),
(7788, 'Mr.','SCOTT', ('Online appointment'), 'Cheque payment', NULL, '2020-05-12', 0xE282AC, 45.00, 'YES Dr.Keane', 'CANCELLED', 'Cleaning', 20, load_file('c:/g00359990/pic8.png'),'/pic8.png'),
(7839, 'Miss.','KING',('Drop in appointment'), 'Drop in payment', NULL, '2019-03-29', 0xE282AC, 45.00, 'NO', 'UN-PAID', 'Cleaning', 10, load_file('c:/g00359990/pic9.png'),'/pic9.png'),
(7844, 'Mr.','TURNER', ('Post appointment'),'Small payments', 75, '2020-04-04', 0xE282AC, 260.00, 'NO', 'UN-PAID', 'Whitening', 20, load_file('c:/g00359990/pic10.png'),'/pic10.png'),
(7876, 'Mrs.','ADAMS',('Online appointment') ,'Credit card payment', NULL, '2020-07-07', 0xE282AC, 250.00, 'YES Dr.Simpson', 'PAID', 'Filling', 20, load_file('c:/g00359990/pic11.png'),'/pic11.png'),
(7900, 'Mr.','JAMES', ('Drop in appointment'), 'Drop in payment', NULL, '2020-11-09', 0xE282AC, 700.00, 'NO', 'PAID', 'Cleaning & Whitening',30, load_file('c:/g00359990/pic12.png'),'/pic12.png'),
(7902, 'Mrs.','FORD', ('Phone appointment'), 'Cash payment', NULL, '2020-08-07', 0xE282AC, 260.00, 'NO','PAID', 'Whitening', 20, load_file('c:/g00359990/pic6.png'),'/pic6.png'),
(7934, 'Mr.','MILLER',('Drop in appointment') , 'Credit card payment', NULL, '2020-04-11', 0xE282AC, 45.00, 'YES Dr.White', 'PAID', 'Cleaning', 10, load_file('c:/g00359990/pic8.png'),'/pic8.png');


show warnings;

 
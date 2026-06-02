A)

CREATE USER '2021ICT68'@'localhost' IDENTIFIED BY '123abc';

GRANT ALL PRIVILEGES ON *.* TO '2021ICT68'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR '2021ICT68'@'localhost';

anush@MSI c:\xampp
# mysql -u 2021ICT68 -p
Enter password: ******
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>

d)...


(e) Create View for:

i. To display the First_name, Last_name, Department_Id, and Department_name
for all employees who are working in the department with Department_Id
80 or 40.

CREATE VIEW view_1 AS
SELECT e.First_name, e.Last_name, e.Department_Id, d.Department_name
FROM Employee e
JOIN department d	
ON d.department_Id = e.Department_Id
WHERE e.Department_Id IN (80,40);

MariaDB [Human_Resource]> SELECT * FROM View_1;
+------------+-----------+---------------+-----------------+
| First_name | Last_name | Department_Id | Department_name |
+------------+-----------+---------------+-----------------+
| Alex       | Ronald    |            40 | Human Resources |
| Jose       | Urman     |            40 | Human Resources |
| Neena      | Mathan    |            80 | Sales           |
| Akilan     | Thaas     |            80 | Sales           |
| Pathma     | Maaran    |            80 | Sales           |
+------------+-----------+---------------+-----------------+
5 rows in set (0.014 sec)


ii. To find the First_name, Last_name, Min_Salary, Max_Salary, and Salary
for each of the employees who are earning more than the maximum salary
for that particular job.

CREATE VIEW view_2 AS
SELECT
	e.First_name, e.Last_name,j.Min_Salary,j.Max_Salary,e.Salary
	FROM Employee e
	JOIN Job_Details j 
	ON e.Job_Id = j.Job_Id
	WHERE e.Salary > j.Max_Salary;
	
MariaDB [Human_Resource]> SELECT * FROM view_2
-> ;
+------------+-----------+------------+------------+----------+
| First_name | Last_name | Min_Salary | Max_Salary | Salary   |
+------------+-----------+------------+------------+----------+
| Neena      | Mathan    |    6000.00 |   12000.00 | 17000.00 |
| Luxi       | Kaanthan  |    4000.00 |    9000.00 | 17000.00 |
+------------+-----------+------------+------------+----------+
2 rows in set (0.002 sec)

iii. To show the First_name, Last_name, Department_name, and City of employees
whose First_name contains the letter ‘d’.

CREATE VIEW view_3 AS
SELECT e.First_name, e.Last_name, d.Department_name, l.City
FROM Employee e
JOIN department d ON 
e.department_Id = d.department_Id 
JOIN Location l ON
l.Location_Id = d.Location_Id
WHERE e.First_name LIKE '%d%';

MariaDB [HUMAN_RESOURCE]> SELECT * FROM view_3;
+------------+-----------+-----------------+---------+
| First_name | Last_name | Department_name | City    |
+------------+-----------+-----------------+---------+
| Adam       | Fripp     | Shipping        | Colombo |
| David      | Austin    | Finance         | Colombo |
| Daniel     | Faviet    | Finance         | Colombo |
| Diana      | Lawrence  | Accounting      | Colombo |
| Bandara    | Kumara    | Accounting      | Colombo |
+------------+-----------+-----------------+---------+
5 rows in set (0.001 sec)


(f) Write MySQL statements to prepare the index for each of the following:
i. Create index for the employee relation on the attributes First_name and
Last_name.

CREATE INDEX index_1 ON Employee (First_name,Last_name);


ii. Create index on the attributes Department_Id for the employee relation.

CREATE INDEX index_2 ON Employee(department_Id);

iii. List down the relational_schema, relation_name, index_name, and column_name of 
created indexes for the database Human_Resource.

SELECT 
	Table_schema AS 'relational_schema',
	Table_name AS 'relation_name',
	Index_name AS 'Index_name',
	column_name AS 'Column_name'
FROM 
	Information_schema.STATISTICS
WHERE
	Table_schema = 'HUMAN_RESOURCE';
	
+-------------------+---------------+-------------+---------------+
| relational_schema | relation_name | Index_name  | Column_name   |
+-------------------+---------------+-------------+---------------+
| human_resource    | department    | PRIMARY     | Department_Id |
| human_resource    | department    | Location_Id | Location_Id   |
| human_resource    | employee      | PRIMARY     | Employee_Id   |
| human_resource    | employee      | Job_Id      | Job_Id        |
| human_resource    | employee      | index_1     | First_name    |
| human_resource    | employee      | index_1     | Last_name     |
| human_resource    | employee      | index_2     | Department_Id |
| human_resource    | job_details   | PRIMARY     | Job_Id        |
| human_resource    | location      | PRIMARY     | Location_Id   |
+-------------------+---------------+-------------+---------------+
9 rows in set (0.023 sec)

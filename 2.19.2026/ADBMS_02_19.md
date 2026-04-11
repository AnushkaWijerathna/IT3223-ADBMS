**#Creating users Without Password**

MariaDB \[(none)]> CREATE USER 2021ict68 @localhost

&nbsp;   -> ;

&nbsp;	

MariaDB \[(none)]> use mysql

Database changed



MariaDB \[mysql]> show tables;



**#Selecting users**

select user, host from user;



**#Creating users With Password**

MariaDB \[mysql]> CREATE USER 2021ict68\_A @localhost IDENTIFIED BY 'abc';

Query OK, 0 rows affected (0.003 sec)



**#Drop users**

MariaDB \[mysql]> DROP USER 2021ict68 @localhost

&nbsp;   -> ;

Query OK, 0 rows affected (0.002 sec)



**#Update user's user Name**

MariaDB \[mysql]> update user set user = '2021ict68' where user = '2021ict68\_A';

Query OK, 1 row affected (0.004 sec)

Rows matched: 1  Changed: 1  Warnings: 0



**#Update users host**

MariaDB \[mysql]> UPDATE USER SET HOST = 'host'  WHERE USER = '2021ict68';

Query OK, 1 row affected (0.004 sec)

Rows matched: 1  Changed: 1  Warnings: 0



**#Set users password for a user that has not given a password**

MariaDB \[mysql]> SET PASSWORD FOR 'pma'@'localhost' = PASSWORD('123');

Query OK, 0 rows affected (0.002 sec)



**#Update an existing password**

ALTER USER '<User Name>'@'localhost' IDENTIFIED BY '<New Password>'

#Test database
MariaDB [test]> CREATE TABLE SAMPLE_1(col_1 varchar(5));
Query OK, 0 rows affected (0.015 sec)

MariaDB [test]> GRANT SELECT ON test.SAMPLE_1 TO 'student01'@'localhost';
Query OK, 0 rows affected (0.003 sec)



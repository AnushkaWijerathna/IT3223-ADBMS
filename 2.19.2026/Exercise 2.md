**1).** 

MariaDB \[mysql]> CREATE USER 'student\_1' @localhost IDENTIFIED BY '123456';

Query OK, 0 rows affected (0.004 sec)



MariaDB \[mysql]> CREATE USER 'student\_2' @localhost IDENTIFIED BY '123456';

Query OK, 0 rows affected (0.004 sec)



**02).**

MariaDB \[mysql]> SELECT USER,HOST,PASSWORD FROM user

&nbsp;   -> ;

+-----------+-----------+-------------------------------------------+

| User      | Host      | Password                                  |

+-----------+-----------+-------------------------------------------+

| root      | localhost |                                           |

| student\_1 | localhost | \*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |

| root      | 127.0.0.1 |                                           |

| root      | ::1       |                                           |

| pma       | localhost | \*23AE809DDACAF96AF0FD78ED04B6A265E05AA257 |

| 2021ict68 | localhost | \*0D3CED9BEC10A777AEC23CCC353A8C08A633045E |

| student\_2 | localhost | \*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |

+-----------+-----------+-------------------------------------------+

7 rows in set (0.001 sec)



**03).**

MariaDB \[mysql]> UPDATE USER SET USER='2021ict68' WHERE USER='student\_1';

Query OK, 1 row affected (0.004 sec)

Rows matched: 1  Changed: 1  Warnings: 



**04).**

MariaDB \[mysql]> SELECT USER,PASSWORD FROM USER;

+-----------+-------------------------------------------+

| User      | Password                                  |

+-----------+-------------------------------------------+

| root      |                                           |

| 2021ict68 | \*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |

| root      |                                           |

| root      |                                           |

| pma       | \*23AE809DDACAF96AF0FD78ED04B6A265E05AA257 |

| student\_2 | \*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |

+-----------+-------------------------------------------+

6 rows in set (0.001 sec)



**05).**

MariaDB \[mysql]> ALTER USER 'student\_2'@'localhost' IDENTIFIED BY 'abc';

Query OK, 0 rows affected (0.003 sec



**06).**

MariaDB \[mysql]> SELECT USER,PASSWORD FROM USER;

+-----------+-------------------------------------------+

| User      | Password                                  |

+-----------+-------------------------------------------+

| root      |                                           |

| 2021ict68 | \*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |

| root      |                                           |

| root      |                                           |

| pma       | \*23AE809DDACAF96AF0FD78ED04B6A265E05AA257 |

| student\_2 | \*0D3CED9BEC10A777AEC23CCC353A8C08A633045E |

+-----------+-------------------------------------------+

6 rows in set (0.001 sec)



MariaDB \[mysql]>



**07).**

MariaDB \[mysql]> UPDATE USER SET HOST='vau.ac.lk' WHERE USER='student\_2';

Query OK, 1 row affected (0.004 sec)

Rows matched: 1  Changed: 1  Warnings: 0



**08).**

MariaDB \[mysql]> SELECT USER,host FROM USER;

+-----------+-----------+

| User      | Host      |

+-----------+-----------+

| root      | 127.0.0.1 |

| root      | ::1       |

| 2021ict68 | localhost |

| pma       | localhost |

| root      | localhost |

| student\_2 | vau.ac.lk |

+-----------+-----------+

6 rows in set (0.001 sec)



MariaDB \[mysql]>




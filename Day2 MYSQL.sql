Last login: Mon Apr 21 16:08:52 on console
sahilkumar@SAHILs-MacBook-Air ~ %   mysql -u root
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 9.2.0 Homebrew

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| company_db         |
| constraints_demo   |
| demo1              |
| demo2              |
| demo3              |
| demo4              |
| information_schema |
| join_assignments   |
| mysql              |
| performance_schema |
| school             |
| subqueries         |
| sys                |
+--------------------+
13 rows in set (0.33 sec)

mysql> use school;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+------------------+
| Tables_in_school |
+------------------+
| students         |
+------------------+
1 row in set (0.00 sec)

mysql> select * from students;
+------+--------+-------+
| roll | name   | marks |
+------+--------+-------+
|  101 | ravi   |    90 |
|  102 | ram    |    99 |
|  103 | harish |    60 |
|  104 | yash   |    50 |
+------+--------+-------+
4 rows in set (0.00 sec)

mysql> alter table students add column phone text;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from students;
+------+--------+-------+-------+
| roll | name   | marks | phone |
+------+--------+-------+-------+
|  101 | ravi   |    90 | NULL  |
|  102 | ram    |    99 | NULL  |
|  103 | harish |    60 | NULL  |
|  104 | yash   |    50 | NULL  |
+------+--------+-------+-------+
4 rows in set (0.00 sec)

mysql> alter table students rename phone to contact;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'to contact' at line 1
mysql> 
mysql> alter table students rename column phone to contact;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from students;
+------+--------+-------+---------+
| roll | name   | marks | contact |
+------+--------+-------+---------+
|  101 | ravi   |    90 | NULL    |
|  102 | ram    |    99 | NULL    |
|  103 | harish |    60 | NULL    |
|  104 | yash   |    50 | NULL    |
+------+--------+-------+---------+
4 rows in set (0.01 sec)

mysql> alter table students drop column contact;
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from students;
+------+--------+-------+
| roll | name   | marks |
+------+--------+-------+
|  101 | ravi   |    90 |
|  102 | ram    |    99 |
|  103 | harish |    60 |
|  104 | yash   |    50 |
+------+--------+-------+
4 rows in set (0.00 sec)

mysql> alter table students add column phone text;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc students;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| roll  | int  | NO   | PRI | NULL    |       |
| name  | text | YES  |     | NULL    |       |
| marks | int  | YES  |     | NULL    |       |
| phone | text | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table students modify column phone int;
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> desc students;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| roll  | int  | NO   | PRI | NULL    |       |
| name  | text | YES  |     | NULL    |       |
| marks | int  | YES  |     | NULL    |       |
| phone | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> alter table students drop column contact;
ERROR 1091 (42000): Can't DROP 'contact'; check that column/key exists
mysql> 
mysql> alter table students drop column phone;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from students;
+------+--------+-------+
| roll | name   | marks |
+------+--------+-------+
|  101 | ravi   |    90 |
|  102 | ram    |    99 |
|  103 | harish |    60 |
|  104 | yash   |    50 |
+------+--------+-------+
4 rows in set (0.00 sec)

mysql> update students set students = students+5;
ERROR 1054 (42S22): Unknown column 'students' in 'field list'
mysql> update students set marks = marks+5;
Query OK, 4 rows affected (0.01 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> select * from students;
+------+--------+-------+
| roll | name   | marks |
+------+--------+-------+
|  101 | ravi   |    95 |
|  102 | ram    |   104 |
|  103 | harish |    65 |
|  104 | yash   |    55 |
+------+--------+-------+
4 rows in set (0.00 sec)

mysql> update students set marks = marks-15 where roll=104 ;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from students;
+------+--------+-------+
| roll | name   | marks |
+------+--------+-------+
|  101 | ravi   |    95 |
|  102 | ram    |   104 |
|  103 | harish |    65 |
|  104 | yash   |    40 |
+------+--------+-------+
4 rows in set (0.00 sec)

mysql> delete from students where roll=104;
Query OK, 1 row affected (0.00 sec)

mysql> select * from students;
+------+--------+-------+
| roll | name   | marks |
+------+--------+-------+
|  101 | ravi   |    95 |
|  102 | ram    |   104 |
|  103 | harish |    65 |
+------+--------+-------+
3 rows in set (0.00 sec)

mysql> delete from students;
Query OK, 3 rows affected (0.00 sec)

mysql> select * from students;
Empty set (0.00 sec)

mysql> insert into students values (101,"rahul",90);
Query OK, 1 row affected (0.00 sec)

mysql> select * from students;
+------+-------+-------+
| roll | name  | marks |
+------+-------+-------+
|  101 | rahul |    90 |
+------+-------+-------+
1 row in set (0.00 sec)

mysql> insert into students values (102,"ram",90);
Query OK, 1 row affected (0.00 sec)

mysql> delete from students where roll=102;
Query OK, 1 row affected (0.00 sec)

mysql> select * from students;
+------+-------+-------+
| roll | name  | marks |
+------+-------+-------+
|  101 | rahul |    90 |
+------+-------+-------+
1 row in set (0.00 sec)

mysql> create table emp(id int auto_increment primary key,name text);
Query OK, 0 rows affected (0.01 sec)

mysql> select * from students;
+------+-------+-------+
| roll | name  | marks |
+------+-------+-------+
|  101 | rahul |    90 |
+------+-------+-------+
1 row in set (0.00 sec)

mysql> select * emp;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'emp' at line 1
mysql> select * from emp;
Empty set (0.00 sec)

mysql> insert into emp (name) values ("ravi"),("ram"),("suresh");
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from emp;
+----+--------+
| id | name   |
+----+--------+
|  1 | ravi   |
|  2 | ram    |
|  3 | suresh |
+----+--------+
3 rows in set (0.00 sec)

mysql> delete from emp where id =3;
Query OK, 1 row affected (0.01 sec)

mysql> insert into emp (name) values ("ram yash");
Query OK, 1 row affected (0.00 sec)

mysql> select * from emp;
+----+----------+
| id | name     |
+----+----------+
|  1 | ravi     |
|  2 | ram      |
|  4 | ram yash |
+----+----------+
3 rows in set (0.00 sec)

mysql> delete from emp;
Query OK, 3 rows affected (0.00 sec)

mysql> insert into emp (name) values ("ram yash");
Query OK, 1 row affected (0.00 sec)

mysql> select * from emp;
+----+----------+
| id | name     |
+----+----------+
|  5 | ram yash |
+----+----------+
1 row in set (0.00 sec)

mysql> truncate table emp;
Query OK, 0 rows affected (0.01 sec)

mysql> insert into emp (name) values ("ram yash");
Query OK, 1 row affected (0.00 sec)

mysql> select * from emp;
+----+----------+
| id | name     |
+----+----------+
|  1 | ram yash |
+----+----------+
1 row in set (0.00 sec)

mysql> select * from students;
+------+-------+-------+
| roll | name  | marks |
+------+-------+-------+
|  101 | rahul |    90 |
+------+-------+-------+
1 row in set (0.00 sec)

mysql> select * from students where roll=101;
+------+-------+-------+
| roll | name  | marks |
+------+-------+-------+
|  101 | rahul |    90 |
+------+-------+-------+
1 row in set (0.00 sec)

mysql> insert into students values (102,"ram",90);
Query OK, 1 row affected (0.00 sec)

mysql> select * from students where roll=101;
+------+-------+-------+
| roll | name  | marks |
+------+-------+-------+
|  101 | rahul |    90 |
+------+-------+-------+
1 row in set (0.00 sec)

mysql> select * from students where marks>90;
Empty set (0.00 sec)

mysql> 

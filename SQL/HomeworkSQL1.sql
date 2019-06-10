create database if not exists staff_dep;
use staff_dep;
create table if not exists staff(
id int not null auto_Increment primary key,
first_name varchar(30) not null ,
last_name varchar(30) not null ,
position_id integer not null,
salary int not null);
/*создаем таблицу сотрудников*/
create table if not exists positions(
id int not null auto_increment primary key,
pos varchar(30) not null);/*Создаем таблицу должностей*/
insert into positions values (1, 'designer');
insert into positions values (2, 'worker');
insert into positions values (3, 'director');
insert into positions values (4, 'cleaner');
insert into positions values (5, 'secretary');
insert into staff  values (null, 'Vladimir', 'Lisin', 1, 27000);
insert into staff values (null, 'Mihail', 'Prohorov', 2, 35000);
insert into staff values (null, 'Roman', 'Abramovich', 3, 50000);
insert into staff values (null, 'Oleg', 'Deripaska', 4, 15000);
insert into staff values (null, 'Vladimir', 'Potanin', 5, 20000);
insert into staff values (null, 'Dmitriy', 'Rybolovlev', 1, 32000);
/*наполнение обеих таблиц*/

select * from staff_dep.staff where salary>30000;/*запрос о сотрудниках с зарплатой больше 30000*/ 

select * from staff_dep.staff where position_id=1 and salary<30000;/*запрос о дизанерах (id=1) с зарплатой меньше 30000*/
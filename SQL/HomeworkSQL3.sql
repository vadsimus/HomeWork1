create database if not exists staff_dep;
use staff_dep;

create table if not exists staff(
id int not null auto_Increment primary key,
first_name varchar(30) not null ,
last_name varchar(30) not null ,
post_id integer not null,
salary int not null);
/*создаем таюлицу сотрудников*/

create table if not exists posts(
id int not null auto_increment primary key,
post varchar(30) not null);/*создаем таблицу должностей*/

insert into posts values (1, 'designer');
insert into posts values (2, 'worker');
insert into posts values (3, 'director');
insert into posts values (4, 'cleaner');
insert into posts values (5, 'secretary');/*наполнение должностей*/

insert into staff  values (null, 'Vladimir', 'Lisin', 1, 27000);
insert into staff values (null, 'Mihail', 'Prohorov', 2, 35000);
insert into staff values (null, 'Roman', 'Abramovich', 3, 50000);
insert into staff values (null, 'Oleg', 'Deripaska', 5, 15000);
insert into staff values (null, 'Vladimir', 'Potanin', 4, 20000);
insert into staff values (null, 'Dmitriy', 'Rybolovlev', 1, 32000);
/*наполнение таблицы сотрудников с указанием должности*/

create table if not exists head_inferior(
head int not null,
inferior int not null
);/*создание вспомогательной таблицы "начальник - подчиненный*/

alter table head_inferior add foreign key (head) references staff(id);
alter table head_inferior add foreign key (inferior) references staff(id);
/*установка внешних ключей*/
insert into head_inferior values (3, 1);
insert into head_inferior values (3, 2);
insert into head_inferior values (1, 6);
insert into head_inferior values (5, 6);
/*наполнение таблицы связей "начальник-подчиненный"*/

select distinct
nm1.id,
nm1.first_name as first_name, 
nm1.last_name as last_name,
pst1.post as post
from head_inferior
inner join staff as nm1 on nm1.id = head_inferior.head
inner join posts as pst1 on pst1.id = nm1.post_id;
/*запрос о всех начальниках(если есть подиненные) в единственном количестве(если подчненных много) с указанием должности*/






create database airline_1bm20cs042;
use airline_1bm20cs042;

-- query 1
create table flights(flno int primary key,
                    _from varchar(30),
					_to varchar(30),
                    distance int,
                    departs time,
                    arrives time,
                    price int);
desc flights;

create table aircraft(aid int primary key,
					aname varchar(30), 
                    cruisingrange int);
desc aircraft;

create table employees(eid int primary key,
					ename varchar(30),
                    salary int);
desc employees;

create table certified(eid int, aid int,
						foreign key(eid) references employees(eid),
                        foreign key(aid) references aircraft(aid));
desc certified;

insert into flights values(101,'Banglore','Delhi',2500,timestamp '2005-05-13 07:15:31', timestamp '2005-05-13 17:15:31' , 5000);
insert into flights values(102,'Banglore','Lucknow',3000,timestamp '2005-05-13 07:15:31', timestamp '2005-05-13 11:15:31' , 6000);
insert into flights values(103,'Lucknow','Delhi',500,timestamp '2005-05-13 12:15:31', timestamp '2005-05-13 17:15:31' , 3000);
insert into flights values(107,'Banglore','Frankfrut',8000,timestamp '2005-05-13 07:15:31', timestamp '2005-05-13 22:15:31' , 60000);
insert into flights values(104,'Banglore','Frankfrut',8500,timestamp '2005-05-13 07:15:31', timestamp '2005-05-13 23:15:31' , 75000);
insert into flights values(105,'Kolkata','Delhi',3400,timestamp '2005-05-13 07:15:31', timestamp '2005-05-13 09:15:31' , 7000);
select *from flights;

insert into aircraft values( 101,'747', 3000);
insert into aircraft values( 102,'Boeing', 900);
insert into aircraft values( 103,'647', 800);
insert into aircraft values( 104,'Dreamliner', 10000);
insert into aircraft values( 105,'Boeing', 3500);
insert into aircraft values( 106,'707', 1500);
insert into aircraft values( 107,'Dream', 120000);
select *from aircraft;

insert into employees values (701,'A',50000);
insert into employees values (702,'B',100000);
insert into employees values (703,'C',150000);
insert into employees values (704,'D',90000);
insert into employees values (705,'E',40000);
insert into employees values (706,'F',60000);
insert into employees values (707,'G',90000);
SELECT *FROM employees;

insert into certified values(701,101);
insert into certified values(701,102);
insert into certified values(701,106);
insert into certified values(701,105);
insert into certified values(702,104);
insert into certified values(703,104);
insert into certified values(704,104);
insert into certified values(702,107);
insert into certified values(703,107);
insert into certified values(704,107);
insert into certified values(702,101);
insert into certified values(703,105);
insert into certified values(704,105);
insert into certified values(705,103);
select *from certified;



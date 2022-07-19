create database supplier_1bm20cs042;
use supplier_1bm20cs042;

-- query 1
create table suppler(sid int primary key,
			sname varchar(30),
            address varchar(30));
desc suppler;

create table parts(pid int primary key,
				pname varchar(30),
                color varchar(20));
desc parts;

create table catalog(sid int,
				pid int,
                cost real,
                primary key(sid,pid),
                foreign key(sid) references suppler(sid),
                foreign key(pid) references parts(pid));
desc catalog;

insert into suppler values(10001, 'Acme Widget' , 'Banglore');
insert into suppler values(10002, 'Jhons' , 'Kolkata');
insert into suppler values(10003, 'Vimal' , 'Mumbai');
insert into suppler values(10004, 'Reliance' , 'Delhi');
select * from suppler;

insert into parts values (20001 , 'Book','Red');
insert into parts values (20002 , 'Pen','Red');
insert into parts values (20003 , 'Pencil','Green');
insert into parts values (20004 , 'Mobile','Green');
insert into parts values (20005 , 'Charger','Black');
select * from parts;

insert into catalog values(10001, 20001, 10);
insert into catalog values(10001, 20002, 10);
insert into catalog values(10001, 20003, 30);
insert into catalog values(10001, 20004, 10);
insert into catalog values(10001, 20005, 10);
insert into catalog values(10002, 20001, 10);
insert into catalog values(10002, 20002, 20);
insert into catalog values(10003, 20003, 30);
insert into catalog values(10004, 20003, 40);
select *from catalog;

-- query 2
select distinct p.pname from parts p, catalog c where p.pid=c.pid;

-- query 3
select s.sname , count(*) as num 
from catalog c, suppler s
where c.sid = s.sid
group by sname
 having count(*) =( select count(*)
					from parts);

-- query 4
select distinct s.sname, count(*)
from catalog c , suppler s, parts p
where c.sid = s.sid and c.pid = p.pid and p.color= 'red'
group by sname;
                
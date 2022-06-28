use dhavan_1bm20cs042;

-- query1
create table person(
	driver_id varchar(25), 
	driv_name varchar(25),
	address varchar(50));
alter table person add primary key(driver_id);
create table car(
	reg_no varchar(20),
	model varchar(20),
	year int,
	primary key(reg_no));
create table accident(
	rep_no int,
    date date,
    loc varchar(50),
    primary key(rep_no)
	);
create table owns(
	driver_id varchar(25),
    reg_no varchar(20),
    primary key(driver_id,reg_no),
    foreign key (driver_id) references person(driver_id),
    foreign key(reg_no) references car(reg_no));
create table participated(
	driver_id varchar(25),
	reg_no varchar(20),
    rep_no int,
    damage_amt int,
    primary key ( driver_id, reg_no, rep_no),
    foreign key (driver_id) references person(driver_id),
    foreign key(reg_no) references car(reg_no),
    foreign key(rep_no) references accident(rep_no));
show tables;

-- query 2    
desc person;
insert into person values ("A01", "Richard", "Srinivas nagar");
insert into person values ("A02", "Pradeep", "Rajaji nagar");
insert into person values ("A03", "Smith", "Ashok nagar");
insert into person values ("A04", "Venu", "N R Colony");
insert into person values ("A05", "Jhon", "Hanumanth nagar");
select * from person;
desc car;
insert into car values("KA052250", "Indiea", 1990);
insert into car values("KA031181", "Lancer", 1957);
insert into car values("KA095477", "Toyota", 1998);
insert into car values("KA053408", "Honda", 2008);
insert into car values("KA041702", "Audi", 2005);
select * from car;
desc owns;
insert into owns values("A01", "KA052250");
insert into owns values("A02", "KA031181");
insert into owns values("A03", "KA095477");
insert into owns values("A04", "KA053408");
insert into owns values("A05", "KA041702");
select * from owns;
desc accident;
insert into accident values (11,'03-01-01',"Mysore Road");
insert into accident values (12,'04-02-02',"South end Circle");
insert into accident values (13,'03-01-21',"Bull Temple Road");
insert into accident values (14,'08-02-17',"Mysore Road");
insert into accident values (15,'05-03-04',"Kanakpura Road");
select *from accident;
desc participated;
insert into participated values("A01", "KA052250", 11, 10000);
insert into participated values("A02", "KA031181", 12, 50000);
insert into participated values("A03", "KA095477", 13, 25000);
insert into participated values("A04", "KA053408", 14, 3000);
insert into participated values("A05", "KA041702", 15, 5000);
select *from participated;

-- query 3
update participated set damage_amt=25000 where reg_no = "KA031181" and rep_no = 12;
insert into accident value(16,"08-03-15","Domlur");

-- query 4
select count(distinct driver_id) as CNT from participated a, accident b where a.rep_no=b.rep_no and b.date like "%08%";

-- query 5
select count(rep_no) as CNT from car c, participated p where c.reg_no=p.reg_no and model ="Lancer";

-- additional query
select * from participated order by damage_amt desc;
select avg(damage_amt) from participated;
delete from participated where damage_amt < (select avg(damage_amt) from participated);
select max(damage_amt) from participated;

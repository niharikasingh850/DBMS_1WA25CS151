
Create database Insurance;
use Insurance;
Create table person
( driver_id varchar(10) Primary key, 
pname char(20) not null, 
address char(20));


create table car
( reg_num char(15) primary key,
model char(15),
car_year int);

create table owns
( driver_id varchar(10),
reg_num char(15),
primary key (driver_id, reg_num),
 foreign key (driver_id) References person (driver_id),
foreign key (reg_num) References car (reg_num));

create table accident
( report_num int primary key,
accident_date date not null,
location char(50) not null);

create table participated
( driver_id varchar(10),
reg_num char(15),
report_num int,
damage_amount int,
primary key (driver_id, reg_num, report_num),
foreign key (driver_id) References person (driver_id),
foreign key (reg_num) References car (reg_num),
foreign key (report_num) References accident (report_num));

insert into person values
("A01", "Richard", "Srinivas Nagar"),
("A02", "Pradeep", "Rajaji Nagar"),
("A03", "Smith", "Ashok Nagar"),
("A04", "Venu", "N R Colony"),
("A05", "John", "Hanumanth Nagar");

insert into car values
("KA052250", "Indica", 1990),
("KA031181", "Lancer", 1957),
("KA095477", "Toyota", 1998),
("KA053408", "Honda", 2008),
("KA041702", "Audi", 2005);

insert into owns values
("A01","KA052250"),
("A02","KA031181"),
("A03","KA095477"),
("A04","KA053408"),
("A05","KA041702");

insert into accident values
(11,"2003-01-01", "Mysore Road"),
(12,"2004-02-02", "South End Circle"),
(13,"2003-01-21", "Bull Temple Road"),
(14,"2009-02-17", "Mysore Road"),
(15,"2008-03-04", "Kanakpura Road");

insert into participated values
("A01","KA052250",11, 10000),
("A02","KA031181",12, 50000),
("A03","KA095477",13, 25000),
("A04","KA053408" ,14, 3000),
("A05","KA041702",15, 5000);

update participated set damage_amount= 25000 where reg_num="KA053408" ;

insert into accident value(16, "2012-05-18", "RV Road");

select accident_date, location from accident;

select driver_id from participated where damage_amount>= 25000;
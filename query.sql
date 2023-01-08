-- CREATE DATABASE -- 

-- create database
CREATE DATABASE TASK_ONE;
-- show any database
\l
-- entry to database
\c TASK_ONE

-----------------------------
-- ONE TO ONE RELATIONSHIP

-- create table
create table person (
    id_person INT PRIMARY KEY,
    name_person VARCHAR,
    age_person INT,
    address_person VARCHAR,
    gender_person jk
);

-- create table
create table car_owner (
    id_cars INT PRIMARY KEY,
    name_cars VARCHAR,
    color_cars VARCHAR,
    type_cars VARCHAR
    id_person INT,
    CONSTRAINT fk_person FOREIGN KEY 
    (id_person) REFERENCES person (id_person)
);

-- CRUD ONE TO ONE RELATIONSHIP

-- 'CRUD PERSON TABLE'
-- INSERT 
insert into person (id_person, name_person, age_person, address_person, gender_person) values (1, 'John', 25, 'New York', 'male');
insert into person (id_person, name_person, age_person, address_person, gender_person) values (2, 'Robert', 26, 'Chicago', 'male');
insert into person (id_person, name_person, age_person, address_person, gender_person) values (3, 'Jian', 21, 'Chicago', 'female');
insert into person (id_person, name_person, age_person, address_person, gender_person) values (4, 'Seni', 24, 'Washington', 'female');

-- READ 
select * from person;
select name_person, age_person from person;

-- UPDATE 
update person set age_person = 22 where id_person = 1;
update person set name_person = 'Robertson' where id_person = 2;

-- DELETE 
delete from person where name_person = 'Jian';


-- 'CRUD CAR_OWNER TABLE'
-- INSERT 
insert into car_owner (id_cars, name_cars, color_cars, id_person) values (1, 'Ferrari', 'Red', (select id_person from person where id_person = 1));
insert into car_owner (id_cars, name_cars, color_cars, id_person) values (2, 'Lamborghini', 'Black', (select id_person from person where id_person = 4));
insert into car_owner (id_cars, name_cars, color_cars, id_person) values (3, 'Ferrari', 'Red', (select id_person from person where id_person = 2));

-- READ
select name_cars, id_person from car_owners;

-- UPDATE 
update car_owner set color_cars = 'Brown' where id_person = '4';

-- DELETE 
delete from car_owner where id_cars = 1;



-----------------------------
-- ONE TO MANY RELATIONSHIP

-- create table
create table cars (
    id_cars INT PRIMARY KEY,
    name_cars varchar,
    color_cars varchar 
);

create table cars_enginer (
     id_enginers INT PRIMARY KEY,
     name_enginers varchar,
     phone_enginers INT,
     id_cars INT,
     CONSTRAINT fk_cars FOREIGN KEY (id_cars) REFERENCES car(   id_cars
));


-- CRUD ONE TO MANY RELATIONSHIP
-- CRUD TABLE CARS

-- INSERT
insert into cars (id_cars, name_cars, color_cars) values (101,'ZENIX INNOVA', 'White');
insert into cars (id_cars, name_cars, color_cars) values (102,'FORTUNER', 'Black');
insert into cars (id_cars, name_cars, color_cars) values (103,'BMW C200', 'White');
insert into cars (id_cars, name_cars, color_cars) values (104,'MERCEDES BENZ', 'White');

-- READ 
select id_cars, name_cars from cars;

-- UPDATE 
update cars set color_cars = 'Red' where id_cars = 104;

-- DELETE 
delete from cars where id_cars = 102;

-- CRUD TABLE CARS_ENGINER
-- INSERT
insert into cars_enginer (id_enginers, name_enginers, phone_enginers, id_cars) values (22501, 'Rians', 085124,(select id_cars from cars where id_cars = 101));
insert into cars_enginer (id_enginers, name_enginers, phone_enginers, id_cars) values (22502, 'Ferjo', 085125,(select id_cars from cars where id_cars = 103));
insert into cars_enginer (id_enginers, name_enginers, phone_enginers, id_cars) values (22503, 'Rocky', 085124,(select id_cars from cars where id_cars = 104));
insert into cars_enginer (id_enginers, name_enginers, phone_enginers, id_cars) values (22504, 'Shiro', 085142,(select id_cars from cars where id_cars = 102));


-- READ
select name_enginers from cars_enginer;

-- UPDATE 
update cars_enginer set name_enginers = 'Ferson' where id_enginers = 22502;

-- DELETE 
delete from cars_enginer where id_cars = 102;


---------------------------------
-- MANY TO MANY RELATIONSHIP

-- create table books
create table books (
    id_book VARCHAR PRIMARY KEY,
    name_book VARCHAR,
    date_rilis DATE,
    price_book VARCHAR
);

--create table users
create table users (
    id_user VARCHAR PRIMARY KEY,
    name_user VARCHAR,
    mobile_user INT,
    email_user VARCHAR
);

--create table books_users
create table books_users (
    id_book_user VARCHAR PRIMARY KEY,
    id_user VARCHAR,
    id_book VARCHAR,
    CONSTRAINT fk_book FOREIGN KEY (id_book) REFERENCES books (id_book),
    CONSTRAINT Fk_users FOREIGN KEY (id_user) REFERENCES users (id_user)
);

-- CRUD TABLE BOOKS
-- INSERT 
insert into books (id_book, name_book, date_rilis, price_book) values (100, 'Habis Suram Terbit Ceria', '2000-02-02', '50000');
insert into books (id_book, name_book, date_rilis, price_book) values (101, 'Tuhan Aku Hampir Menyerah', '2020-12-22', '100000');
insert into books (id_book, name_book, date_rilis, price_book) values (102, 'Mind of Mindset', '2002-08-12', '80000');

-- READ 
select name_book, date_rilis from books;

-- UPDATE 
update books set date_rilis = '2010-01-20' where id_book = 101;

-- DELETE 
delete from books where id_book = '100';


-- CRUD TABLE USERS
-- INSERT 
insert into users (id_user, name_user, mobile_user, email_user) values (01, 'John', 01234, 'john@gmail.com');
insert into users (id_user, name_user, mobile_user, email_user) values (02, 'Robert', 04567, 'Robert@gmail.com');
insert into users (id_user, name_user, mobile_user, email_user) values (03, 'Domans', 04890, 'Domans@gmail.com');

-- READ
select * from users;

-- UPDATE 
update users set name_user = 'Johny' where id_user = '01';

-- DELETE
delete from users where name_user = 'Johny';


-- CRUD TABLE BOOK_USERS
-- INSERT
insert into books_users (id_book_user, id_user, id_book) values (1, (select id_user from users where id_user = '1'), (select id_book from books where id_book = '101'));
insert into books_users (id_book_user, id_user, id_book) values (2, (select id_user from users where id_user = '2'), (select id_book from books where id_book = '102'));
insert into books_users (id_book_user, id_user, id_book) values (3, (select id_user from users where id_user = '3'), (select id_book from books where id_book = '103'));

-- READ 
select * from books_users;

-- UPDATE 
update books_users set id_user = '4' where id_user = '2';

-- DELETE 
delete from books_users where id_user = '3';




 
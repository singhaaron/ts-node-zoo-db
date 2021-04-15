-- -----------------------------------------------------
-- START  
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;
-- -----------------------------------------------------
-- Drop Entitys
-- -----------------------------------------------------
drop table if exists Departments;
drop table if exists Employees;
drop table if exists Customers;
drop table if exists Tickets;
drop table if exists Exhibits;
-- -----------------------------------------------------
-- Drop ISA Animals
-- -----------------------------------------------------
drop table if exists Animals;
drop table if exists Reptiles;
drop table if exists Amphibians;
drop table if exists Mammals;
drop table if exists Birds;
drop table if exists Invertebrates;
-- -----------------------------------------------------
-- Drop Relationships
-- -----------------------------------------------------
drop table if exists Visits;
drop table if exists Lives_In;
-- -----------------------------------------------------
-- Drop Views
-- -----------------------------------------------------
drop view if exists Exhibit_Animals;
-- -----------------------------------------------------
-- Create Tables
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Table Departments
-- -----------------------------------------------------
create table Departments (
    dept_id int auto_increment primary key,
    name varchar(45) unique key
);
-- -----------------------------------------------------
-- Table Employers
-- -----------------------------------------------------
create table Employees (
    employee_id int auto_increment primary key,
    dept_id int,
    name varchar(45),
    position varchar(45),
    age int,
    ssn int unique key,
        foreign key (dept_id)
        references Departments (dept_id)
        on delete cascade on update cascade
);
-- -----------------------------------------------------
-- Table Customers
-- -----------------------------------------------------
create table Customers (
    customer_id int auto_increment primary key,
    name varchar(45),
    phone int,
    email_addr varchar(45) unique key
);
-- -----------------------------------------------------
-- Table Tickets
-- -----------------------------------------------------
create table Tickets (
    ticket_id int auto_increment primary key,
    ticket_type varchar(45),
    ticket_price float
);
-- -----------------------------------------------------
-- Table Exhibits
-- -----------------------------------------------------
create table Exhibits (
    exhibit_id int auto_increment primary key,
    name varchar(45) unique key,
    location varchar(45),
    climate varchar(45) 
);
-- -----------------------------------------------------
-- Animals
-- -----------------------------------------------------
create table Animals (
    animal_id int auto_increment primary key,
    type enum('Invertebrate', 'Reptile', 'Amphibian', 'Mammal', 'Bird') not null,
    animal varchar(45) unique key,
    name varchar(45),
    birthdate date
);
-- -----------------------------------------------------
-- Table Amphibians
-- -----------------------------------------------------
create table Amphibians (
    animal_id int primary key,
    skin_type varchar(45) null,
    egg_size int null,
    foreign key (animal_id)
        references Animals (animal_id)
        on delete cascade on update cascade
);
-- -----------------------------------------------------
-- Table Reptile
-- -----------------------------------------------------
create table Reptiles (
    animal_id int,
    egg_tempature int,
    foreign key (animal_id)
        references Animals (animal_id)
        on delete cascade on update cascade
);
-- -----------------------------------------------------
-- Table Invertebrate
-- -----------------------------------------------------
create table Invertebrates (
    animal_id int auto_increment primary key,
    body_length int null,
    leg_count int null,
    foreign key (animal_id)
        references Animals (animal_id)
        on delete cascade on update cascade
);
-- -----------------------------------------------------
-- Table Mammals
-- -----------------------------------------------------
create table Mammals (
    animal_id int primary key,
    hair_type varchar(45),
    foreign key (animal_id)
        references Animals (animal_id)
        on delete cascade on update cascade
);
-- -----------------------------------------------------
-- Table Birds
-- -----------------------------------------------------
create table Birds(
    animal_id int  primary key,
    fly_height varchar(45) ,
    wing_span int ,
    beak_length int,
    foreign key (animal_id)
        references Animals (animal_id)
        on delete cascade on update cascade
);
-- -----------------------------------------------------
-- Relationship: Customer Visit Exhibits.
-- -----------------------------------------------------
create table Visits (
    customer_id int,
    exhibit_id int,
    entry_date datetime default current_timestamp,
    foreign key (customer_id)
        references Customers (customer_id)
        on delete cascade on update cascade,
    foreign key (exhibit_id)
        references Exhibits (exhibit_id)
        on delete cascade on update cascade
);
-- -----------------------------------------------------
-- Relationship: Animals in Exhibits 
-- -----------------------------------------------------
create table Lives_In (
    animal_id int,
    exhibit_id int,
    entry_date datetime default current_timestamp,
    foreign key (animal_id)
        references Animals (animal_id)
        on delete cascade on update cascade,
    foreign key (exhibit_id)
        references Exhibits (exhibit_id)
        on delete cascade on update cascade
);
-- -----------------------------------------------------
-- Insert Departments 
-- -----------------------------------------------------
insert into Departments(name) values 
("Human Resource"),
("Operations"),
("Public Assistance");
-- -----------------------------------------------------
-- Insert Employees 
-- -----------------------------------------------------
insert into Employees(name,position,age,ssn) values 
("Aaron Bing","Supervisor",20,23155532),
("Baaron Bing","Accountant",20,25155532),
("Saron Bing","Manager",20,24155532);
-- -----------------------------------------------------
-- Insert Customers 
-- -----------------------------------------------------
insert into Customers (name,phone,email_addr) values
("Customer One",51088219,"ooo@gmail.com"),
("Customer Three",51088319,"oboo@gmail.com"),
("Customer Four",51088219,"ofdso@gmail.com");
-- -----------------------------------------------------
-- Insert Tickets 
-- -----------------------------------------------------
insert into Tickets(ticket_type,ticket_price) values
("Safari Park",50),
("Sea World",70),
("Botanical Garden",80);
-- -----------------------------------------------------
-- Insert Exhibts 
-- -----------------------------------------------------
insert into Exhibits (name,location,climate) values
("Sea Lions","SF State Southwest Quadrant","Polar Chill" ),
("Plants and Algae","SF State Northeast Quadrant","The Cold Tundra" ),
("Giraffes","SF State Southeast Quadrant","The Mild Mediterranean");
-- -----------------------------------------------------
-- Insert Animals 
-- -----------------------------------------------------
insert into Animals (type,animal,name,birthdate) values
('Amphibian','Frog',"Froggyy",'2012-12-31'),
('Mammal','Deer',"Deeryy",'2012-12-31'),
('Bird','Parrot',"Paotyy",'2012-12-31'),
('Reptile','Lizard',"Reptilyy",'2012-12-31');
-- -----------------------------------------------------
-- Insert Amphibians 
-- -----------------------------------------------------
insert into Amphibians(animal_id,skin_type,egg_size) values 
(1,"Brownie Skin",25);
-- -----------------------------------------------------
-- Insert Mammals 
-- -----------------------------------------------------
insert into Mammals(animal_id,hair_type) values 
(2,"Black");
-- -----------------------------------------------------
-- Insert Birds 
-- -----------------------------------------------------
insert into Birds(animal_id,fly_height,wing_span,beak_length) values 
(3,50,50,50);
-- -----------------------------------------------------
-- Insert Reptiles 
-- -----------------------------------------------------
insert into Reptiles(animal_id,egg_tempature) values 
(4,40);
-- -----------------------------------------------------
-- Relationship: Animals in Exhibits 
-- -----------------------------------------------------
insert into Lives_In(animal_id,exhibit_id) values 
(1,1),(2,1),(3,2),(4,3);
-- -----------------------------------------------------
-- Views: Animal @ Exhibits Descriptions
-- -----------------------------------------------------
create view Exhibit_Animals as
select 
    Animals.type,
    Animals.animal,
	Exhibits.name as Exhibit_Name,
    Exhibits.location,
    Exhibits.climate
from
    Animals,
    Exhibits,
    Lives_in
where
    Animals.animal_id = Lives_in.animal_id
        and Exhibits.exhibit_id = Lives_in.exhibit_id;
        
-- -----------------------------------------------------
-- END
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=1;

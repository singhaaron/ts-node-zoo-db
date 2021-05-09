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
    ssn varchar(10) unique key,
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


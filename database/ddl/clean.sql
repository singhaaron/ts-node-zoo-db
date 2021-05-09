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
drop table if exists Takes_Care;
drop table if exists Manages;
-- -----------------------------------------------------
-- Drop Views
-- -----------------------------------------------------
drop view if exists Exhibit_Animals;
-- -----------------------------------------------------
-- Drop Indexes
-- -----------------------------------------------------
drop index IX_Animal_Names on Animals; # Reset 
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=1;
-- -----------------------------------------------------

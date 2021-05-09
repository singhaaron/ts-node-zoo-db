-- -----------------------------------------------------
-- Insert Departments 
-- -----------------------------------------------------
insert into Departments(name) values 
("Human Resource"),
("Operations"),
("Public Assistance");
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
-- Relationships (AUTOGEN: TODO) 
-- -----------------------------------------------------
insert into Lives_In(animal_id,exhibit_id) values (1,1),(2,1),(3,2),(4,3);
insert into Takes_Care(animal_id,employee_id) values (1,1),(2,1),(3,2),(4,3);
insert into Manages(employee_id,dept_id) values (1,1);
insert into Manages(employee_id,dept_id) values (2,2);
insert into Manages(employee_id,dept_id) values (3,3);
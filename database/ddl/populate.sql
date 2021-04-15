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

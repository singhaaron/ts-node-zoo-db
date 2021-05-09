-- -----------------------------------------------------
-- Relationship: Customer Visit Exhibits.
-- Constraint: Each customer can visit one exhibit at a 
-- time.
-- -----------------------------------------------------
create table Visits (
    customer_id int unique key,
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
-- Constraint: Each animal lives in only one exhibit
-- -----------------------------------------------------
create table Lives_In (
    animal_id int unique key,
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
-- Relationship: Employee Takes Care of Animal
-- Constraint: Employee can take care of many animals 
-- but only one animal can be taken care by employee.
-- -----------------------------------------------------
create table Takes_Care (
    animal_id int unique key,
    employee_id int ,
    entry_date datetime default current_timestamp,
    foreign key (animal_id)
        references Animals (animal_id)
        on delete cascade on update cascade,
    foreign key (employee_id)
        references Employees (employee_id)
        on delete cascade on update cascade
);
-- -----------------------------------------------------
-- Relationship: Employee Manages Department
-- Constraint: Department can only be managed by one Employee.
-- -----------------------------------------------------
create table Manages (
    employee_id int unique key,
    dept_id int unique key,
    foreign key (dept_id)
        references Departments (dept_id)
        on delete cascade on update cascade,
    foreign key (employee_id)
        references Employees (employee_id)
        on delete cascade on update cascade
);
-- -----------------------------------------------------
-- Relationship: Employee Cleans Exhibit
-- Constraint: Exhibits can be cleaned by many employees
-- -----------------------------------------------------
create table Cleans (
    employee_id int,
    exhibit_id int,
    foreign key (exhibit_id)
        references Exhibits (exhibit_id)
        on delete cascade on update cascade,
    foreign key (employee_id)
        references Employees (employee_id)
        on delete cascade on update cascade
);
-- -----------------------------------------------------
-- Relationship: Employee helps Customer
-- Constraint: Employees can help many customers but 
-- -----------------------------------------------------
create table Helps (
    employee_id int,
    customer_id int,
        foreign key (customer_id)
        references Customers (customer_id)
        on delete cascade on update cascade,
    foreign key (employee_id)
        references Employees (employee_id)
        on delete cascade on update cascade
);
-- -----------------------------------------------------
-- Relationship: Customer purchases Ticket
-- Constraint: Each customer can purchase at most one ticket
-- -----------------------------------------------------
create table Purchase (
    ticket_id int,
    customer_id int unique key,
        foreign key (customer_id)
        references Customers (customer_id)
        on delete cascade on update cascade,
    foreign key (ticket_id)
        references Tickets (ticket_id)
        on delete cascade on update cascade
);


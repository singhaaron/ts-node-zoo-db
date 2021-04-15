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
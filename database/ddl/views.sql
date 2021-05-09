-- -----------------------------------------------------
-- Animal @ Exhibits Descriptions
-- -----------------------------------------------------
create view Exhibit_Animals as
select 
    Animals.type,
    Animals.name,
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
-- Access Views 
-- -----------------------------------------------------
select * from Exhibit_Animals;
select * from Animals;
select * from Exhibits;
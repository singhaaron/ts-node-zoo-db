-- -----------------------------------------------------
-- Index: Non-Clustered Index Btree on Name
-- Animals : Clustered Index by Default (primary key = animal_id)
-- -----------------------------------------------------
select * from Animals where name = 'Karlotta'; # O(n) Scan Before Index
select * from Animals where Animals.animal_id = 4; # O(1) Scan by default because clustered index
#create index IX_Animal_Names using hash on Animals (name); # Not supported on SQL V8?
create index IX_Animal_Names using btree on Animals (name); # Noice O(1) 
show index from Animals; # Description about Index on table Animals


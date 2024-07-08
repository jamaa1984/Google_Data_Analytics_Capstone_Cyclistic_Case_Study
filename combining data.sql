Use Cyclistic
go
-- Insert all data of all tables in the the first one
insert into tripdata23_01
select *
from tripdata23_02

insert into tripdata23_01
select *
from tripdata23_03

insert into tripdata23_01
select *
from tripdata23_04

insert into tripdata23_01
select *
from tripdata23_05

insert into tripdata23_01
select *
from tripdata23_06

insert into tripdata23_01
select *
from tripdata23_07

insert into tripdata23_01
select *
from tripdata23_08

insert into tripdata23_01
select *
from tripdata23_09

insert into tripdata23_01
select *
from tripdata23_10

insert into tripdata23_01
select *
from tripdata23_11

insert into tripdata23_01
select *
from tripdata23_12

--Change the name of database to 'combined_tripdata23'
-- checking no of rows which are 5719877

select count(*) 
from combined_tripdata23
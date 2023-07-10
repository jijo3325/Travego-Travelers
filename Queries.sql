use Travego;
-- Perform read operation on the designed table created in the above task
select * from passenger;
select * from Price;
-- a.How many female passengers traveled a minimum distance of 600KMs?
select  count(*) as no_of_passengers 
from passenger 
where Gender='F'and Distance >=600;
-- b.Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus.
select * from passenger 
where Distance>500 and Bus_type='Sleeper';
-- c.Select passenger names whose names start with the character'S'
select passenger_name from passenger 
where passenger_name like 'S%';
-- d.Calculate the price charged for each passenger,displaying the Passenger name,BoardingCity,DestinationCity,Bustype,and Price in the output.
alter table Price add Primary key (id);
alter table Passenger add foreign key(passenger_id) references price(id);
select a.passenger_name,a.Boarding_city,a.Destination_city,a.Bus_type,b.Price 
from Passenger as a
join Price as b
on a.Distance=b.Distance;
-- e.What are the passenger name(s) and the ticket price for those who traveled 1000KMs Sitting in a bus?
Select a.Passenger_name, a.Boarding_city, a.Destination_city, a.Bus_type, b.Price 
from passenger as a
join  price as b
on a.Distance=b.Distance
where a.Distance = 1000 and a.Bus_type = 'Sitting';
-- f.What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
Select a.Passenger_name,a.Destination_city as Boarding, a.Boarding_city as Destination, a.Bus_type, b.Price 
from passenger as a
join  price as b
on a.Distance=b.Distance
where passenger_name='Pallavi';
-- g.Alter the column category with the value "Non-AC" where the Bus_Type is sleeper
update passenger set category='Non-AC' where Bus_type = 'Sleeper';
-- h.Delete an entry from the table where the passenger name is Piyush and commit this change in the database.
set autocommit=0;
commit;
delete from passenger where passenger_name='Piyush';
-- i.Truncate the table passenger and comment on the number of rows in the table
truncate table passenger;
select * from passenger; -- 0 rows where returned.
-- j.Delete the table passenger from the database
drop table passenger;


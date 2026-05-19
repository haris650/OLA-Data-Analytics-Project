create database OLA;
use OLA;

-- 1. Retrieve all successful bookings

create view Successful_Bookings as
select *
from Bookings
where Booking_Status = 'Success';

select * from Successful_Bookings;

-- ------------------------------------------------------------

-- 2. Find the average ride distance for each vehicle type

create view Ride_Distance_For_Each_Vehicle as
select 
    Vehicle_Type,
    avg(Ride_Distance) as Avg_Distance
from Bookings
group by Vehicle_Type;

select * from Ride_Distance_For_Each_Vehicle;

-- ------------------------------------------------------------

-- 3. Get total number of rides cancelled by customers

create view Cancelled_By_Customer as
select 
    count(*) as Total_Cancelled_Rides
from Bookings
where Booking_Status = 'Canceled by Customer';

select * from Cancelled_By_Customer;

-- ------------------------------------------------------------

-- 4. List top 5 customers who booked highest number of rides

create view Top_5_Customers as
select 
    Customer_ID,
    count(Booking_ID) as Total_Rides
from Bookings
group by Customer_ID
order by Total_Rides desc
limit 5;

select * from Top_5_Customers;

-- ------------------------------------------------------------

-- 5. Get number of rides cancelled by drivers due to
-- personal and car related issues

create view Driver_Cancelled_Rides as
select 
    count(*) as Total_Cancelled_Rides
from Bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from Driver_Cancelled_Rides;

-- ------------------------------------------------------------

-- 6. Find maximum and minimum driver ratings
-- for Prime Sedan

create view Max_Min_Driver_Rating as
select 
    max(Driver_Ratings) as Max_Rating,
    min(Driver_Ratings) as Min_Rating
from Bookings
where Vehicle_Type = 'Prime Sedan';

select * from Max_Min_Driver_Rating;

-- ------------------------------------------------------------

-- 7. Retrieve all rides where payment method was UPI

create view UPI_Payments as
select *
from Bookings
where Payment_Method = 'UPI';

select * from UPI_Payments;

-- ------------------------------------------------------------

-- 8. Find average customer rating for each vehicle type

create view Avg_Customer_Rating as
select 
    Vehicle_Type,
    avg(Customer_Rating) as Avg_Rating
from Bookings
group by Vehicle_Type;

select * from Avg_Customer_Rating;

-- ------------------------------------------------------------

-- 9. Calculate total booking value of successful rides

create view Total_Successful_Rides_Value as
select 
    sum(Booking_Value) as Total_Value
from Bookings
where Booking_Status = 'Success';

select * from Total_Successful_Rides_Value;

-- ------------------------------------------------------------

-- 10. List all incomplete rides with reason

create view Incomplete_Rides as
select 
    Booking_ID,
    Incomplete_Rides_Reason
from Bookings
where Incomplete_Rides = 'Yes';

select * from Incomplete_Rides;
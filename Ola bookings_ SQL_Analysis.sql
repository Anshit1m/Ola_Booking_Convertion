create database Ola;
use Ola;

#sucsessfull bookings
create view Sucessful_bookings as
select*from bookings where Booking_Status = 'Success';

#average ride distance
create view ride_distance_for_each_vehicle as
select Vehicle_Type, Avg(Ride_Distance) as avg_distance From bookings group by Vehicle_type;

#Total number of canceled rides
create view canceled_rides_by_customers as
select count(*) from bookings where Booking_Status = 'Canceled by Customer';

#top 5 customer with higest number of bookings
create view Top_5_Customers as
select Customer_ID, count(Booking_ID) as total_rides from bookings group by Customer_ID order by total_rides DESC limit 5;

# rides canceled by drivers due to personal and car-related issues
create view Rides_Canceled_by_Drivers_P_C_issues as
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Perosnal & Car related issue';

#max and min rated drivers in Prime Sedan
create view Max_Min_Driver_Rating as
select max(Driver_Ratings) as max_rating, min(Driver_Ratings) as min_rating
from bookings where Vehicle_type = 'Prime Sedan';

#Rides with Upi payments
create view UPI_Payment as
select*from bookings
where Payment_Method ='UPI'; 

#average customer rating per vehicle type
create view AVG_Cust_Rating as
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
from bookings group by Vehicle_Type;

#All Completed rides
create view Total_successful_Rides_value as
select sum(Booking_Value) as Total_successful_Rides_value from bookings where Booking_Status= 'Success';

#ALL incomplete rides
create view Incomplete_Rides_Reason as
select Booking_ID, Incomplete_Rides_Reason
From bookings
where Incomplete_rides = 'Yes';




#Summary

select*from Sucessful_bookings;

select*from ride_distance_for_each_vehicle;

select*from canceled_rides_by_customers;

select*from Top_5_Customers;

select*from Rides_Canceled_by_Drivers_P_C_issues;

select*from Max_Min_Driver_Rating;

select*from UPI_Payment;

select*from AVG_Cust_Rating;

select*from Total_successful_Rides_value;

select*from  Incomplete_Rides_Reason;
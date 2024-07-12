
-- Analyze Phase --

-- Total Number of Riders

SELECT COUNT(ride_id)
FROM combined_tripdata23 --4328676 rider

-- Total Number of Riders by member and casual users
SELECT 
COUNT(ride_id) AS no_of_riders,
member_casual
FROM combined_tripdata23
GROUP BY 
member_casual;

-- Total Ride Length in minutes

SELECT SUM((DATEDIFF(minute, 0, ride_length))) / 60 AS Total_Hours
FROM combined_tripdata23


-- Average time

SELECT AVG((DATEDIFF(minute, 0, ride_length))) AS Avg_time
FROM combined_tripdata23

-- Max time
SELECT MAX((DATEDIFF(minute, 0, ride_length))) AS Avg_time 
FROM combined_tripdata23

-- Min time Min
SELECT Min((DATEDIFF(minute, 0, ride_length))) AS Avg_time 
FROM combined_tripdata23

-- Average ride length by member and casual users

SELECT AVG((DATEDIFF(minute, 0, ride_length))) AS Avg_time,
member_casual
FROM combined_tripdata23
GROUP BY 
member_casual;

-- Total Number of Riders by Bike type and User type (member, casual)
SELECT
COUNT(ride_id) AS no_of_riders,
rideable_type,
member_casual
FROM combined_tripdata23
GROUP BY 
rideable_type,
member_casual
ORDER BY 
COUNT(ride_id) DESC;

-- Total Number of Riders by Month and User type (member, casual)
SELECT
COUNT(ride_id) AS no_of_riders,
MONTH(started_at) AS month,
member_casual
FROM combined_tripdata23
GROUP BY 
MONTH(started_at),
member_casual
ORDER BY 
MONTH(started_at),
member_casual

-- To find out which user type used which type of bike each month, use this code
SELECT
  YEAR(started_at) AS year,
  MONTH(started_at) AS month,
  COUNT(*) AS ride_amount,
  rideable_type,
  member_casual
  FROM
  combined_tripdata23
  GROUP BY  
  YEAR(started_at),
  MONTH(started_at), 
  member_casual, 
  rideable_type
  ORDER BY 
  YEAR(started_at),
  MONTH(started_at);

  -- Total number of riders by weekday and user type

  SELECT 
  COUNT(ride_id) as no_riders,
  DATEPART(WEEKDAY, started_at) as day_of_week,
  member_casual
  FROM combined_tripdata23
  GROUP BY DATEPART(WEEKDAY, started_at),
  member_casual 
  ORDER BY COUNT(ride_id) DESC

  -- Total number of riders by start time and user type during a day

  SELECT 
  COUNT(ride_id) as no_riders,
  DATEPART(HOUR, started_at) as started_hour,
  member_casual
  FROM combined_tripdata23
  GROUP BY member_casual, DATEPART(HOUR, started_at)
  ORDER BY COUNT(ride_id) desc

  -- Mostly used stations
-- Top 10 mostly used Start Stations by Member and Casual users --

SELECT TOP 10
COUNT(ride_id) as no_riders,
start_station_name,
member_casual
FROM combined_tripdata23
GROUP BY start_station_name,member_casual
ORDER BY COUNT(ride_id) DESC

-- Top 10 mostly used End Stations by Member and Casual users --
SELECT TOP 10
COUNT(ride_id) as no_riders, 
end_station_name,
member_casual
FROM combined_tripdata23
GROUP BY end_station_name, member_casual
ORDER BY COUNT(ride_id) DESC

-- Average journey time by month 
-- calculate the average journey time by month from. Journey time is presented in minutes and seconds
SELECT  
member_casual,
ROUND(AVG(DATEDIFF(minute, 0, ride_length) + 
   (DATEDIFF(second, 0, ride_length)
   / 60.0)), 2) AS journey_time,
YEAR(started_at) AS year,
MONTH(started_at) AS month
FROM combined_tripdata23
GROUP BY
   member_casual,
YEAR(started_at),
MONTH(started_at)
ORDER BY 
ROUND(AVG(DATEDIFF(minute, 0, ride_length) + 
   (DATEDIFF(second, 0, ride_length)
   / 60.0)), 2) DESC

-- calculate the average journey time by week
SELECT  
member_casual,
ROUND(AVG(DATEDIFF(minute, 0, ride_length) + 
   (DATEDIFF(second, 0, ride_length)
   / 60.0)), 2) AS avg_journey_time,
day_of_week,
member_casual
FROM combined_tripdata23
GROUP BY
   member_casual,
  day_of_week
ORDER BY 
ROUND(AVG(DATEDIFF(minute, 0, ride_length) + 
   (DATEDIFF(second, 0, ride_length)
   / 60.0)), 2) DESC

-- calculate the average journey time by day
SELECT
COUNT(ride_id) AS no_of_users,
DATEPART(HOUR, started_at) as started_hour,
member_casual
From combined_tripdata23
GROUP BY 
member_casual,
DATEPART(HOUR, started_at)
ORDER BY DATEPART(HOUR, started_at) ;


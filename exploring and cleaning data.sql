-- Data Exploration

-- checking the data types of all columns

SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, COLUMN_DEFAULT, DATA_TYPE
FROM Cyclistic.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'combined_tripdata23';


-- checking for duplicate rows

SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM combined_tripdata23;

-- Deleting unnecessary columns, 'start_station_id' & 'end_station_id'

ALTER TABLE combined_tripdata23
DROP COLUMN start_station_id;

ALTER TABLE combined_tripdata23
DROP COLUMN end_station_id

-- ride_id - all have length of 16

SELECT LEN(ride_id) AS ride_id_length, count(ride_id) as no_of_rows
FROM Cyclistic..combined_tripdata23
GROUP BY ride_id
order by ride_id asc

-- rideable_type - 3 unique types of bikes

select distinct(rideable_type), count(rideable_type) as no_of_trips
from Cyclistic..combined_tripdata23
group by rideable_type

-- Rename and change Data Type
alter table combined_tripdata23
alter column started_at datetime

alter table combined_tripdata23
alter column ended_at datetime

-- Checking Duration

SELECT started_at, ended_at,
DATEDIFF(minute, started_at, ended_at)
from combined_tripdata23
order by started_at




-- Process Phase --
-- Identify, count and remove Null values
-- Counting NULL values for the specific column. At this step you should count the NULLs for each column separately.
SELECT COUNT(*) AS ride_idNULL
FROM combined_tripdata23
WHERE
  ride_id IS NULL

  SELECT COUNT(*) AS rideable_typeNULL
FROM combined_tripdata23
WHERE
  rideable_type IS NULL

SELECT COUNT(*) AS started_atNULL
FROM combined_tripdata23
WHERE
  started_at IS NULL


  SELECT COUNT(*) AS ended_atNULL
FROM combined_tripdata23
WHERE
  ended_at IS NULL

  SELECT COUNT(*) AS start_station_nameNULL
FROM combined_tripdata23
WHERE
  start_station_name IS NULL

  SELECT COUNT(*) AS end_station_nameNULL
FROM combined_tripdata23
WHERE
  end_station_name IS NULL

  SELECT COUNT(*) AS start_latNULL
FROM combined_tripdata23
WHERE
  start_lat IS NULL

   SELECT COUNT(*) AS start_lngNULL
FROM combined_tripdata23
WHERE
  start_lng IS NULL

   SELECT COUNT(*) AS end_latNULL
FROM combined_tripdata23
WHERE
  end_lat IS NULL


  SELECT COUNT(*) AS end_lngNULL
FROM combined_tripdata23
WHERE
  end_lng IS NULL

  
  SELECT COUNT(*) AS member_casualNULL
FROM combined_tripdata23
WHERE
  member_casual IS NULL

 --Identify, count and remove blanks columns

 --identify
select *
from combined_tripdata23
where isnull(start_station_name, '') =''
	or isnull(end_station_name,'')= ''
	or isnull(end_lng, '')= ''
 --Counting NULL values for the specific column in other ways to see the global columns. For tripdata of 2023 there is no null value at all columns,but there is 1 387 718 rows contain empty values
 
select count(start_station_name)as start_station_nameBlanks, count(end_station_name)as end_station_nameBlanks, count(end_lng)as end_lngBlanks, count(end_lat) as end_latBlanks
from combined_tripdata23
where isnull(start_station_name, '') ='' 
	or isnull(end_station_name,'')= '' 
	or isnull(end_lng, '')= '' 

-- Removing NULL values from these tree columns
DELETE FROM combined_tripdata23
WHERE
isnull(start_station_name, '') ='' 
	or isnull(end_station_name,'')= '' 
	or isnull(end_lng, '')= '' -- 1387718 rows are removed(table contains after this process 4331890)

select count(*)
from combined_tripdata23
 --Counting NULL values for the specific column in other ways to see the global columns.
select count(*) - count(ride_id) ride_id,
	count(*) - count(rideable_type) rideable_type,
	count(*) - count(started_at) started_at,
	count(*) - count(ended_at) ended_at,
	count(*) - count(start_station_name) start_station_name,
	count(*) - count(end_station_name) end_station_name,
	count(*) - count(start_lat) start_lat,
	count(*) - count(start_lng) start_lng,
	count(*) - count(end_lat) end_lat,
	count(*) - count(end_lng) end_lng,
	count(*) - count(member_casual) member_casual
	from combined_tripdata23


-- In this query I checked for any logical errors in the dataset, for example, 
I found that the end time of the ride was less than the start time. 
There were 269 such records
-- Count
SELECT COUNT(*)
FROM combined_tripdata23
WHERE started_at > ended_at

-- Review
SELECT started_at,
  ended_at
FROM combined_tripdata23
WHERE started_at > ended_at

--delete

DELETE FROM combined_tripdata23
WHERE started_at > ended_at

-- Creating ‘ride_length’ column which is a difference between end time and start time. 
ALTER TABLE combined_tripdata23
ADD ride_length TIME;


UPDATE combined_tripdata23
SET ride_length = CONVERT(TIME, ended_at - started_at)


-- Review the Table

select *
from combined_tripdata23
order by started_at desc

-- Deleting rows from the ‘ride_length’ column where the ride length was less than or equal to 1 minute.
SELECT COUNT(*)
FROM combined_tripdata23
WHERE ride_length <= '00:01:00';

-- Also delete rows from the ‘ride_length’ column where the ride length was more than 10 hours
-- Checking
SELECT ride_length
FROM combined_tripdata23
WHERE ride_length 

-- Delete
DELETE FROM combined_tripdata23
WHERE ride_length >= '10:01:00' --3214 rows removed


-- Creating ‘day_of_week’ column which is formatted from ‘started_at’ column as a number counting from Sunday as 1 to Saturday as 7

ALTER TABLE combined_tripdata23
ADD day_of_week INTEGER; 

UPDATE combined_tripdata23 
SET day_of_week = DATEPART(WEEKDAY, started_at);

-- This query checks the count of rows that have missing values in one or more of the specified columns, with the alias ‘missing_values’
SELECT
  COUNT(*) - COUNT(CASE
    WHEN ride_id IS NOT NULL
      AND rideable_type IS NOT NULL
      AND started_at IS NOT NULL
      AND ended_at IS NOT NULL
      AND member_casual IS NOT NULL
    THEN 1
    ELSE NULL
  END) AS missing_values
FROM combined_tripdata23 -- 0 missing value

![image](https://github.com/jamaa1984/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/Cyclistic.png)
# Cyclistic Case Study: Google Data Analytics Capstone
## Study Riders Behavior
------------------------------
###### Author : Alhyane Jamaa

###### Last Updated: July 2024
------------------------------
## Scenario
You are a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share
company in Chicago. The director of marketing believes the company’s future success
depends on maximizing the number of annual memberships. Therefore, your team wants to
understand how casual riders and annual members use Cyclistic bikes differently. From these
insights, your team will design a new marketing strategy to convert casual riders into annual
members. But first, Cyclistic executives must approve your recommendations, so they must be
backed up with compelling data insights and professional data visualizations.


## About the company

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown
to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations
across Chicago. The bikes can be unlocked from one station and returned to any other station
in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to
broad consumer segments. One approach that helped make these things possible was the
flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships.
Customers who purchase single-ride or full-day passes are referred to as casual riders.
Customers who purchase annual memberships are Cyclistic members.

Quick links:
Data Source: divvy_tripdata [accessed on 04/03/23]

SQL Queries:
01. Data Combining
02. Data Exploration & Cleaning
04. Data Analysis

Data Visualizations: PowerBi

## Business Task 
Design marketing strategies aimed at converting casual riders into annual members

## Ask 
The financial team at Cyclistic has recently concluded that annual members are far more profitable to the company than are casual riders. Subsequently, the marketing team has identified maximizing the number of annual memberships as a key goal for the company's success. They want to design a new marketing strategy to convert casual riders into annual members since individuals in this demographic are already aware of the Cyclistic program and have chosen it at some point for their transportation needs in the past.

In order to do this, the marketing team first wants to understand how these different customer types are currently using Cyclistic bikes. They have identified the following questions to guide the future of their marketing program:

1. How do annual members and casual riders use Cyclistic differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

## Prepare
Data source link: https://divvy-tripdata.s3.amazonaws.com/index.html

In this data analytics project, Cyclistic stores its data on Amazon Web Services (AWS) in zipped comma-separated values (CSV) files. For the year 2023, the data is organized by month.

This case study focuses on data from January 2023 to December 2023. Since I am utilizing first-party data, it is original, current, and properly cited. Additionally, the data is anonymized, as it does not include personally identifiable information.

I am using Microsoft SQL Server Management Studio in this part of the project to help process and analyze the datasets.

First downloaded all of the .csv files and stored it locally in a folder on my system. I made sure to import all of the datasets as a .csv file to the database server. Checked and verified if the data types of each of the columns in each dataset is same to merge them all together.

## Process 
The data processing was conducted in two phases.

In the first phase, Excel was utilized to organize all data into tables, which were then saved for the subsequent phase of analysis. This involved opening each monthly file from the year 2023 and ensuring the data was properly structured in a table format with appropriate headings. The files were saved in (.csv) format to facilitate easy upload into Microsoft SQL Server Management Studio.

The second phase of analysis employed Microsoft SQL Server Management Studio to clean and prepare the data for analysis. Initially, I imported all datasets (.csv) into the database server. I then checked and verified that the data types of each column in each dataset were consistent to enable seamless merging into a comprehensive dataset for the year 2023. The following SQL queries were used in the attached files. 

## Analyze
The data has been prepared, cleaned, and processed, and is now ready for analysis. Calculations will be conducted on the cleaned and consistent data to identify trends, relationships, and patterns. This analysis aims to establish the differences between casual riders and annual members. The attached Analysis file will show the steps completed during this phase. 

## Data Visualizations
### Dashboard
![image](https://github.com/jamaa1984/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/Dashboard.png)

### Notes
![image](https://github.com/jamaa1984/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/Notes.png)

Data visualization: https://app.powerbi.com/links/bXbrwfZt7Z?ctid=3dfa5879-476f-45b4-8079-fe60eaf3f8a5&pbi_source=linkShare&bookmarkGuid=2b7fc658-8aee-4991-b3b2-d87d3bbddd50

## Recommendation

#### Cyclistic User Insights and Marketing Strategy

Annual members are Cyclistic's core user base, relying on the bikes for daily commutes and contributing a higher percentage of total bike usage.
Casual riders, more prevalent on weekends and during summer due to holidays, surprisingly have the longest average trip durations, with average of 14,78 minutes.

#### Targeted Marketing Strategy to Convert Casual Riders

Campaign Timing: Target digital ads on Saturdays and during summer to reach casual riders when they are most active.

Summer Holiday Bonus: Offer limited-time discounts on annual subscriptions to incentivize conversions during the peak summer season.

Post-Campaign Strategy: After the summer campaign, promote regular subscription plans through targeted ads on Saturdays to both casual riders and the general public.

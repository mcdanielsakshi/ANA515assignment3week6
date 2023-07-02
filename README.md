# ANA515assignment3week6
ANA 515 Assignment 3 Getting and Cleaning Data
Due end of week 6
60 points
Overview
We’ll be using some data from NOAA’s Storm Events Database. This data lists major weather-related storm events since 1950. For each event, it includes information like the start and end dates, where it happened, associated deaths, injuries, and property damage, and some other characteristics. Each row is a separate event. However, often several events are grouped together within the same episode. Some of the event types are listed by their county ID (FIPS code) (“C”), but some are listed by a forecast zone ID (“Z”). Which ID is used is given in the column CZ_TYPE. 
I have prepared a tutorial to walk you through these steps. You can try it on your own first, and if you get stuck check out the tutorial. The tutorial is linked in the classroom in the assignment description. 
Directions:
1.	Go to https://www1.ncdc.noaa.gov/pub/data/swdi/stormevents/csvfiles/ and download the bulk storm details data for the year you were assigned, in the file that starts “StormEvents_details” and includes “dXXXX”. For example, it looks like this for 2017:  
  
*Make sure it is the details file, not fatalities or locations
Move this into a good local directory for your current working directory and read and save it. (5 points)
2.	Limit the dataframe to the following columns: (10 points)
•	BEGIN_YEARMONTH
•	EPISODE_ID
•	STATE
•	STATE_ FIPS
•	CZ_NAME (this is the county name)
•	CZ_TYPE
•	CZ_FIPS
•	EVENT_TYPE

3.	Arrange the data by the state name (STATE) (5 points) 

4.	Change state and county names to title case (e.g., “New Jersey” instead of “NEW JERSEY”) (5 points) 

5.	Limit to the events listed by county FIPS (CZ_TYPE of “C”) and then remove the CZ_TYPE column (5 points) 

6.	Pad the state and county FIPS with a “0” at the beginning (hint: there’s a function in stringr to do this) and then unite the two columns to make one FIPS column with the new state-county FIPS code (5 points) 

7.	Change all the column names to lower case (you may want to try the rename_all function for this) (5 points) 

8.	There is data that comes with base R on U.S. states (data("state")). Use that to create a dataframe with these three columns: state name, area, and region (5 points)

9.	Create a dataframe with the number of events per state. Merge in the state information dataframe you just created in step 8. Remove any states that are not in the state information dataframe. (5 points) 

10.	Create the following plot (10 points): 
  
 
11.	Create a new repository in your GitHub (ANA 515 Assignment 3) and upload your code file. 
Include a Readme file as well. 
Include a screenshot or output file of the plot. 
You should have 3 files in the new repository.

12.	Submit your GitHub link to the assignments page in the Blackboard course site. 

Remember, there is a tutorial linked in the assignment description if you get stuck. 

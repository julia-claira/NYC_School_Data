# project2_groupE_nyc
Members: Jorene, Julia, Holly, Galen
         
                                                           
# Project Overview:

Using kaggle.com and Socrata Open Data API we aim to look at 4 data sets regarding the NYC Public School system. In general, each person was responsible for one dataset to transform and clean. Transformations included dropping columns that were across datasets, renaming columns, and dropping rows that were duplicates or contained null values. We created small, useful tables to work with in addition to merging all these tables together into one big table on the school ID.

# File explanation:<br> 
Files in main folder:<br> 
	.gitignore - contains git ignore items<br> 
	README.md - author: all<br> 
	  This file with all the details about all the other files and some thoughts about our resources and process.<br> 
  Attendance_tables.sql - author: Julia (with group input)<br> 
	  All the individual sql code from everyone’s files added into one file.<br> 
  Nyc_schools2.ipynb - author: Julia (with group input)<br> 
	  Adding all the code from everyone’s individual jupyter notebooks and then 
	  Doing some more clean up and merging the tables together.<br> 
  Proj_2_table_joins.sql - author: Julia (with group input)<br> 
    SQL file of all our tables joined into one big table.<br> 

Resources Folder - contains all csv files used for clean up.<br> 

backup folder - contains all individually created jupyter notebooks from all branches<br> 
  ETL_Scores.ipynb - author: Galen<br>   
    Notebook to clean up School_ELA.csv.<br> 
	ETL Project_SchoolDirectory_and_Safetly.ipynb - author:Jorene<br> 
	NYC SAT Cleanup.ipynb - author: Holly<br> 
    Cleanup of scores.csv.<br> 
  NYC_holly_sqlTables.txt - author: Holly<br>  
    Put sql table creation file into .txt for easier work if Julia needed it for merging.<br> 
	NYC_school_stats.sql - author: Holly<br> 
		SQL file with schema of all databases created based on scores.csv<br> 
  Nyc_attendance_school.ipynb - author: Julia<br> 
  Proj_2_table_joins.sql - author: Julia (with group input)<br> 
	  SQL file which created the main table joining <br> 
		
	 

# Datasets Extracted:<br> 
High school directory(Jorene):  https://www.kaggle.com/new-york-city/nyc-high-school-director<br> 
  Dropped columns<br> 
Data.cityofnewyork.us (Julia) - school attendance<br> 
School Safety report (Jorene): https://www.kaggle.com/new-york-city/ny-2010-2016-school-safety-report?select=2010-2016-school-safety-report.csv <br> 
  Dropped columns<br> 
  Dropped duplicates<br> 
  Dropped rows with missing data<br> 
  Calculate a total school crime count<br> 
SAT scores (Holly): https://www.kaggle.com/nycopendata/high-schools<br> 
  Split file into tables: locations, students, SAT scores, cleaned_df<br> 
  Dropped duplicates and rows with null values<br> 
  Created sql file with schema of all tables<br>  
ELA Scores (Galen): https://www.kaggle.com/new-york-city/nyc-school-district-breakdowns<br> 
  Dropped rows not in relevant years, dropped redundant columns and found mean for multiple test-taking scores in the relevant year. Rows were   removed when attendance was too low, so there were uneven numbers of scores. 
		


# Individual ETL Process:


## Jorene high school directory and school safety

Extract: The datasets were downloaded as CSVs files from Kaggle. The files were imported into a Jupyter Notebook using Pandas. 

Transform: Both the school directory list and the safety report contained several columns of information. The school directory was paired down to school id, school name, borough, and total total students. The school safety data was reduced to school id, building code, location name, number of major crimes [Major N], number of other crimes [Oth N], number of non-criminal crimes [NoCrim N], property crimes [Prop C], and violent crimes [VioN].   Duplicates and records with missing data points were dropped. The total number of crimes for each school was calculated by summing all crime totals for the school. For both sets of data column names were changed to better match those of the other data sets. 

Load: The notebook was loaded into the project repo so it could be joined with the rest of the team’s files.  Individual notebooks were merged with nbmerge, and additional cleaning was done.  We created schemas for each of our databases in PgAdmin.  We used an inner join on school id to pull information from each individual dataset to generate a one table that shows facts about each school. 


## Holly SAT Scores

Extract: 
I used one dataset I found on Kaggle containing NYC school by id information such as: school location information, school breakdown of ethnicity, and average SAT scores for 2015

Transform:
After loading the csv into Jupyter notebooks, I created dataframes for:  location info, SAT scores, ethnicity. For each of these data frames I dropped NA and duplicates along with renaming columns to be more visually pleasing. I created a file to match the dataframes I created in SQL. 

Load: Uploaded to my branch in the github repo for Julia to pull and merge together with the other notebooks. We worked on it together through screen sharing. This allowed not just one person to have to the the bulk of the merging and while she was typing, we could be looking up the next steps.
	
## Julia School Attendance in NYC 2015-2018
 
Extract: Originally I was going to use a csv file found on Kaggle, however, it only covered the 2011 school year, which felt limiting. After a brief Google search I came across the NYC Open Data site (https://data.cityofnewyork.us/ ) with more up-to-date records and over a wider timespan. I was able to pull the data by importing the Socrata module (Socrata Open Data API) into my Python script.
 
 
Transform: This provided me with daily attendance reports for all NYC schools from 2015-2018. I began by grouping the data by ‘school id’ and ‘school year’ to find the average tally for present students and absent students. I dropped the ‘released column’ as the numbers seemed insignificant. After discussing with my team, I decided to further group the data only by school id, effectively getting the average tally over the whole three year span, instead of on a year by year basis. From here I added a column where I calculated the percentage of absent students for each school, as this allowed for a quicker side-by-side comparison. Finally I indexed the table by school id, as this was the common factor for joining with my other team members’ data.
 
 
Load: We merged our separate Jupyter Notebooks together using nbmerge in Terminal. Once merged, we did some additional cleaning and unifying of column names. After generating the frameworks for the final tables in PgAdmin, we uploaded our transformed databases into them. In PgAdmin, we joined the tables into one using ‘school id’ as the common index. For this we used an inner join, as we were only interested in the schools that had data in all tables. Finally, after more discussion we dropped some columns that felt less relevant to the broader picture.


## Galen ELA Scores:

Extract: Dataset was available as a large csv through Kaggle (https://www.kaggle.com/debanjanpaul/school-ela-results-20132017-public) , and is a collection of dated average scores for ELA (English Language Arts) tests. The csv had some irregularities that were immediately visible, such as a large amount of placeholder strings in the test score column and variable amounts of rows per school.

Transform: To make the scores relevant to the data being pulled by my teammates, I dropped all rows not belonging to 2015, when most of the testing in the 2015-16 school year we are measuring was done. I dropped all rows containing placeholder values, and averaged the mean of each year of testing for each school. The only column that matched as a key, because of variable capitalizing and spelling on school names, was the school ID. Before pushing the table to merge, I ensured there was only one redundant column for the purpose of joining, and excluded much of the original data’s geolocations etc. 

Load: The notebook and tables were merged together with nbmerge, and then the tables were generated in PGAdmin. Although the dataset included many more schools than the table we were working on, merging on the common school ID’s allowed the score to merge with the rest of our NYC high-school informational table. Once the greater tables were put together, we worked on removing redundant columns (boroughs were named twice) and other information like the location of the state, which is all the same for schools in NYC. 

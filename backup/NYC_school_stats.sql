create table cleaned_df
	(School_ID varchar(10),
	 School_Name varchar(10),
	 Borough varchar(20),
	 Street_Address varchar,
	 City varchar,
	 State char(2),
	 Zipcode integer,
	 Latitude decimal,
	 Longitude decimal,
	 Start_Time time,
	 End_Time time,
	 Enrollment integer,
	 White Varchar,
	 Black varchar,
	 Hispanic varchar,
	 Asian varchar,
	 Avg_Score_Math integer,
	 Avg_Score_Reading integer,
	 Avg_Score_Writing integer,
	 Percent_tested varchar
	);

create table locations
	(School_ID varchar(10) primary key,
	 School_Name varchar(10),
	 Borough varchar(20),
	 Street_Address varchar,
	 City varchar,
	 State char(2),
	 Zipcode integer,
	 Latitude decimal,
	 Longitude decimal);

create table students
	(School_ID varchar(10) references locations,
	 Enrollment integer,
	 White Varchar,
	 Black varchar,
	 Hispanic varchar,
	 Asian varchar
	);

create table SAT
	(School_ID varchar(10) references locations,
	 Avg_Score_Math integer,
	 Avg_Score_Reading integer,
	 Avg_Score_Writing integer,
	 Percent_tested varchar);

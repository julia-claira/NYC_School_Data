-->Julia
create table school_attendance (
	"school id" VARCHAR PRIMARY KEY,
	enrolled_2015_2018 INT,
	present_2015_2018 INT,
	absent_2015_2018 INT,
	attendance_prc float);
	
-->Jorene
Create Table schools(
	"school id" varchar Primary Key,
	school_name varchar,
	borough varchar,
	total_students float
	);

-->Jorene
Create Table safety(
	"school id" varchar Primary Key,
	"Building Code" varchar,
	"Location Name" varchar,
	"Major N" float,
	"Orth N" float,
	"NoCrim N" float,
	"Prop N" float,
	"Vio N" float,
	total_crime float
	);

-->Holly
create table cleaned_df
	("school id" varchar(10),
	 "School Name" varchar,
	 "Borough" varchar(20),
	 "Building Code" varchar,
	 "Street Address" varchar,
	 "City" varchar,
	 "State" char(2),
	 "Zip Code" integer,
	 "Latitude" decimal,
	 "Longitude" decimal,
	 "Start Time" varchar,
	 "End Time" varchar,
	 "Enrollment" integer,
	 "White" Varchar,
	 "Black" varchar,
	 "Hispanic" varchar,
	 "Asian" varchar,
	 "Avg Score Math" integer,
	 "Avg Score Reading" integer,
	 "Avg Score Writing" integer,
	 "Tested Percent" varchar
	);

--Holly>
create table SAT_Scores as
select a."school id", a."Avg Score Math", a."Avg Score Reading", a."Avg Score Writing",
a."Tested Percent"
from cleaned_df as a

--Holly>
create table students_breakdown as
select a."school id", a."Enrollment", a."White",a."Black", a."Hispanic",
a."Asian"
from cleaned_df as a

--Holly>
create table school_location as
select a."school id",a."School Name",a."Borough",a."Building Code",
a."Street Address",a."City",a."State",a."Zip Code",a."Latitude",
a."Longitude",a."Start Time", a."End Time"
from cleaned_df as a

-->Galen
Create Table school_scores(
	"school id" varchar Primary Key,
	"Mean Scale Score" float,
	"School Name" varchar,
	"Year" int
	);
	












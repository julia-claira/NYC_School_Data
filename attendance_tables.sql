create table school_attendance (
	"school id" VARCHAR PRIMARY KEY,
	enrolled_2015_2018 INT,
	present_2015_2018 INT,
	absent_2015_2018 INT,
	attendance_prc float);

	
drop table school_attendance


Create Table schools(
	"school id" varchar Primary Key,
	school_name varchar,
	borough varchar,
	total_students float
	);
		
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
	










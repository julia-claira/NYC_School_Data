create table school_attendance (
	school_id VARCHAR PRIMARY KEY,
	enrolled_2015_2016 INT,
	present_2015_2016 INT,
	absent_2015_2016 INT,
	enrolled_2016_2017 INT,
	present_2016_2017 INT,
	absent_2016_2017 INT,
	enrolled_2017_2018 INT,
	present_2017_2018 INT,
	absent_2017_2018 INT,
	enrolled_overall INT,
	present_overall INT,
	absent_overall INT);
	
create table school_attendance_2015_16 (
	school_id VARCHAR PRIMARY KEY,
	enrolled_2015_2016 INT,
	present_2015_2016 INT,
	absent_2015_2016 INT);
	
select * from school_attendance_2015_16




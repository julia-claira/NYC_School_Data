create view joined_ny_table as
select a."school id",a."School Name",a."Borough",a."Building Code",
a."Street Address",a."City",a."State",a."Zip Code",a."Latitude",
a."Longitude",a."Start Time", a."End Time", a."White",a."Black", a."Hispanic", a."Asian",
a."Avg Score Math",a."Avg Score Reading", a."Avg Score Writing",a."Tested Percent",
d.enrolled_2015_2018,d.present_2015_2018,
d.absent_2015_2018,d.attendance_prc,
b."Location Name",b."Major N",b."Orth N", b."NoCrim N",b."Prop N",
b."Vio N", b."total_crime",
c.school_name, c.total_students from cleaned_df as a
inner join safety as b on
a."school id"=b."school id"
inner join schools as c on
(b."school id"=c."school id")
inner join school_attendance as d on
(c."school id" = d."school id")

drop view joined_ny_table

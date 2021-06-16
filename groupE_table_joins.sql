-->final group join
create table joined_nyc_table as
select a."school id",a."School Name",a."Borough", a."White",a."Black", a."Hispanic", a."Asian",
a."Avg Score Math",a."Avg Score Reading", a."Avg Score Writing",a."Tested Percent",
c."Mean Scale Score",
d.enrolled_2015_2018,d.present_2015_2018,
d.absent_2015_2018,d.attendance_prc,
b."Major N",b."Orth N", b."NoCrim N",b."Prop N",
b."Vio N", b."total_crime"
from cleaned_df as a
inner join safety as b on
a."school id"=b."school id"
inner join school_attendance as d on
(b."school id" = d."school id")
inner join school_scores as c on
(d."school id" = c."school id")

select * from joined_nyc_table
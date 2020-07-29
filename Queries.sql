--1)
select a.acnum, a.givename, a.famname, count(i.fieldnum)
from academic a left join interest i on a.acnum = i.acnum
group by (a.acnum,a.givename, a.famname);

--2)
select distinct(instname)
from department, academic
where department.deptnum = academic.deptnum
and NOT EXISTS (select *
from interest
where interest.acnum = academic.acnum);

--3)
select f.fieldnum, f.title, count(au.panum) "NO. PAPER GENERATED"
from author au join interest i on au.acnum = i.acnum join field f on f.fieldnum = i.fieldnum
group by (f.fieldnum, f.title)
order by f.fieldnum;;

--4)
select paper.panum,paper.title, count(interest.acnum)
from field,paper,author,interest
where field.fieldnum =interest.fieldnum and interest.acnum=author.acnum and author.panum = paper.panum
group by paper.panum, paper.title
having count(interest.acnum)>10;

--5)
select acnum
from interest
group by acnum
having count(fieldnum)>=ALL(select count (fieldnum)
from interest
group by acnum);
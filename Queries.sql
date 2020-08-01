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

--6)
select count(acnum)
from academic
where acnum NOT IN (select acnum from interest);

--7)
select distinct p.panum,p.title
from paper p,author au,interest i
where p.panum=au.panum
and au.acnum=i.acnum
and lower(p.title) like '%data%'
and exists (select * from academic a where a.acnum = i.acnum and a.deptnum=100);

--8)
select distinct au1.panum
from author au1, academic ac1, author au2, academic ac2
where au1.acnum = ac1.acnum
and au2.acnum = ac2.acnum
and au1.acnum < au2.acnum
and ac1.deptnum != ac2.deptnum
and au1.panum = au2.panum;

--9)
(select p.panum from paper p)
MINUS
(select au.panum from author au, academic a where au.acnum=a.acnum and a.deptnum != 126);

--10)
--inner query
Give fieldnum of anyone’s research interest whose description has ‘LOGIC’ string in it.
--whole query
Give acnum of an academic whose research interest has both ‘LOGIC’ as well as does not have ‘LOGIC’ in description.

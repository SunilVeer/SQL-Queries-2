# SQL-Queries-2

## The relational schema for the Academics database is as follows:
(Foreign keys are marked with *)
DEPARTMENT(deptnum, descrip, instname, deptname, state, postcode) Primary key is deptnum
ACADEMIC(acnum, deptnum*, famname, givename, initials, title) Primary key is acnum
PAPER(panum, title) Primary key is panum
AUTHOR(panum*, acnum*) Primary keys are panum, acnum
FIELD(fieldnum, id, title) Primary key is fieldnum
INTEREST(fieldnum*, acnum*, descrip) Primary keys are fieldnum, acnum 

## Some notes on the Academics database:
●  	An academic department belongs to one institution (instname) and often has many academics. An academic only works for one department.
●  	Research papers (PAPER) are often authored by several academics, and of course an academic often writes several papers (AUTHOR).
●  	A research field (FIELD) often attracts many academics and an academic can have interest in several research fields (INTEREST).

## Write ONE SQL query for each of the following questions:
1) For each academic, give the acnum, givename, famname and the total number of fields s/he has interests. Note that if an academic is not interested in any field, his/her total should be zero. You can use or not use JOIN operators.

2) List institutes where at least one academic does not have any research interest. List the instname of these institutes. You must use a subquery.

3) List the fieldnum, title and the total number of papers (under the heading "NO. PAPER GENERATED") generated by the academics has interests for each research field. The list should be in increasing order of fieldnum.  Note: research fields that no academics are interested in are excluded. 

4) Find research papers that may attract more than ten interested academics.  Give the panum, title and the number of interested academics for these research papers. (Note: if an academic has common research interests with any authors of a paper, this academic may be interested in this paper)

5) Return the acnum of academic(s) who have the largest number of research fields. You must NOT use MAX. An SQL query that lists all academics in decreasing order of their total number of fields is incorrect.

6) Give the total number of academics who have no any research fields.  You must use the NOT IN operator.

7) Find research papers whose title contains the string 'data' and has at least one interested academic from the department with deptnum 100. List the panum and title of these papers. You must use the EXISTS operator. Ensure your query is case-insensitive.

8) List papers (panum) that have authors from the different department. Do NOT use any JOIN operator.  Do NOT use any subqueries.

9) The SQL query below is meant to list research papers (panum) where no academics from  ‘RMIT CS’ (deptnum=126) are an coauthor. But it is incorrect. Give the correct SQL query.
select panum
from paper, academic, author
where paper.panum=author.panum, and author.acnum=academic.acnum and deptnum != 126;

10) Consider the SQL query given below. Give the English explanation for the output of a) the subquery, and b) the whole SQL query. Literal explanation will receive zero marks.
select S.acnum
from interest S
where upper(S.descrip) like '%LOGIC%'
	and exists (select fieldnum
                	from interest
                	where acnum = S.acnum
                    	and upper(descrip) not like '%LOGIC%');

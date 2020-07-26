# SQL-Queries-2

## The relational schema for the Academics database is as follows:
DEPARTMENT(deptnum, descrip, instname, deptname, state, postcode) Primary key
ACADEMIC(acnum, deptnum*, famname, givename, initials, title)
PAPER(panum, title)
AUTHOR(panum*, acnum*)
FIELD(fieldnum, id, title)
INTEREST(fieldnum*, acnum*, descrip)
Primary keys are underlined and foreign keys are marked with *. 

## Some notes on the Academics database:
●  	An academic department belongs to one institution (instname) and often has many academics. An academic only works for one department.
●  	Research papers (PAPER) are often authored by several academics, and of course an academic often writes several papers (AUTHOR).
●  	A research field (FIELD) often attracts many academics and an academic can have interest in several research fields (INTEREST).

use AdventureWorks2019;

/*
Question 1:
Write a SQL Statement that will give you a count of each object type in the Adventure Works database. Order by count descending
*/

select concat(type,' ',type_desc) as object_type,count(concat(type,' ',type_desc)) as num
from sys.objects 
group by type,type_desc
order by count(concat(type,' ',type_desc)) desc;

Select 
    type_desc
    ,Count(*) as CNT
From sys.objects
Group by type_desc
Order by 2 desc;

/* There are 71 users table */

/* Question 2:
a. Write a SQL Statement that will show a count of schemas, tables, and columns (do not include views) 
in the AdventureWorks database.

b. Write a similar statement as part a but list each schema, table, and column (do not include views). 
This table can be used later in the course.

*/

select * from sys.schemas;
select * from sys.tables;
select * from sys.columns;

select count(DISTINCT(s.schema_id)) as num_schema, count(distinct(t.name)) as tables, count(c.name) as columns
from sys.tables t 
join sys.schemas s on s.schema_id = t.schema_id
join sys.columns c on c.object_id = t.object_id;

/* second way */

select count(distinct(table_schema)) as num_schema, count(distinct(TABLE_NAME)) as table_cnt , count(column_name) as column_cnt
from INFORMATION_SCHEMA.COLUMNS
where table_name not in(
select table_name
from INFORMATION_SCHEMA.VIEWS
)


select s.name as schema_name, string_agg(t.name, ',') as table_name, string_agg(c.name,' ,') as column_name  
from sys.tables t 
join sys.schemas s on s.schema_id = t.schema_id
join sys.columns c on c.object_id = t.object_id
group by s.name;

/*secont way*/

select table_schema as schemas, TABLE_NAME as table_cnt , column_name as column_cnt
from INFORMATION_SCHEMA.COLUMNS
where table_name not in(
select table_name
from INFORMATION_SCHEMA.VIEWS
)
/*
We learned in question 1 that 89 check constraints exist in the AdventureWorks Database. 
In this question we are going to determine what the check constraints are doing while creating a new database and table.

a. Create a new database called "Edited_AdventureWorks" 
(we are creating another database so we don't   overwrite or change the AdventureWorks database). 
Then write a USE statement to connect to the new database.

b. Using the following tables - sys.check_constraints, sys.tables, and sys.columns to write a query that will give you TableName, ColumnName, CheckConstraintName, and CheckConstraintDefinition

c. Create a table named "tbl_CheckConstraint" in the "Edited_AdventureWorks" database with the following  columns and data types:

TableName varchar(100)

ColumnName varchar(100)

CheckConsraint varchar(250)

Definition varchar(500)

ConstraintLevel varchar(100)

d. Using the query in part b insert the data into "tbl_CheckConstraint"

e. Using a case statement write an update statement (update ConstraintLevel) that will specify whether the constraint is assigned to the column or the table.

f. What does this mean?

g. Once you're done interpreting the results drop the tbl_CheckConstraint table


*/

Use Edited_AdventureWorks;



select * from tbl_Checkconstraints;
select * from AdventureWorks2019.sys.check_constraints
select * from AdventureWorks2019.sys.columns
select * from AdventureWorks2019.sys.tables;


select t.name as TableName,c.name as ColumnName, co.name as CheckConsraint , co.[definition] as Defination 
from AdventureWorks2019.sys.check_constraints co 
join AdventureWorks2019.sys.tables t on  t.object_id = co.parent_object_id
left join AdventureWorks2019.sys.columns c on c.column_id = co.parent_column_id and c.object_id = co.parent_object_id
																					

/*
create table tbl_Checkconstraints(

	TableName varchar(100),
	ColumnName varchar(100),
	CheckConsraint varchar(250),
	Definition varchar(500),
	ConstraintLevel varchar(100)
);
*/


Insert into tbl_Checkconstraints
		(TableName
		,ColumnName
		,CheckConsraint
		,[Definition]
		,ConstraintLevel)
			select 
				t.name as TableName
				,c.name as ColumnName
				,co.name as CheckConsraint 
				,co.[definition] as Defination
				,null as ContraintLevel
			from AdventureWorks2019.sys.check_constraints co 
				join AdventureWorks2019.sys.tables t on  t.object_id = co.parent_object_id
				left join AdventureWorks2019.sys.columns c on c.column_id = co.parent_column_id 
					and c.object_id = co.parent_object_id
																		

update tbl_Checkconstraints
set ConstraintLevel =  case when ColumnName is null
							then 'TableLevel'
							else 'ColumnLevel'
						end
				
select * from tbl_Checkconstraints

Drop table tbl_Checkconstraints

use AdventureWorks2019

select ffk.name as forigen_key, s.name as [schema] ,t.name as table_name,c.name as column_name,rfc.name as referance_column_name ,s1.name as referance_schema, rf.name as reference_table 
from sys.foreign_key_columns fk
 join sys.foreign_keys ffk on ffk.object_id = fk.constraint_object_id 
 join sys.tables t on t.object_id = fk.parent_object_id 
 join sys.tables rf on rf.object_id = fk.referenced_object_id
 join sys.columns c on c.column_id = parent_column_id and c.object_id = fk.parent_object_id
 join sys.columns rfc on rfc.column_id = parent_column_id  and rfc.object_id = fk.parent_object_id
 join sys.schemas s on s.schema_id = t.schema_id
 join sys.schemas s1 on s1.schema_id = rf.schema_id

where ffk.name = 'FK_SalesOrderHeader_CurrencyRate_CurrencyRateID'

select * from sys.foreign_key_columns	
select * from sys.foreign_keys
select * from sys.columns
select * from sys.tables
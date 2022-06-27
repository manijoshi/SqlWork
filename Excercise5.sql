use AdventureWorks2008R2;
go
create proc usp_getNameByType @type nchar(5)='in'
as
begin
	select FirstName from Person.Person where PersonType=@type;
end

execute usp_getNameByType;
execute usp_getNameByType @type='sp';


-- PersonType:- IN,EM,SP,SC,VC,GC
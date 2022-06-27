-- Query 1
select Total_Records = count(1) from Sales.SalesPerson;

-- Query 2
select FirstName,LastName from Person.Person where FirstName like 'B%';

-- Query 3
select * from Person.Person as Person join HumanResources.Employee as Employee on Person.BusinessEntityID=Employee.BusinessEntityID and JobTitle like '%Design Engineer%' or JobTitle='%Tool Engineer%' or JobTitle='%Marketing Assistant%';

-- Query 4
select Name,Color,Weight from Production.Product where weight=(select max(weight) from Production.Product);

-- Query 5
select Description,ISNULL(MaxQty,0.00) as MaxQty from Sales.SpecialOffer;

-- Query 6
select CurrencyRateDate,FromCurrencyCode,ToCurrencyCode,AverageRate from Sales.CurrencyRate where DATEPART(year,CurrencyRateDate)=2005 and ToCurrencyCode='GBP';

-- Query 7
select RowNumber = ROW_NUMBER() over (order by FirstName asc), FirstName,LastName from Person.Person where FirstName like '%ss%';

-- Query 8
select BusinessEntityID,'Commision Band' = 
case 
	when CommissionPct=0 then 'Band 0'
	when CommissionPct>0 and CommissionPct<=0.01 then 'Band 1'
	when CommissionPct>0.01 and CommissionPct<=0.015 then 'Band 2'
	when CommissionPct>0.015 then 'Band 3'
end
from Sales.SalesPerson
order by CommissionPct;

-- Query 9
declare @id int;
select @id = BusinessEntityID from Person.Person
where FirstName = 'Ruth' and LastName = 'Ellerbrock' and PersonType='EM'
exec dbo.uspGetEmployeeManagers @BusinessEntityID=@id;

-- Query 10
select ProductID = max(dbo.ufnGetStock(ProductID)) from Production.Product;


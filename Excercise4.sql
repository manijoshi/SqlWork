use AdventureWorks2008R2;

go 
create function fn_getProducts(@SalesOrderID int, @CurrencyCode nchar(3),@CurrencyRateDate datetime) 
returns table 
as
return (select p.ProductID, p.OrderQty, p.UnitPrice, p.UnitPrice*scr.EndOfDayRate as 'Converted Price'
from (select * from Sales.SalesOrderDetail as sod where sod.SalesOrderID = @SalesOrderID) as p
,Sales.CurrencyRate as scr
where scr.ToCurrencyCode=@CurrencyCode
and scr.CurrencyRateDate=@CurrencyRateDate)
go

select * from fn_getProducts(43659,'CNY','2005-07-01 00:00:00.000');



-- select * from Sales.SalesOrderDetail
-- select * from Sales.CurrencyRate
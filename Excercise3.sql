select top 5 SalesOrderID,AccountNumber,OrderDate
from Sales.SalesOrderHeader where 
AccountNumber in 
(select AccountNumber from Sales.SalesOrderHeader group by AccountNumber having sum(SubTotal)>70000) 
order by OrderDate;

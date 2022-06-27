-- Join
select C.CustomerID from Sales.SalesOrderHeader SOH right join Sales.Customer C on C.CustomerID = SOH.CustomerID where SOH.SalesOrderID is null;

-- Subquery
select CustomerID from Sales.Customer where CustomerID not in (select CustomerID from Sales.SalesOrderHeader);

-- CTE
with CustomerWithoutOrder(CustomerID) as
(select C.CustomerID from Sales.SalesOrderHeader SOH right join Sales.Customer C on SOH.CustomerID=C.CustomerID where SOH.SalesOrderID is null)

select * from CustomerWithoutOrder;

-- EXISTS
select C.CustomerID from Sales.Customer C where not exists (select SOH.CustomerID from Sales.SalesOrderHeader SOH where SOH.CustomerID=C.CustomerID);
use AdventureWorks2008R2;

go
create or alter trigger CheckPriceRise
on Production.Product
instead of update
as
begin
	if update(ListPrice)
		declare @id int
		declare @OldListPrice money
		declare @NewListPrice money
	
		select @OldListPrice = p.ListPrice,
			   @NewListPrice=ins.ListPrice,
			   @id = ins.ProductID
		from Production.Product p, inserted ins
		where p.ProductID = ins.ProductID;

		if(@NewListPrice < (@OldListPrice + (@OldListPrice*0.15)))
		begin
			update Production.Product set ListPrice=@NewListPrice 
			where Production.Product.ProductID = @id;
		end
	else
		begin
			print 'List price more than 15 percent, transaction failed'	
		end
end


select p.ProductID,p.ListPrice
from Production.Product as p;

update Production.Product 
set ListPrice=800
where Product.ProductID=1;


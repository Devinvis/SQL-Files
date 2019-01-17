--dbo.Product
--dbo.CategoryProduct
--dbo.Category

declare
	@Product table(
	   ID    int
	  ,Name  varchar(128)
	)

declare
	@Category table(
	   ID    int
	  ,Name  varchar(128)
	)

declare
	@CategoryProduct table(
	   ProductID    int
	  ,CategoryID   int
	)


 insert into @Product (ID, Name)
 select 1, 'Product-one'
 union all
 select 2, 'Product-two'
 union all
 select 3, 'Product-three'

insert into @Category (ID, Name)
 select 1, 'Category-one'
 union all
 select 2, 'Category-two'
 union all
 select 3, 'Category-three'

insert into @CategoryProduct (
   ProductID
  ,CategoryID
) values (1, 2)

select
     p.Name as [ProductName]
    ,c.Name as [CategoryName]
  from @Product              as p
  left join @CategoryProduct as cp on cp.ProductID = p.ID
  left join @Category        as c  on c.ID = cp.CategoryID
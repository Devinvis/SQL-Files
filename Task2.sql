--dbo.Product
--dbo.CategoryProduct
--dbo.Category

create table dbo.Product(
   ID   int PRIMARY KEY IDENTITY
  ,Name varchar(128) null
); 


create table dbo.Category(
   ID   int PRIMARY KEY IDENTITY
  ,Name varchar(128) null
); 


create table dbo.CategoryProduct(
   ProductID   int
  ,CategoryID  int
    
  ,FOREIGN KEY (ProductID) REFERENCES dbo.Product (ID)
  ,FOREIGN KEY (CategoryID) REFERENCES dbo.Category (ID)
); 
 insert into dbo.Product (Name)
 select 'Product-one'
 union all
 select 'Product-two'
 union all
 select 'Product-three'

insert into dbo.Category (Name)
 select 'Category-one'
 union all
 select 'Category-two'
 union all
 select 'Category-three'

insert into dbo.CategoryProduct (
   ProductID
  ,CategoryID
) values (1, 2)

select
     p.Name as [ProductName]
    ,c.Name as [CategoryName]
  from dbo.Product              as p
  left join dbo.CategoryProduct as cp on cp.ProductID = p.ID
  left join dbo.Category        as c  on c.ID = cp.CategoryID
create database Project;
use Project;
select * from customer_purchase;
drop table Customer_purchase;

select * from Customers;
select * from customer_purchase 
where Productname is null
order by ProductID;
select * from Products;
select * from Orders
where purchasequantity is null;
drop table Products;
drop table Customers;
create table Customers as with cte as (select CustomerName,PurchaseDate,country from Customer_Purchase)
select *,row_number() over(order by CustomerName) as customerid from cte;
select * from Customers
where country is null;
create table Products as with cte as (select distinct ProductName,ProductCategory from Customer_Purchase)
select *,row_number() over(order by ProductName)+300 as Productid from cte;
select * from Products
where Productcategory is null;
alter table Customers 
add constraint pk primary key(Customerid); 
alter table Customers
modify Country varchar(100),
modify Purchasedate date;
desc Customers;
alter table Products 
add constraint pk primary key(Productid); 
desc Products;
alter table Orders 
add constraint pk primary key(Transactionid); 
desc Orders;
create table Orderdetail(
TransactionID int, foreign key(transactionID) references Orders(TransactionID) ,
Productid bigint unsigned, foreign key(productid) references Products(productid),
Customerid bigint unsigned, foreign key(customerid) references Customers(customerid),
constraint pk primary key(Transactionid)
)















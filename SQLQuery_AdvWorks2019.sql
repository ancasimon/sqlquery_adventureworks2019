--**Easy:**

--1. Show the first name and the email address of customer with CompanyName 'Bike World'
select * 
from Sales.Customer 

select *
from Sales.Store
where Name = 'Bike World'

select *
from Person.BusinessEntity

--Anca: first attempt looking through tables!
--select pp.FirstName, pe.EmailAddress

--select *
--from Person.Person pp
--	join Person.EmailAddress pe
--	on pp.BusinessEntityID = pe.BusinessEntityID
--		join Sales.Customer sc
--		on sc.PersonID = pe.BusinessEntityID
--			join Sales.Store ss
--			on ss.BusinessEntityID = sc.PersonID
--where ss.Name = 'Bike World'

--NOW let's look through the views:
select FirstName, EmailAddress, ContactType, Name
from Sales.vStoreWithContacts
where Name= 'Bike World'

--2. Show the CompanyName for all customers with an address in City 'Dallas'.
select Name, AddressLine1, City, StateProvinceName
from Sales.vStoreWithAddresses
where City = 'Dallas'

--3. How many items with ListPrice more than $1000 have been sold?
--ANCA: Here is a count of all the products sold with a unitprice > 1000 - as in "all the product types sold":
select count(*)
from Sales.SalesOrderDetail
where UnitPrice > 1000
--ANCA: and here is a count of all the individual units sold with that unit price condition - as in "counting each individual unit once - NOT just each product type once like I did above":
select sum(totalNumberOfUnitsSold)
from (
select ProductID, sum(orderQty) as totalNumberOfUnitsSold
from Sales.SalesOrderDetail
where UnitPrice > 1000
group by ProductID
) x

--for the details supporting the second query above / aka the query inserted above: here is a list of all the products and how many were sold (based on the orderQty for each sales order item listed):
select ProductID, sum(orderQty) as totalNumberOfUnitsSold
from Sales.SalesOrderDetail
where UnitPrice > 1000
group by ProductID


--4. Give the CompanyName of those customers with orders over $100000. Include the subtotal plus tax plus freight.


--5. Find the number of left racing socks ('Racing Socks, L') ordered by CompanyName 'Riding Cycles'

--**Medium**

--1. A "Single Item Order" is a customer order where only one item is ordered. Show the SalesOrderID and the UnitPrice for every Single Item Order.
--2. Where did the racing socks go? List the product name and the CompanyName for all Customers who ordered ProductModel 'Racing Socks'.
--3. Show the product description for culture 'fr' for product with ProductID 736.
--4. Use the SubTotal value in SaleOrderHeader to list orders from the largest to the smallest. For each order show the CompanyName and the SubTotal and the total weight of the order.
--5. How many products in ProductCategory 'Cranksets' have been sold to an address in 'London'?

--**Hard**

--1. For each order show the SalesOrderID and SubTotal calculated three ways:
--    1.  From the SalesOrderHeader
--    2. Sum of OrderQty*UnitPrice
--    3. Sum of OrderQty*ListPrice
--2. Show how many orders are in the following ranges (in $):

--```
--    RANGE      Num Orders      Total Value
--    0-  99
--  100- 999
-- 1000-9999
--10000-

--```
Part-I
# Q1
select *
from invoice 
where InvoiceDate like '%2013%' 

# Q2
select c.FirstName  ,  c.LastName , c.Country  
from Customer c
WHERE c.Country = 'Brazil' or c.Country = 'Canada' or c.Country = 'India' or c.Country = 'Sweden' 

# Q3
SELECT T.Name , T.Composer , A.Title
from Album A
join Track T
ON T.AlbumId  = A.AlbumId  
WHERE T.Name  like 'A%' and  T.Composer not like ''

# Q4
select c.FirstName , c.LastName , i.Total
from  Customer c
join  Invoice i
on c.CustomerId = i.CustomerId
order by  i.Total DESC
LIMIT 10



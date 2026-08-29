Part -2
Q1
select BillingCountry , Count(*) as number_invoices 
from Invoice
group by 1
order by 2 desc

Q2
SELECT BillingCity AS billingCity,
       SUM(Total)  AS InvoiceDollars 
  FROM Invoice 
GROUP BY BillingCity 
ORDER BY InvoiceDollars DESC
LIMIT 1;

Q3
SELECT  c.CustomerId, c.FirstName, c.LastName, sum(i.Total) as TotalSpent
FROM Customer c, Invoice i
WHERE c.CustomerId=i.CustomerId
GROUP BY (i.CustomerId)
ORDER BY TotalSpent desc
limit 1;

Q4
SELECT DISTINCT   
       C.Email     AS email,
       C.FirstName AS firstName,
       C.LastName  AS lastName,
       G.Name      AS name
  FROM Customer C JOIN Invoice I 
    ON C.CustomerId = I.CustomerId JOIN InvoiceLine IL 
    ON I.InvoiceId = IL.InvoiceId JOIN Track T 
    ON IL.TrackId = T.TrackId JOIN Genre G 
    ON T.GenreId = G.GenreId 
 WHERE G.Name = "Rock" 
ORDER BY C.Email;

Q5
WITH tab1 AS 
(
	SELECT c.CustomerId, c.FirstName, c.LastName, c.Country, SUM(i.Total) TotalSpent
	FROM Customer c
	JOIN Invoice i ON c.CustomerId = i.CustomerId
	GROUP BY c.CustomerId
)
SELECT tab1.*
FROM tab1
JOIN
(
	SELECT CustomerId, FirstName, LastName, Country, MAX(TotalSpent) AS TotalSpent
	FROM tab1
	GROUP BY Country
) tab2
ON tab1.Country = tab2.Country
WHERE tab1.TotalSpent = tab2.TotalSpent
ORDER BY Country;

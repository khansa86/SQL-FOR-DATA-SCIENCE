-- How many albums does the artist Led Zeppelin have? 

SELECT a.ArtistId, count(*)
,a.name
,al.title
FROM artists a JOIN albums al
ON a.ArtistId=al.ArtistId
WHERE name = 'Led Zeppelin';

------------------------------------------------------------------------------------

-- Q2) Create a list of album titles and the unit prices for the artist "Audioslave".

SELECT al.AlbumId
,al.title
,a.name
,t.unitprice 
FROM artists a JOIN albums al
ON a.ArtistId = al.ArtistId
JOIN tracks t 
ON t.AlbumId =al.AlbumId
WHERE a.name='Audioslave';

------------------------------------------------------------------------------------

-- Q3) Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query? 

SELECT c.FirstName
,c.LastName
,i.CustomerId
,i.invoiceId
FROM  invoices i
JOIN customers c 
ON c.CustomerId = i.CustomerId
WHERE invoiceId = NULL;
------------------------------------------------------------------------------------

-- Q4) Find the total price for each album.
-- What is the total price for the album “Big Ones”?

SELECT al.title, 
       sum(t.unitprice) total_price
FROM albums al 
JOIN tracks t 
ON t.albumid = al.albumid
WHERE al.title = 'Big Ones' -- Only to get big ones
GROUP BY al.title;

------------------------------------------------------------------------------------

-- Q5) How many records are created when you apply a Cartesian join to the invoice and invoice items table?

SELECT i.InvoiceId
,UnitPrice
FROM invoices i CROSS JOIN 
invoice_Items it;


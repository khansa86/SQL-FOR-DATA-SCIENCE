-- All of the questions in this quiz refer to the open source Chinook Database. 
-- Please familiarize yourself with the ER diagram in order to familiarize yourself with the table and column names
--  in order to write accurate queries and get the appropriate answers.


-- Q1) Using a subquery, find the names of all the tracks for the album "Californication".

SELECT AlbumId
,name
FROM Tracks
WHERE AlbumId IN (
    SELECT AlbumId
    FROM Albums
    WHERE Title = 'Californication'
);

------------------------------------------------------------------------------------

-- Q2) Find the total number of invoices for each customer along with the customer's full name, city and email

SELECT i.InvoiceId
,count(*)
,c.CustomerId
,c.FirstName
,c.LastName
,c.City
,c.Email
FROM Customers c  LEFT JOIN
Invoices i ON c.CustomerId = i.CustomerId
GROUP BY i.CustomerId;

------------------------------------------------------------------------------------

-- Q3) Retrieve the track name, album, artistID, and trackID for all the albums. REturn For TrackId 12

SELECT
 t.TrackId
,t.Name
,a.Name AS Artist
,al.Title AS Album

FROM ((Albums al INNER JOIN Tracks t
ON al.AlbumId= t.trackId)
    INNER JOIN Artists a ON a.ArtistId=al.ArtistId)
WHERE TrackId= 12;
------------------------------------------------------------------------------------

-- Q4) Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT m.LastName AS managers
,e.LastName AS Employees
FROM Employees e , Employees m 
WHERE m.EmployeeId = e.ReportsTo;

------------------------------------------------------------------------------------

-- Q5) Find the name and ID of the artists who do not have albums. 

SELECT Name AS Artist,
       a.ArtistId,
       al.Title AS Album
FROM Artists a
LEFT JOIN Albums al
ON a.ArtistId = al.ArtistId
WHERE Album IS NULL;

---------------------------------------------------------------------------------------------
-- Q6) Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
SELECT FirstName
    ,LastName
FROM Employees

UNION

SELECT FirstName
    ,LastName
FROM Customers
Order BY LastName DESC;

------------------------------------------------------------------------------------------------------
-- Q7) See if there are any customers who have a different city listed in their billing city versus their customer city
SELECT c.CustomerId
    ,c.City
    ,i.BillingCity
FROM Customers c LEFT JOIN Invoices i
    ON c.CustomerId = i.CustomerId
WHERE BillingCity !=  City;

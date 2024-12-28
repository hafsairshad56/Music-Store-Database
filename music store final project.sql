-- Employee Table
CREATE TABLE Employee (
    EmployeeId INT PRIMARY KEY IDENTITY(1,1),
    LastName NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    Title NVARCHAR(50),
    ReportsTo INT,
    BirthDate DATE,
    HireDate DATE,
    Address NVARCHAR(100),
    City NVARCHAR(50),
    State NVARCHAR(50),
    Country NVARCHAR(50),
    PostalCode NVARCHAR(20),
    Phone NVARCHAR(20),
    Fax NVARCHAR(20),
    Email NVARCHAR(100)
);
select * from Employee;
-- Customer Table
CREATE TABLE Customer (
    CustomerId INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Company NVARCHAR(100),
    Address NVARCHAR(100),
    City NVARCHAR(50),
    State NVARCHAR(50),
    Country NVARCHAR(50),
    PostalCode NVARCHAR(20),
    Phone NVARCHAR(20),
    Fax NVARCHAR(20),
    Email NVARCHAR(100),
    SupportRepId INT FOREIGN KEY REFERENCES Employee(EmployeeId)
);

-- Invoice Table
CREATE TABLE Invoice (
    InvoiceId INT PRIMARY KEY IDENTITY(1,1),
    CustomerId INT FOREIGN KEY REFERENCES Customer(CustomerId),
    InvoiceDate DATE NOT NULL,
    BillingAddress NVARCHAR(100),
    BillingCity NVARCHAR(50),
    BillingState NVARCHAR(50),
    BillingCountry NVARCHAR(50),
    BillingPostalCode NVARCHAR(20),
    Total DECIMAL(10,2) NOT NULL
);

-- InvoiceLine Table
CREATE TABLE InvoiceLine (
    InvoiceLineId INT PRIMARY KEY IDENTITY(1,1),
    InvoiceId INT FOREIGN KEY REFERENCES Invoice(InvoiceId),
    TrackId INT FOREIGN KEY REFERENCES Track(TrackId),
    UnitPrice DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL
); 

-- Playlist Table
CREATE TABLE Playlist (
    PlaylistId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL
);

-- PlaylistTrack Table (Junction Table)
CREATE TABLE PlaylistTrack (
    PlaylistId INT FOREIGN KEY REFERENCES Playlist(PlaylistId),
    TrackId INT FOREIGN KEY REFERENCES Track(TrackId),
    PRIMARY KEY (PlaylistId, TrackId)
);

-- Track Table
CREATE TABLE Track (
    TrackId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    AlbumId INT FOREIGN KEY REFERENCES Album(AlbumId),
    MediaTypeId INT FOREIGN KEY REFERENCES MediaType(MediaTypeId),
    GenreId INT FOREIGN KEY REFERENCES Genre(GenreId),
    Composer NVARCHAR(100),
    Milliseconds INT NOT NULL,
    Bytes INT,
    UnitPrice DECIMAL(10,2) NOT NULL
);

-- Album Table
CREATE TABLE Album (
    AlbumId INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    ArtistId INT FOREIGN KEY REFERENCES Artist(ArtistId)
);

-- Artist Table
CREATE TABLE Artist (
    ArtistId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL
);

-- MediaType Table
CREATE TABLE MediaType (
    MediaTypeId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL
);

-- Genre Table
CREATE TABLE Genre (
    GenreId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL
);
-- Retrieve all records from the Employee table
SELECT * FROM Employee;

-- Retrieve all records from the Customer table
SELECT * FROM Customer;

-- Retrieve all records from the Invoice table
SELECT * FROM Invoice;

-- Retrieve all records from the InvoiceLine table
SELECT * FROM InvoiceLine;

-- Retrieve all records from the Playlist table
SELECT * FROM Playlist;

-- Retrieve all records from the PlaylistTrack table
SELECT * FROM PlaylistTrack;

-- Retrieve all records from the Track table
SELECT * FROM Track;

-- Retrieve all records from the Album table
SELECT * FROM Album;

-- Retrieve all records from the Artist table
SELECT * FROM Artist;

-- Retrieve all records from the MediaType table
SELECT * FROM MediaType;

-- Retrieve all records from the Genre table
SELECT * FROM Genre;
 
INSERT INTO Employee (LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email)
VALUES
('Smith', 'John', 'Manager', NULL, '1980-01-15', '2010-06-01', '123 Main St', 'Los Angeles', 'CA', 'USA', '90001', '123-456-7890', '123-456-7891', 'john.smith@example.com'),
('Johnson', 'Alice', 'Sales Rep', 1, '1985-07-20', '2015-03-15', '456 Elm St', 'San Francisco', 'CA', 'USA', '94101', '234-567-8901', NULL, 'alice.johnson@example.com'),
('Williams', 'James', 'IT Support', 1, '1990-04-10', '2018-09-12', '789 Oak St', 'New York', 'NY', 'USA', '10001', '345-678-9012', NULL, 'james.williams@example.com'),
('Brown', 'Emily', 'HR Manager', NULL, '1978-03-22', '2008-07-15', '321 Pine St', 'Chicago', 'IL', 'USA', '60601', '456-789-0123', '456-789-0124', 'emily.brown@example.com'),
('Jones', 'Michael', 'Engineer', 1, '1992-11-10', '2019-02-20', '654 Cedar St', 'Houston', 'TX', 'USA', '77001', '567-890-1234', NULL, 'michael.jones@example.com'),
('Garcia', 'Sophia', 'Marketing Specialist', 4, '1988-05-15', '2013-10-01', '987 Maple St', 'Miami', 'FL', 'USA', '33101', '678-901-2345', NULL, 'sophia.garcia@example.com'),
('Martinez', 'David', 'Accountant', 4, '1983-02-28', '2011-01-10', '159 Birch St', 'Phoenix', 'AZ', 'USA', '85001', '789-012-3456', NULL, 'david.martinez@example.com'),
('Hernandez', 'Olivia', 'Product Manager', NULL, '1991-09-17', '2020-06-18', '753 Walnut St', 'Denver', 'CO', 'USA', '80201', '890-123-4567', '890-123-4568', 'olivia.hernandez@example.com'),
('Lopez', 'Daniel', 'Data Analyst', 5, '1989-08-25', '2016-05-10', '369 Spruce St', 'Dallas', 'TX', 'USA', '75201', '901-234-5678', NULL, 'daniel.lopez@example.com'),
('Gonzalez', 'Emma', 'Designer', 6, '1995-06-30', '2021-03-01', '147 Poplar St', 'Seattle', 'WA', 'USA', '98101', '012-345-6789', NULL, 'emma.gonzalez@example.com'),
('Perez', 'Alexander', 'Developer', 4, '1993-12-14', '2017-09-25', '258 Cherry St', 'Boston', 'MA', 'USA', '02101', '123-456-7890', NULL, 'alexander.perez@example.com'),
('White', 'Charlotte', 'Project Manager', NULL, '1984-01-10', '2012-04-15', '369 Pineapple St', 'Atlanta', 'GA', 'USA', '30301', '234-567-8901', '234-567-8902', 'charlotte.white@example.com'),
('Harris', 'Benjamin', 'Tester', 11, '1990-07-22', '2018-07-01', '741 Banana St', 'San Diego', 'CA', 'USA', '92101', '345-678-9012', NULL, 'benjamin.harris@example.com'),
('Clark', 'Amelia', 'Support Specialist', 1, '1987-03-15', '2014-10-10', '852 Mango St', 'Austin', 'TX', 'USA', '73301', '456-789-0123', NULL, 'amelia.clark@example.com'),
('Lewis', 'Lucas', 'HR Assistant', 4, '1986-09-08', '2013-05-15', '963 Lemon St', 'Portland', 'OR', 'USA', '97201', '567-890-1234', NULL, 'lucas.lewis@example.com'),
('Walker', 'Ella', 'Sales Coordinator', 6, '1994-12-02', '2020-01-05', '123 Kiwi St', 'Las Vegas', 'NV', 'USA', '89101', '678-901-2345', NULL, 'ella.walker@example.com'),
('Hall', 'Jack', 'Admin Assistant', 7, '1992-05-20', '2017-11-20', '456 Lime St', 'Nashville', 'TN', 'USA', '37201', '789-012-3456', NULL, 'jack.hall@example.com'),
('Allen', 'Ava', 'Quality Analyst', 2, '1985-04-10', '2015-08-12', '789 Orange St', 'Orlando', 'FL', 'USA', '32801', '890-123-4567', NULL, 'ava.allen@example.com'),
('Young', 'Mason', 'Content Writer', 8, '1988-11-23', '2012-03-18', '321 Peach St', 'Salt Lake City', 'UT', 'USA', '84101', '901-234-5678', NULL, 'mason.young@example.com'),
('King', 'Harper', 'SEO Specialist', 5, '1991-06-11', '2019-09-07', '654 Pear St', 'Charlotte', 'NC', 'USA', '28201', '012-345-6789', NULL, 'harper.king@example.com');
 
 INSERT INTO MediaType (Name)
VALUES
('MP3'), ('WAV'), ('AAC'), ('FLAC'), ('OGG'), ('ALAC'), ('AIFF'), ('WMA'),
('RealAudio'), ('MIDI'), ('Vorbis'), ('Opus'), ('PCM'), ('DSD'), ('APE'),
('MPEG-H'), ('Dolby Atmos'), ('DTS'), ('Blu-ray Audio'), ('HD Audio');

INSERT INTO Genre (Name)
VALUES
('Pop'), ('Rock'), ('Jazz'), ('Classical'), ('Hip-Hop'), ('Electronic'), ('Country'), ('Reggae'),
('Blues'), ('Metal'), ('R&B'), ('Soul'), ('Funk'), ('Disco'), ('Folk'),
('Techno'), ('House'), ('Trance'), ('Ambient'), ('Indie');

INSERT INTO Artist (Name)
VALUES
('Michael Jackson'), ('AC/DC'), ('Adele'), ('Taylor Swift'), ('Led Zeppelin'),
('The Beatles'), ('Pink Floyd'), ('Elton John'), ('Queen'), ('Madonna'),
('Drake'), ('Ed Sheeran'), ('Kanye West'), ('Billie Eilish'), ('Coldplay'),
('BTS'), ('Eminem'), ('Shakira'), ('Bruno Mars'), ('Lady Gaga');

INSERT INTO Album (Title, ArtistId)
VALUES
('Thriller', 1), ('Back in Black', 2), ('21', 3), ('1989', 4), ('Led Zeppelin IV', 5),
('Abbey Road', 6), ('The Wall', 7), ('Goodbye Yellow Brick Road', 8), ('A Night at the Opera', 9), ('Like a Virgin', 10),
('Scorpion', 11), ('Divide', 12), ('Yeezus', 13), ('Happier Than Ever', 14), ('Parachutes', 15),
('Map of the Soul', 16), ('The Eminem Show', 17), ('Laundry Service', 18), ('Doo-Wops & Hooligans', 19), ('Born This Way', 20);

INSERT INTO Customer (FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId)
VALUES
('Alice', 'Johnson', 'TechCorp', '456 Elm St', 'San Francisco', 'CA', 'USA', '94101', '987-654-3210', '987-654-3211', 'alice.johnson@example.com', 1),
('Bob', 'Brown', 'Creative Labs', '123 Pine St', 'Seattle', 'WA', 'USA', '98101', '876-543-2109', NULL, 'bob.brown@example.com', 2),
('Charlie', 'Davis', NULL, '789 Maple St', 'Denver', 'CO', 'USA', '80201', '765-432-1098', NULL, 'charlie.davis@example.com', 1),
('Diana', 'Smith', 'GreenTech', '321 Cedar St', 'Austin', 'TX', 'USA', '73301', '654-321-0987', '654-321-0986', 'diana.smith@example.com', 3),
('Edward', 'Garcia', 'Health Solutions', '159 Oak St', 'Chicago', 'IL', 'USA', '60601', '543-210-9876', NULL, 'edward.garcia@example.com', 4),
('Fiona', 'Taylor', NULL, '951 Birch St', 'New York', 'NY', 'USA', '10001', '432-109-8765', NULL, 'fiona.taylor@example.com', 2),
('George', 'Harris', 'Bright Ideas Inc.', '753 Walnut St', 'Miami', 'FL', 'USA', '33101', '321-098-7654', NULL, 'george.harris@example.com', 5),
('Hannah', 'Clark', NULL, '147 Cherry St', 'Portland', 'OR', 'USA', '97201', '210-987-6543', NULL, 'hannah.clark@example.com', 1),
('Ian', 'Lee', 'Skyline Solutions', '369 Spruce St', 'Dallas', 'TX', 'USA', '75201', '109-876-5432', '109-876-5431', 'ian.lee@example.com', 4),
('Julia', 'Martinez', NULL, '258 Poplar St', 'Los Angeles', 'CA', 'USA', '90001', '998-765-4321', NULL, 'julia.martinez@example.com', 3),
('Kevin', 'Wilson', 'Apex Systems', '753 Mango St', 'San Diego', 'CA', 'USA', '92101', '887-654-3210', NULL, 'kevin.wilson@example.com', 2),
('Laura', 'White', 'InnovateTech', '321 Lemon St', 'Houston', 'TX', 'USA', '77001', '776-543-2109', '776-543-2108', 'laura.white@example.com', 6),
('Michael', 'King', NULL, '456 Peach St', 'Atlanta', 'GA', 'USA', '30301', '665-432-1098', NULL, 'michael.king@example.com', 5),
('Nina', 'Adams', 'EliteCorp', '789 Pear St', 'Boston', 'MA', 'USA', '02101', '554-321-0987', NULL, 'nina.adams@example.com', 3),
('Oscar', 'Lopez', NULL, '951 Apple St', 'Charlotte', 'NC', 'USA', '28201', '443-210-9876', '443-210-9875', 'oscar.lopez@example.com', 4),
('Paula', 'Young', 'BrightPath', '159 Lime St', 'Orlando', 'FL', 'USA', '32801', '332-109-8765', NULL, 'paula.young@example.com', 6),
('Quincy', 'Hall', NULL, '369 Orange St', 'Salt Lake City', 'UT', 'USA', '84101', '221-098-7654', NULL, 'quincy.hall@example.com', 1),
('Rachel', 'Allen', 'NextGen Tech', '147 Banana St', 'Nashville', 'TN', 'USA', '37201', '110-987-6543', '110-987-6542', 'rachel.allen@example.com', 2),
('Steven', 'Walker', NULL, '258 Cherry St', 'Phoenix', 'AZ', 'USA', '85001', '999-876-5432', NULL, 'steven.walker@example.com', 3),
('Tina', 'Evans', 'FutureSoft', '456 Pine St', 'Denver', 'CO', 'USA', '80201', '888-765-4321', NULL, 'tina.evans@example.com', 5);


INSERT INTO Playlist (Name)
VALUES
('Top Hits'), ('Rock Classics'), ('Jazz Favorites'), ('Pop Hits'), ('Hip-Hop Beats'),
('Relaxing Music'), ('Workout Mix'), ('Party Hits'), ('Classical Moods'), ('Indie Vibes'),
('80s Hits'), ('90s Favorites'), ('New Releases'), ('Chillout Lounge'), ('Romantic Tunes'),
('Summer Vibes'), ('Road Trip'), ('Festival Anthems'), ('Underground Hits'), ('Dance Party');

INSERT INTO PlaylistTrack (PlaylistId, TrackId)
VALUES
(1, 1), (1, 2), (2, 3), (2, 4), (3, 5),
(4, 6), (5, 7), (6, 8), (7, 9), (8, 10),
(9, 11), (10, 12), (11, 13), (12, 14), (13, 15),
(14, 16), (15, 17), (16, 18), (17, 19), (18, 20);

INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
('Billie Jean', 1, 1, 1, 'Michael Jackson', 293000, 1024000, 1.29),
('Smooth Criminal', 1, 2, 1, 'Michael Jackson', 256000, 870000, 1.29),
('Back in Black', 2, 1, 2, 'AC/DC', 300000, 1048000, 1.29),
('Thunderstruck', 2, 1, 2, 'AC/DC', 290000, 1010000, 1.29),
('Shape of You', 3, 2, 3, 'Ed Sheeran', 260000, 980000, 1.29),
('Perfect', 3, 2, 3, 'Ed Sheeran', 263000, 970000, 1.29),
('Someone Like You', 4, 1, 4, 'Adele', 285000, 1015000, 1.49),
('Hello', 4, 1, 4, 'Adele', 295000, 1030000, 1.49),
('Rolling in the Deep', 4, 1, 4, 'Adele', 277000, 1020000, 1.49),
('Bohemian Rhapsody', 5, 2, 5, 'Queen', 354000, 1200000, 1.99),
('We Will Rock You', 5, 2, 5, 'Queen', 180000, 850000, 1.29),
('Imagine', 6, 1, 6, 'John Lennon', 220000, 920000, 1.29),
('Let It Be', 6, 1, 6, 'The Beatles', 243000, 940000, 1.29),
('Yesterday', 6, 1, 6, 'The Beatles', 145000, 740000, 1.29),
('Hotel California', 7, 1, 7, 'Eagles', 391000, 1400000, 1.99),
('Desperado', 7, 1, 7, 'Eagles', 231000, 920000, 1.29),
('Stairway to Heaven', 8, 2, 8, 'Led Zeppelin', 482000, 1500000, 1.99),
('Kashmir', 8, 2, 8, 'Led Zeppelin', 515000, 1600000, 1.99),
('Smells Like Teen Spirit', 9, 1, 9, 'Nirvana', 301000, 1050000, 1.29),
('Come As You Are', 9, 1, 9, 'Nirvana', 219000, 950000, 1.29);

INSERT INTO Invoice (CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total)
VALUES
(1, '2024-11-01', '789 Oak St', 'New York', 'NY', 'USA', '10001', 29.99),
(2, '2024-11-02', '123 Pine St', 'Seattle', 'WA', 'USA', '98101', 19.99),
(3, '2024-11-03', '456 Elm St', 'San Francisco', 'CA', 'USA', '94101', 49.99),
(4, '2024-11-04', '654 Maple St', 'Chicago', 'IL', 'USA', '60601', 39.99),
(5, '2024-11-05', '321 Willow St', 'Austin', 'TX', 'USA', '73301', 59.99),
(6, '2024-11-06', '987 Birch St', 'Denver', 'CO', 'USA', '80201', 24.99),
(7, '2024-11-07', '852 Cherry St', 'Boston', 'MA', 'USA', '02108', 44.99),
(8, '2024-11-08', '741 Poplar St', 'Miami', 'FL', 'USA', '33101', 34.99),
(9, '2024-11-09', '369 Walnut St', 'Phoenix', 'AZ', 'USA', '85001', 29.99),
(10, '2024-11-10', '258 Cedar St', 'Portland', 'OR', 'USA', '97201', 19.99),
(11, '2024-11-11', '159 Aspen St', 'Las Vegas', 'NV', 'USA', '89101', 49.99),
(12, '2024-11-12', '147 Sycamore St', 'Houston', 'TX', 'USA', '77001', 59.99),
(13, '2024-11-13', '753 Spruce St', 'San Diego', 'CA', 'USA', '92101', 39.99),
(14, '2024-11-14', '951 Hickory St', 'Atlanta', 'GA', 'USA', '30301', 44.99),
(15, '2024-11-15', '357 Redwood St', 'Dallas', 'TX', 'USA', '75201', 24.99),
(16, '2024-11-16', '123 Pineapple St', 'Orlando', 'FL', 'USA', '32801', 29.99),
(17, '2024-11-17', '789 Mango St', 'Los Angeles', 'CA', 'USA', '90001', 19.99),
(18, '2024-11-18', '456 Orange St', 'Seattle', 'WA', 'USA', '98101', 39.99),
(19, '2024-11-19', '654 Peach St', 'Chicago', 'IL', 'USA', '60601', 59.99),
(20, '2024-11-20', '987 Lemon St', 'New York', 'NY', 'USA', '10001', 34.99);

INSERT INTO InvoiceLine (InvoiceId, TrackId, UnitPrice, Quantity)
VALUES
(1, 1, 1.29, 1),
(1, 2, 1.29, 1),
(2, 3, 1.29, 1),
(2, 4, 1.29, 2),
(3, 5, 1.49, 1),
(3, 6, 1.49, 3),
(4, 7, 0.99, 2),
(4, 8, 0.99, 1),
(5, 9, 1.19, 4),
(5, 10, 1.19, 1),
(6, 11, 1.29, 1),
(6, 12, 1.29, 2),
(7, 13, 1.09, 3),
(7, 14, 1.09, 1),
(8, 15, 1.39, 2),
(8, 16, 1.39, 1),
(9, 17, 0.89, 1),
(9, 18, 0.89, 3),
(10, 19, 1.49, 2),
(10, 20, 1.49, 1);


--Q1: Who is the senior-most employee based on job title?

CREATE VIEW EmployeeLevels AS
SELECT EmployeeId, FirstName, LastName, Title
FROM Employee;

SELECT TOP 1 * 
FROM EmployeeLevels
ORDER BY Title DESC; -- Assuming Title indicates hierarchy

--Q2: Which countries have the most invoices?

--Function to Return Top N Countries Based on Invoice Count:

CREATE FUNCTION TopInvoiceCountries(@TopN INT)
RETURNS TABLE
AS
RETURN (
    SELECT TOP (@TopN) BillingCountry, COUNT(*) AS InvoiceCount
    FROM Invoice
    GROUP BY BillingCountry
    ORDER BY COUNT(*) DESC
);
SELECT * FROM TopInvoiceCountries(5); -- Replace 5 with the number of top countries you want

--Q3: What are the top 3 values of total invoice?

--Procedure to Fetch Top N Invoice Totals:

CREATE PROCEDURE GetTopInvoiceTotals (@TopN INT)
AS
BEGIN
    SELECT TOP (@TopN) Total
    FROM Invoice
    ORDER BY Total DESC;
END;

EXEC GetTopInvoiceTotals 3;

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city 
we made the most money. Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */

--View to Summarize Total Invoice Revenue per City:

CREATE VIEW CityRevenue AS
SELECT BillingCity, SUM(Total) AS TotalRevenue
FROM Invoice
GROUP BY BillingCity;

--Procedure to Retrieve the Top City:

CREATE PROCEDURE GetTopCity
AS
BEGIN
    SELECT TOP 1 BillingCity, TotalRevenue
    FROM CityRevenue
    ORDER BY TotalRevenue DESC;
END;

EXEC GetTopCity;

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/

--Function to Compute Total Spending by a Customer:

CREATE FUNCTION GetCustomerSpending (@CustomerId INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @TotalSpending DECIMAL(10,2);
    SELECT @TotalSpending = SUM(Total)
    FROM Invoice
    WHERE CustomerId = @CustomerId;
    RETURN @TotalSpending;
END;

--Procedure to Retrieve the Highest Spender:

CREATE PROCEDURE GetBestCustomer
AS
BEGIN
    SELECT TOP 1 C.CustomerId, C.FirstName, C.LastName, SUM(I.Total) AS TotalSpent
    FROM Customer C
    JOIN Invoice I ON C.CustomerId = I.CustomerId
    GROUP BY C.CustomerId, C.FirstName, C.LastName
    ORDER BY TotalSpent DESC;
END;


EXEC GetBestCustomer;


/* Question Set 2 - Moderate */

/* Q: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */

--View to Store Rock Music Track IDs and Customers:

CREATE VIEW RockMusicListeners AS
SELECT 
    C.CustomerId, 
    C.FirstName, 
    C.LastName, 
    C.Email, 
    G.Name AS Genre
FROM 
    Customer C
JOIN Invoice I ON C.CustomerId = I.CustomerId
JOIN InvoiceLine IL ON I.InvoiceId = IL.InvoiceId
JOIN Track T ON IL.TrackId = T.TrackId
JOIN Genre G ON T.GenreId = G.GenreId
WHERE G.Name = 'Rock';

--Function to Retrieve Emails of Rock Music Listeners:

CREATE FUNCTION GetRockListeners ()
RETURNS TABLE
AS
RETURN (
    SELECT DISTINCT Email
    FROM RockMusicListeners
);

SELECT * 
FROM GetRockListeners();

/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

--View for Rock Artists and Their Track Counts:

CREATE VIEW RockArtistsTrackCounts AS
SELECT 
    A.ArtistId, 
    A.Name AS ArtistName, 
    COUNT(T.TrackId) AS TrackCount
FROM 
    Track T
JOIN Album Al ON T.AlbumId = Al.AlbumId
JOIN Artist A ON Al.ArtistId = A.ArtistId
JOIN Genre G ON T.GenreId = G.GenreId
WHERE G.Name = 'Rock'
GROUP BY A.ArtistId, A.Name;

--Function to Retrieve Top N Rock Artists:

CREATE FUNCTION GetTopRockArtists (@TopN INT)
RETURNS TABLE
AS
RETURN (
    SELECT TOP (@TopN) ArtistName, TrackCount
    FROM RockArtistsTrackCounts
    ORDER BY TrackCount DESC
);

SELECT * 
FROM GetTopRockArtists(10);

/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

--Procedure to Compute Average Track Length and Return Qualifying Tracks:

CREATE PROCEDURE GetTracksLongerThanAverage
AS
BEGIN
    DECLARE @AvgLength INT;

    -- Calculate average track length
    SELECT @AvgLength = AVG(Milliseconds) 
    FROM Track;

    -- Return tracks longer than average length
    SELECT TrackId, Name, Milliseconds
    FROM Track
    WHERE Milliseconds > @AvgLength;
END;


EXEC GetTracksLongerThanAverage;


/* Question Set 3 - Advance */

/* Q1: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name 
and total spent */

/* Steps to Solve: First, find which artist has earned the most according to the InvoiceLines. Now use this artist 
to find which customer spent the most on this artist. For this query, you will need to use the Invoice, InvoiceLine,
Track, Customer, Album, and Artist tables. Note, this one is tricky because the Total spent in the Invoice table 
might not be on a single product, so you need to use the InvoiceLine table to find out how many of each product was
purchased, and then multiply this by the price for each artist. */

CREATE VIEW ArtistSalesData AS
SELECT 
    C.CustomerId,
    C.FirstName + ' ' + C.LastName AS CustomerName,
    A.ArtistId,
    A.Name AS ArtistName,
    SUM(IL.UnitPrice * IL.Quantity) AS TotalSpent
FROM 
    Customer C
JOIN Invoice I ON C.CustomerId = I.CustomerId
JOIN InvoiceLine IL ON I.InvoiceId = IL.InvoiceId
JOIN Track T ON IL.TrackId = T.TrackId
JOIN Album Al ON T.AlbumId = Al.AlbumId
JOIN Artist A ON Al.ArtistId = A.ArtistId
GROUP BY 
    C.CustomerId, C.FirstName, C.LastName, A.ArtistId, A.Name;


--Procedure to Calculate Spending for Any Artist Dynamically:

CREATE PROCEDURE GetSpendingByArtist (@ArtistName NVARCHAR(100))
AS
BEGIN
    SELECT 
        CustomerId, 
        CustomerName, 
        ArtistName, 
        TotalSpent
    FROM ArtistSalesData
    WHERE ArtistName = @ArtistName
    ORDER BY TotalSpent DESC;
END;


EXEC GetSpendingByArtist @ArtistName = 'The Beatles';

/* Q2: We want to find out the most popular music Genre for each country. We determine the most popular genre as the
genre with the highest amount of purchases. Write a query that returns each country along with the top Genre. 
For countries where the maximum number of purchases is shared return all Genres. */

/* Steps to Solve:  There are two parts in question- first most popular music genre and second need data at country
level. */

--View for Genre-Wise Purchase Counts Per Country:

CREATE VIEW GenreCountrySales AS
SELECT 
    G.GenreId,
    G.Name AS GenreName,
    I.BillingCountry,
    SUM(IL.UnitPrice * IL.Quantity) AS TotalRevenue
FROM 
    Invoice I
JOIN InvoiceLine IL ON I.InvoiceId = IL.InvoiceId
JOIN Track T ON IL.TrackId = T.TrackId
JOIN Genre G ON T.GenreId = G.GenreId
GROUP BY 
    G.GenreId, G.Name, I.BillingCountry;

--Function to Retrieve the Most Popular Genre for a Given Country:

CREATE FUNCTION GetTopGenreByCountry (@Country NVARCHAR(50))
RETURNS TABLE
AS
RETURN (
    SELECT TOP 1 
        GenreName, 
        TotalRevenue
    FROM GenreCountrySales
    WHERE BillingCountry = @Country
    ORDER BY TotalRevenue DESC
);

SELECT * 
FROM GetTopGenreByCountry('USA');

/* Q3: Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount. */

/* Steps to Solve:  Similar to the above question. There are two parts in question- 
first find the most spent on music for each country and second filter the data for respective customers. */

--Procedure to Dynamically Calculate the Top Spender for Each Country:

CREATE PROCEDURE GetTopSpenderByCountry (@Country NVARCHAR(50))
AS
BEGIN
    SELECT 
        C.CustomerId,
        C.FirstName + ' ' + C.LastName AS CustomerName,
        I.BillingCountry,
        SUM(I.Total) AS TotalSpent
    FROM 
        Customer C
    JOIN Invoice I ON C.CustomerId = I.CustomerId
    WHERE I.BillingCountry = @Country
    GROUP BY 
        C.CustomerId, C.FirstName, C.LastName, I.BillingCountry
    ORDER BY TotalSpent DESC;
END;


EXEC GetTopSpenderByCountry @Country = 'USA';





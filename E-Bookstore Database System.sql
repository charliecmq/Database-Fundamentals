CREATE DATABASE ebookstore

USE ebookstore

CREATE TABLE Publishers(
    PublisherID NVARCHAR(50) PRIMARY KEY,
    PublisherName NVARCHAR(50) NOT NULL,
    ContactNumber NVARCHAR(50),
    Email NVARCHAR(50)
)

INSERT INTO Publishers
(PublisherID, PublisherName, ContactNumber, Email)
VALUES
('P01', 'Booksmith', '03-7723 8810', 'contact@booksmith.my'),
('P02', 'Page Turner', '03-2167 9922', 'support@pageturner.my'),
('P03', 'Bloomi Books', '03-4281 7744', 'hello@bloomibooks.my'),
('P04', 'Maple Books', '03-7955 6633', 'info@maplebooks.my'),
('P05', 'Publishing Wise', '03-6278 5511', 'admin@publishingwise.my'),
('P06', 'AfterBooks', '03-8024 8899', 'care@afterbooks.my'),
('P07', 'SalvoBooks', '03-6143 7788', 'contact@salvobooks.my')

SELECT * FROM Publishers

CREATE TABLE Books (
    BookID NVARCHAR(50) PRIMARY KEY,
    BookSerialNo NVARCHAR(50) NOT NULL,
    BookTitle NVARCHAR(50) NOT NULL,
    Author NVARCHAR(50) NOT NULL,
    Genre NVARCHAR(50) NOT NULL,
    Summary NVARCHAR(255),
    UnitPrice DECIMAL(10,2),
    PublisherID NVARCHAR(50) FOREIGN KEY REFERENCES Publishers(PublisherID),
    QuantityInStock INT
)

INSERT INTO Books
(BookID, BookSerialNo, BookTitle, Author, Genre, Summary, UnitPrice, PublisherID, QuantityInStock)
VALUES
('B01', '978-0-06-112008-4', 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 
'A young girl in the racially divided South learns hard truths as her father defends a Black man. 
A timeless story of justice, empathy, and moral growth.', 
59.9, 'P01', 100),
('B02', '978-0-452-28423-4', '1984', 'George Orwell', 'Fiction', 
'In a dystopian world under total surveillance, one man rebels against the regime. 
A chilling warning about oppression and lost freedom.', 
39.9, 'P01', 57),
('B03', '978-0-14-143951-8', 'Pride and Prejudice', 'Jane Austen', 'Romance', 
'Elizabeth Bennet navigates love and society in 19th-century England. 
A witty, enduring tale of romance and self-discovery.',
25, 'P06', 80),
('B04', '978-0-7432-7356-5', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 
'A mysterious millionaire chases the American Dream in the roaring 1920s. 
A critique of wealth, desire, and moral decay.',
40, 'P07', 448),
('B05', '978-0-316-76948-0', 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 
'Teenager Holden Caulfield wanders New York, struggling with alienation. 
A raw exploration of adolescence and identity.',
38, 'P07', 23),
('B06', '978-0-385-74577-4', 'The Book Thief', 'Markus Zusak', 'Fiction', 
'In Nazi Germany, a girl finds comfort in books during wartime. 
Narrated by Death, it honors resistance and the power of words.',
28.90, 'P02', 48),
('B07', '978-0-399-59050-4', 'Educated', 'Tara Westover', 'Memoir', 
'A woman breaks away from her survivalist upbringing to seek education. 
A gripping memoir of transformation and freedom.',
17, 'P03', 92),
('B08', '978-0-06-231611-0', 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'Non-fiction', 
'A wide-ranging history of humanity from early humans to modern society. 
Thought-provoking insights on culture, power, and progress.',
90, 'P04', 12),
('B09', '978-1-5247-6313-8', 'Becoming', 'Michelle Obama', 'Memoir', 
'From Chicago to the White House, Obama shares her life journey. 
A personal story of growth, identity, and inspiration.',
85, 'P05', 3),
('B10', '978-0-06-112241-5', 'The Alchemist', 'Paulo Coelho', 'Fiction', 
'A shepherd follows his dreams to find treasure and meaning. 
A spiritual tale about destiny, purpose, and inner truth.',
65, 'P03', 48)

SELECT * FROM Books

CREATE TABLE Members(
    MemberID NVARCHAR(50) PRIMARY KEY,
    MemberName NVARCHAR(50),
    Address NVARCHAR(50),
    ContactNumber NVARCHAR(50),
    Email NVARCHAR(50)
)

INSERT INTO Members
(MemberID, MemberName, Address, ContactNumber, Email)
VALUES
('M01', 'Alice Tan', '12 Jalan SS2/5, Petaling Jaya', '012-345 6789', 'alice.tan@gmail.com'),
('M02', 'Benjamin Lee', '88 Jalan Ampang, Kuala Lumpur', '013-876 5432', 'benjamin.lee@gmail.com'),
('M03',	'Chloe Lim', '25 Taman Universiti, Skudai',	'016-998 1122',	'chloe.lim@gmail.com'),
('M04',	'Daniel Ng', '102 Jalan Tun Razak, KL',	'017-223 3344', 'daniel.ng@gmail.com'),
('M05',	'Esther Wong', '7 Persiaran Gurney, George Town', '011-899 7766', 'esther.wong@gmail.com'),
('M06', 'Farhan Zainal', '45 Jalan Setia Alam, Shah Alam', '018-300 4455', 'farhan.zainal@gmail.com'),
('M07',	'Grace Chong', '30 Lorong Selamat, Ipoh', '014-667 8899', 'grace.chong@gmail.com'),
('M08',	'Hafiz Rahman',	'66 Jalan Besar, Seremban',	'019-255 6633', 'hafiz.rahman@gmail.com'),
('M09',	'Irene Tan', '3 Jalan Bunga Raya, Melaka', '010-322 1100', 'irene.tan@gmail.com'),
('M10', 'Jason Teo', '12 Taman Intan, Kota Bharu', '012-700 2211', 'jason.teo@gmail.com')

SELECT * FROM Members

CREATE TABLE ShoppingCart (
    CartID NVARCHAR(50) PRIMARY KEY,
    MemberID NVARCHAR(50) UNIQUE,
    CreatedAt DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
)

INSERT INTO ShoppingCart
(CartID, MemberID, CreatedAt, TotalAmount)
VALUES
('SC01', 'M01', '2025-07-19', 79.90),
('SC02', 'M03', '2025-07-19', 25),
('SC03', 'M05', '2025-07-21', 150),
('SC04', 'M04', '2025-07-22', 59.90),
('SC05', 'M02', '2025-08-01', 135.9)

SELECT * FROM ShoppingCart

CREATE TABLE CartItems(
    CartID NVARCHAR(50),
    BookID NVARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    AddedAt Date,
    PRIMARY KEY (CartID, BookID),
    FOREIGN KEY (CartID) REFERENCES ShoppingCart(CartID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
)

INSERT INTO CartItems
(CartID, BookID, Quantity, UnitPrice, AddedAt)
VALUES
('SC01', 'B02', 1, 39.9, '2025-07-19'),
('SC01', 'B04', 1, 40, '2025-07-19'),
('SC02', 'B07', 1, 25, '2025-07-21'),
('SC03', 'B09',	1, 85, '2025-07-22'),
('SC03', 'B10',	1, 65, '2025-08-01'),
('SC04', 'B01',	1, 59.9, '2025-07-24'),
('SC05', 'B01',	1, 59.9, '2025-06-20'),
('SC05', 'B05', 2, 76 , '2025-07-26')

SELECT * FROM CartItems

CREATE TABLE Sales(
    SalesID NVARCHAR(50) PRIMARY KEY,
    MemberID NVARCHAR(50) FOREIGN KEY REFERENCES Members(MemberID),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    DeliveryStatus NVARCHAR(50),
    DeliveryDate DATE
)

INSERT INTO Sales
(SalesID, MemberID, OrderDate, TotalAmount, DeliveryStatus, DeliveryDate)
VALUES
('S01',	'M07', '2025-07-16', 364, 'Delivered', '2025-07-18'),
('S02',	'M02', '2025-07-17', 124.9, 'Delivered', '2025-07-19'),
('S03',	'M04', '2025-07-18', 79.8, 'Delivered',	'2025-07-29'),
('S04',	'M04', '2025-07-19', 25, 'Delivered', '2025-07-23'),
('S05',	'M05', '2025-07-20', 40, 'Delivered', '2025-07-28'),
('S06', 'M06', '2025-07-21', 38, 'Delivered', '2025-07-30'),
('S07',	'M07', '2025-07-22', 86.7, 'Pending', NULL),
('S08',	'M07', '2025-07-23', 17, 'Pending', NULL),
('S09',	'M04', '2025-07-24', 175, 'Delivered', '2025-07-29'),
('S10',	'M10', '2025-07-25', 124.9, 'Delivered', '2025-08-01')

SELECT * FROM Sales

UPDATE Sales
SET MemberID = 'M07'
WHERE SalesID = 'S01'

UPDATE Sales
SET MemberID = 'M04'
WHERE SalesID = 'S03'

CREATE TABLE SalesDetails(
    SalesID NVARCHAR(50),
    BookID NVARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Subtotal DECIMAL(10,2)
    PRIMARY KEY (SalesID, BookID),
    FOREIGN KEY (SalesID) REFERENCES Sales(SalesID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
)

INSERT INTO SalesDetails
(SalesID, BookID, Quantity, UnitPrice, Subtotal)
VALUES
('S01', 'B07', 1, 17, 17),
('S01',	'B08', 2, 90, 180),
('S01',	'B09', 2, 85, 170),
('S02',	'B10', 1, 65, 65),
('S02',	'B01', 1, 59.9,	59.9),
('S03',	'B02', 2, 39.9, 79.8),
('S04',	'B03', 1, 25, 25),
('S05',	'B04', 1, 40, 40),
('S06',	'B05', 1, 38, 38),
('S07',	'B06', 3, 28.9,	86.7),
('S08',	'B07', 1, 17, 17),
('S09',	'B08', 1, 90, 90),
('S09',	'B09', 1, 85, 85),
('S10', 'B10', 1, 65, 65),
('S10',	'B01', 1, 59.9,	59.9)

SELECT * FROM SalesDetails

CREATE TABLE Reviews(
    ReviewID NVARCHAR(50) PRIMARY KEY,
    MemberID NVARCHAR(50) FOREIGN KEY REFERENCES Members(MemberID),
    BookID NVARCHAR(50) FOREIGN KEY REFERENCES Books(BookID),
    Rating INT,
    Feedback NVARCHAR(255),
    ReviewDate Date
)

INSERT INTO Reviews
(ReviewID, MemberID, BookID, Rating, Feedback, ReviewDate)
VALUES
('R01',	'M03', 'B02', 9,
'A terrifyingly accurate portrayal of authoritarian control that still feels relevant today. 
Orwell`s vision is haunting and thought-provoking.', '2025-08-20'),
('R02', 'M06', 'B05', 5,
'I appreciated the raw honesty, but Holden`s constant complaining made it hard to connect.
A classic, but not for everyone.', '2025-08-21'),
('R03', 'M01', 'B07', 2, NULL, '2025-08-22'),
('R04',	'M05', 'B04', 6, NULL, '2025-08-23'),
('R05',	'M04', 'B08', 9, NULL, '2025-08-24'),
('R06', 'M08', 'B07', 8.5,
'An incredibly moving memoir. 
Tara`s journey from isolation to academic success is inspiring and shows the power of education.', '2025-08-12'),
('R07', 'M04', 'B03', 7,
'Witty dialogue and a strong female lead make this an enjoyable read, 
though the language may be a bit dense for modern readers.', '2025-08-26'),
('R08',	'M07', 'B06', 9, NULL, '2025-08-27'),
('R09', 'M04', 'B09', 9, NULL, '2025-08-19'),
('R10',	'M02', 'B10', 3,
'The message is meaningful, but the story felt overly simplistic and repetitive. 
It didn`t quite live up to the hype for me.', '2025-08-17')

SELECT * FROM Reviews

CREATE TABLE PurchaseOrders (
    PurchaseOrderID NVARCHAR(50) PRIMARY KEY,
    PublisherID NVARCHAR(50) FOREIGN KEY REFERENCES Publishers(PublisherID),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    DeliveryStatus NVARCHAR(50),
    DeliveryDate DATE,
    InvoiceNumber NVARCHAR(50),
)

INSERT INTO PurchaseOrders 
(PurchaseOrderID, PublisherID, OrderDate, TotalAmount, DeliveryStatus, DeliveryDate, InvoiceNumber)
VALUES
('PO01', 'P01', '2025-07-01', 1636.90, 'Delivered', '2025-07-08', 'INV-2301'),
('PO02', 'P06', '2025-07-02', 750.00, 'Delivered', '2025-07-11', 'INV-2302'),
('PO03', 'P03', '2025-07-03', 4660.00, 'Delivered', '2025-07-12', 'INV-2303'),
('PO04', 'P02', '2025-07-01', 289.00, 'Delivered', '2025-07-09', 'INV-2304'),
('PO05', 'P07', '2025-07-05', 2380.00, 'Delivered', '2025-07-14', 'INV-2305'),
('PO06', 'P04', '2025-07-06', 1800.00, 'Delivered', '2025-07-15', 'INV-2306'),
('PO07', 'P05', '2025-07-07', 1275.00, 'Delivered', '2025-07-13', 'INV-2307')

SELECT * FROM PurchaseOrders

CREATE TABLE PurchaseOrderDetails (
    PurchaseOrderID NVARCHAR(50),
    BookID NVARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Subtotal DECIMAL(10,2),
    PRIMARY KEY (PurchaseOrderID, BookID),
    FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrders(PurchaseOrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
)

INSERT INTO PurchaseOrderDetails 
(PurchaseOrderID, BookID, Quantity, UnitPrice, Subtotal)
VALUES
('PO01', 'B01', 20, 59.9, 1198.00),
('PO01', 'B02', 11, 39.9, 438.90),
('PO02', 'B03', 30, 25.0, 750.00),
('PO03', 'B07', 50, 17.0, 2000.00),
('PO03', 'B10', 70, 65.0, 2660.00),
('PO04', 'B06', 10, 28.9, 289.00),
('PO05', 'B04', 50, 40.0, 2000.00),
('PO05', 'B05', 10, 38.0, 380.00),
('PO06', 'B08', 20, 90.0, 1800.00),
('PO07', 'B09', 15, 85.0, 1275.00)

SELECT * FROM PurchaseOrderDetails

CREATE TABLE Invoices (
    InvoiceID NVARCHAR(50) PRIMARY KEY,
    PurchaseOrderID NVARCHAR(50) UNIQUE,
    InvoiceDate DATE,
    TotalAmount DECIMAL(10,2),
    PaymentStatus NVARCHAR(50),
    PaymentDate DATE,
    FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrders(PurchaseOrderID)
)

INSERT INTO Invoices 
(InvoiceID, PurchaseOrderID, InvoiceDate, TotalAmount, PaymentStatus, PaymentDate)
VALUES
('INV-2301', 'PO01', '2025-07-02', 1636.90, 'Paid', '2025-08-08'),
('INV-2302', 'PO02', '2025-07-03', 750.00, 'Paid', '2025-08-11'),
('INV-2303', 'PO03', '2025-07-04', 4660.00, 'Unpaid', NULL),
('INV-2304', 'PO04', '2025-07-02', 289.00, 'Paid', '2025-08-09'),
('INV-2305', 'PO05', '2025-07-06', 2380.00, 'Paid', '2025-08-14'),
('INV-2306', 'PO06', '2025-07-07', 1800.00, 'Paid', '2025-08-15'),
('INV-2307', 'PO07', '2025-07-08', 1275.00, 'Paid', '2025-08-13')

SELECT * FROM Invoices

SELECT Books.BookID, BookTitle, COUNT(Feedback) AS TotalNumberOfFeedbackPerBook FROM Books
LEFT JOIN Reviews ON Books.BookID = Reviews.BookID
GROUP BY Books.BookID, BookTitle

SELECT Members.MemberID, MemberName, COUNT(Feedback) AS TotalNumberOfFeedbackPerMember FROM Members
LEFT JOIN Reviews ON Members.MemberID = Reviews.MemberID
GROUP BY Members.MemberID, MemberName

SELECT Publishers.PublisherID, PublisherName, COUNT(BookID) AS NumberOfBookPublished FROM Publishers
LEFT JOIN Books ON Publishers.PublisherID = Books.PublisherID
GROUP BY Publishers.PublisherID, PublisherName

SELECT Genre, COUNT(Genre) AS TotalNumberOfGenre FROM Books
GROUP BY Genre

SELECT * FROM Books
WHERE QuantityInStock > (SELECT AVG(QuantityInStock) FROM Books)

SELECT 
    Publishers.PublisherID,
    Publishers.PublisherName,
    SUM(PurchaseOrderDetails.Quantity) AS TotalNumberOfBooksOrdered
FROM PurchaseOrderDetails
INNER JOIN PurchaseOrders ON PurchaseOrderDetails.PurchaseOrderID = PurchaseOrders.PurchaseOrderID
INNER JOIN Publishers ON PurchaseOrders.PublisherID = Publishers.PublisherID
GROUP BY Publishers.PublisherID, Publishers.PublisherName

SELECT * FROM Members
WHERE MemberID NOT IN 
(SELECT MemberID FROM Sales)

SELECT Genre FROM Books
WHERE QuantityInStock = (SELECT MAX(QuantityInStock) FROM Books)
GROUP BY Genre

SELECT Members.MemberID, Members.Address, Members.ContactNumber, 
Books.BookSerialNo, Books.BookTitle, 
SalesDetails.Quantity, Sales.OrderDate, Sales.DeliveryStatus
FROM Members
INNER JOIN Sales ON Members.MemberID = Sales.MemberID
INNER JOIN SalesDetails ON SalesDetails.SalesID = Sales.SalesID
INNER JOIN Books ON SalesDetails.BookID = Books.BookID
WHERE Sales.DeliveryStatus <> 'Delivered'

SELECT Members.MemberID, Members.MemberName, 
COUNT(Sales.MemberID) AS TotalNoOfBooksOrdered FROM Members
INNER JOIN Sales ON Members.MemberID = Sales.MemberID
GROUP BY Members.MemberID, Members.MemberName
HAVING COUNT(Sales.MemberID) > 2


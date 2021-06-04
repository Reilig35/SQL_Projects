/*
SQL code for Final Project
Author: William Twomey
Submitted: 04/06/2021
*/

--Creating Database
CREATE DATABASE Libary_Management_Database

--Selecting Database to use
USE Libary_Management_Database

--Creating Libary Branch Table
CREATE TABLE LIBARY_BRANCH (
	Branch_ID INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	BranchName VARCHAR(50) NOT NULL,
	Branch_Address VARCHAR(50) NOT NULL
)
;

--Creating Borrower Table
CREATE TABLE BORROWER (
	Card_No INT PRIMARY KEY NOT NULL IDENTITY(10, 1),
	Borrower_Name VARCHAR(50) NOT NULL,
	Borrower_Address VARCHAR(200) NOT NULL,
	Borrower_Phone_No VARCHAR(15) NOT NULL
)
;

--Creating Book Copies Table
CREATE TABLE BOOK_COPIES (
	Book_ID INT,
	Branch_ID INT,
	Number_of_Copies INT
)
;

--Creating Books Table
CREATE TABLE BOOKS (
	Book_ID INT PRIMARY KEY NOT NULL IDENTITY(100, 1),
	Title VARCHAR (50) NOT NULL,
	Publisher_Name VARCHAR (50) NOT NULL
)
;

--Creating Books Author Table
CREATE TABLE BOOK_AUTHORS (
	Book_ID INT,
	Author_Name VARCHAR (50)
)
;

--Creating Publisher Table
CREATE TABLE PUBLISHER (
	Publisher_Name VARCHAR (50) PRIMARY KEY NOT NULL,
	Publisher_Address VARCHAR (50) NOT NULL,
	Publisher_Phone_No VARCHAR(15) NOT NULL
)
;

--Creating Book Loan Table
CREATE TABLE BOOK_LOANS (
	Book_ID INT,
	Branch_ID INT,
	Card_No INT,
	Date_OUT DATE,
	Date_DUE DATE
)
;


--Adding Foregin Keys to Book Copies Table
ALTER TABLE BOOK_COPIES
ADD CONSTRAINT FK_Branch_ID_1
FOREIGN KEY (Branch_ID) REFERENCES LIBARY_BRANCH(Branch_ID)ON UPDATE CASCADE ON DELETE CASCADE
;

ALTER TABLE BOOK_COPIES
ADD CONSTRAINT FK_Book_ID_1
FOREIGN KEY (Book_ID) REFERENCES BOOKS(Book_ID)ON UPDATE CASCADE ON DELETE CASCADE
;

--Adding Foregin Key to Authors Copies Table
ALTER TABLE BOOK_AUTHORS
ADD CONSTRAINT FK_BookID_2
FOREIGN KEY (Book_ID) REFERENCES BOOKS(Book_ID)ON UPDATE CASCADE ON DELETE CASCADE
;

--Adding foregin key to Book Loans Table
ALTER TABLE BOOK_LOANS
ADD CONSTRAINT FK_BookID_3
FOREIGN KEY (Book_ID) REFERENCES BOOKS(Book_ID)ON UPDATE CASCADE ON DELETE CASCADE
;

ALTER TABLE BOOK_LOANS
ADD CONSTRAINT FK_Card_No_1
FOREIGN KEY (Card_No) REFERENCES BORROWER(Card_No)ON UPDATE CASCADE ON DELETE CASCADE
;

ALTER TABLE BOOK_LOANS
ADD CONSTRAINT FK_Branch_ID_2
FOREIGN KEY (Branch_ID) REFERENCES LIBARY_BRANCH(Branch_ID) ON UPDATE CASCADE ON DELETE CASCADE
;

--Adding foregin key to Books Table 
ALTER TABLE BOOKS
ADD CONSTRAINT FK_Publisher_1
FOREIGN KEY (Publisher_Name) REFERENCES Publisher(Publisher_Name) ON UPDATE CASCADE ON DELETE CASCADE
;




--Populating Libary Branch Table
INSERT INTO LIBARY_BRANCH
	(BranchName, Branch_Address)
	VALUES
	('National Libary','Dublin'),
	('Book Buddys','Tralee'),
	('Sharpstown','Sharpstown'),
	('Silence','Limerick'),
	('Vibes n Scribes','Cork'),
	('Worm','Kildare')
;


INSERT INTO BORROWER
	(Borrower_Name, Borrower_Address, Borrower_Phone_No)
	VALUES
	('Harry Hill', 'Cork', '258-011-256'),
	('Joan Murphy', 'Kildare', '301-489-256'),
	('Gary Rambo', 'Dublin', '558-571-986'),
	('Jesus Puras', 'Kerry', '258-000-126'),
	('Jenny Fiend', 'Cork', '258-011-368'),
	('Scott Hall', 'Mayo', '889-741-166'),
	('Tom Andrews', 'Dublin', '558-571-014'),
	('Lucy Hill', 'Cork', '258-011-347')
;

--Populating Table Publisher
INSERT INTO PUBLISHER
	(Publisher_Name, Publisher_Address, Publisher_Phone_No)
	VALUES
	('Paddy Books','Dublin', '001-268-548'),
	('Puffin','London', '058-748-588'),
	('Eye See U','Toronto', '471-224-888'),
	('Eagle','New Jersey', '881-888-888'),
	('Reader','Toronto', '745-256-547'),
	('Ladybird','Scunthorpe', '221-999-574'),
	('Rockstar','Glasgow', '561-123-547'),
	('Warrior','Milan', '321-888-741'),
	('Cheese','Paris', '547-698-111'),
	('Kat','Cork', '021-874-969')
;


--Populating Books Table
INSERT INTO BOOKS
	(Title, Publisher_Name)
	VALUES
	('The Lost Tribe','Puffin'),
	('Fantastic Mr Fox','Ladybird'),
	('Knight Rider','Eagle'),
	('Dracula','Paddy Books'),
	('In Search of Lost Time','Eye See U'),
	('Ulysses','Paddy Books'),
	('Don Quixote','Cheese'),
	('The Great Gatsby','Eagle'),
	('Moby Dick','Puffin'),
	('War and Peace','Rockstar'),
	('Hamlet','Reader'),
	('Madame Bovary','Cheese'),
	('Lolita','Warrior'),
	('Crime and Punishment','Kat'),
	('The Catcher in the Rye','Eagle'),
	('The Adventures of Huckleberry Finn','Eagle'),
	('The Iliad','Paddy Books'),
	('Catch-22','Eye see U'),
	('Nineteen Eighty Four','Ladybird'),
	('To Kill a Mockingbird','Eagle')
;

--Populating Author Table
INSERT INTO BOOK_AUTHORS
	(Book_ID, Author_Name)
	VALUES
	(103, 'Bram Stroker'),
	(101, 'Roald Dhal'),
	(105, 'Tony Kent'),
	(110, 'Bill Shakesphere'),
	(119, 'Harper Lee'),
	(118, 'George Orwell'),
	(111, 'Bram Stroker'),
	(102, 'David Hasselhoff'),
	(100, 'George Orwell'),
	(116, 'Bram Stroker')
;

--Populating Book Copies Table
INSERT INTO BOOK_COPIES
	(Book_ID, Branch_ID, Number_of_Copies )
	VALUES
	(100, 5, 15),
	(101, 3, 12),
	(102, 6, 5),
	(103, 1, 27),
	(104, 5, 3),
	(105, 4, 10),
	(106, 2, 2),
	(107, 1, 18),
	(108, 3, 3),
	(109, 4, 17),
	(100, 3, 32)
;

--Populating Book Loans Table
INSERT INTO BOOK_LOANS
	(Book_ID, Branch_ID, Card_No, Date_OUT, Date_DUE)
	VALUES
	(100, 3, 16, '2021-04-25', '2021-05-31'),
	(105, 1, 10, '2021-05-31', '2021-06-10'),
	(102, 6, 16, '2021-01-10', '2021-03-14'),
	(101, 3, 12, '2020-12-24', '2021-01-21'),
	(104, 5, 10, '2021-05-01', '2021-06-28'),
	(112, 4, 13, '2021-05-31', '2021-06-05'),
	(109, 2, 10, '2021-05-01', '2021-06-01'),
	(117, 1, 15, '2021-05-21', '2021-05-31'),
	(119, 3, 16, '2021-04-17', '2021-05-21'),
	(116, 1, 14, '2021-05-10', '2021-06-15')
;


--Procedure 1 Find number of copies at Sharpstown of The Lost Tribe
CREATE PROCEDURE dbo.usp_Copies_Of_LostTribe@Sharpstown
AS
SELECT  
BOOKS.Title,
LIBARY_BRANCH.BranchName AS 'Branch',
BOOK_COPIES.Number_of_Copies AS 'Available'
FROM BOOK_COPIES
INNER JOIN BOOKS ON BOOK_COPIES.Book_ID = BOOKS.Book_ID
INNER JOIN LIBARY_BRANCH ON BOOK_COPIES.Branch_ID = LIBARY_BRANCH.Branch_ID
WHERE Title = 'The Lost Tribe' AND BranchName = 'Sharpstown'
;

GO
EXEC dbo.usp_Copies_Of_LostTribe@Sharpstown


--Procedure 2 Find number of copies of The Lost Tribe at all branches
CREATE PROCEDURE dbo.usp_Copies_Of_LostTribe@LibaryBranches
AS
SELECT
BOOKS.Title,
LIBARY_BRANCH.BranchName AS 'Branch',
BOOK_COPIES.Number_of_Copies AS 'Available'
FROM BOOK_COPIES
INNER JOIN BOOKS ON BOOK_COPIES.Book_ID = BOOKS.Book_ID
INNER JOIN LIBARY_BRANCH ON BOOK_COPIES.Branch_ID = LIBARY_BRANCH.Branch_ID
WHERE Title = 'The Lost Tribe'
;

GO
EXEC dbo.usp_Copies_Of_LostTribe@LibaryBranches


--Procedure 3 Find members without books checked out
CREATE PROCEDURE dbo.usp_Members_Without_Books
AS
SELECT 
BORROWER.Card_No AS 'Member No',
BORROWER.Borrower_Name AS 'Name',
BORROWER.Borrower_Address AS 'City'
FROM BOOK_LOANS FULL OUTER JOIN BORROWER ON BOOK_LOANS.Card_No = BORROWER.Card_No
FULL OUTER JOIN BOOKS ON BOOK_LOANS.Book_ID = BOOKS.Book_ID
WHERE Title IS NULL
;

GO
EXEC dbo.usp_Members_Without_Books




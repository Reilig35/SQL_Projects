--Creating Database
CREATE DATABASE Libary_Management_Database

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
);

--Creating Book Loan Table
CREATE TABLE BOOK_LOANS (
	Book_ID INT,
	Branch_ID INT,
	Card_No INT,
	Date_OUT VARCHAR(11),
	Date_DUE VARCHAR(11)
);


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
	('Jucy Hill', 'Cork', '258-011-347')
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

SELECT * FROM PUBLISHER
SELECT * FROM BORROWER
SELECT * FROM LIBARY_BRANCH

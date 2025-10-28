-- -------------------------------------------
-- File: schema.sql
-- Database: LibraryDB

-- -------------------------------------------


CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- 1. Authors Table 

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Nationality VARCHAR(50)
);


-- 2. Books Table 

CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT,
    ISBN VARCHAR(20) UNIQUE NOT NULL, 
    PublicationYear YEAR,
    AvailabilityStatus ENUM('Available', 'Loaned', 'Lost') DEFAULT 'Available',
    
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);


-- 3. Members Table 

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    RegistrationDate DATE NOT NULL
);

-- 4. Loans Table 

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    LoanDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE, 
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
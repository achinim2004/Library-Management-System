-- 1.Initial Data Insertion (INSERT)


USE LibraryDB;

-- A. Authors Table 

INSERT INTO Authors (FirstName, LastName, Nationality) VALUES
('Arthur C.', 'Clarke', 'British'),
('Martin', 'Wickramasinghe', 'Sri Lankan'),
('J.K.', 'Rowling', 'British'),
('George', 'Orwell', 'British');

-- B. Books Table 

INSERT INTO Books (Title, AuthorID, ISBN, PublicationYear, AvailabilityStatus) VALUES
('2001: A Space Odyssey', 1, '1234567890123', 1968, 'Available'),
('Gamperaliya', 2, '2345678901234', 1944, 'Available'),
('Harry Potter and the Sorcerers Stone', 3, '3456789012345', 1997, 'Available'),
('Animal Farm', 4, '4567890123456', 1945, 'Available'),
('1984', 4, '5678901234567', 1949, 'Available');

-- C. Members Table 

INSERT INTO Members (FirstName, LastName, Email, RegistrationDate) VALUES
('Kasun', 'Perera', 'kasun@example.com', '2025-01-10'),
('Nirosha', 'Silva', 'nirosha@example.com', '2025-02-15'),
('Amal', 'Fernando', 'amal@example.com', '2025-03-20');


-- -----------------------------------------------------------------------------------------------------------------------


-- 2.Transaction and Data Update Queries

   

-- A. Lending a Book

-- Lending a Book: MemberID 1 (Kasun Perera) borrows BookID 3 (Harry Potter).

-- 1. Insert into the Loans Table
INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate)
VALUES (3, 1, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));

-- 2. Update the Books Table status
UPDATE Books
SET AvailabilityStatus = 'Loaned'
WHERE BookID = 3;


-- B. Returning a Book

-- Returning a Book: Assuming the LoanID for BookID 3 is 1 (after the previous INSERT).

-- 1. Update the Loans Table by setting the ReturnDate
UPDATE Loans
SET ReturnDate = CURDATE()
WHERE LoanID = 1 AND BookID = 3;

-- 2. Update the Books Table status back to 'Available'
UPDATE Books
SET AvailabilityStatus = 'Available'
WHERE BookID = 3;








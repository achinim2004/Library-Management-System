📚 Library Management System (LMS) Database Project - MySQL



This project presents a Relational Database Schema (ERD) designed using MySQL for managing core data operations within a typical library.



It covers key LMS functionalities such as book lending, member registration, and data analysis (like generating overdue reports).



---



&nbsp;💻 Tech Stack



\* Language: Structured Query Language (SQL)

\* Concepts Demonstrated:DDL, DML, Primary/Foreign Keys, JOINs, Grouping.



---



&nbsp;📁 Project Files and Purpose



| File Name | Purpose |

| :--- | :--- |

| `schema.sql` | DDL (Data Definition Language):Contains the code to create the four main tables (Authors, Books, Members, Loans). |

| `queries.sql` | DML (Data Manipulation Language): Includes sample data insertion, lending/return transactions, and complex analytical queries. |

| `README.md` | Project description and setup guide. |



---



💾 Database Schema



The system relies on four primary tables linked by Foreign Keys (Relationships):



| Table | Description | Key Fields |

| :--- | :--- | :--- |

| Authors | Details of book authors. | `AuthorID` (PK) |

| Books | Information about the books in the library. | `BookID` (PK), `AuthorID` (FK) |

| Members | Registered library members' details. | `MemberID` (PK) |

| Loans | Records of book lending and return transactions. | `LoanID` (PK), `BookID` (FK), `MemberID` (FK) |



---





🎯 Key SQL Functionality Demonstrations



A few examples of the important queries contained in the `queries.sql` file:



&nbsp;A. Finding Overdue Books



Uses a `JOIN` to list books that have not been returned (`ReturnDate IS NULL`) and whose due date is past the current date.



```sql

SELECT 

&nbsp;   M.FirstName, 

&nbsp;   M.LastName, 

&nbsp;   B.Title, 

&nbsp;   L.DueDate

FROM Loans L

JOIN Members M ON L.MemberID = M.MemberID

JOIN Books B ON L.BookID = B.BookID

WHERE L.ReturnDate IS NULL AND L.DueDate < CURDATE();


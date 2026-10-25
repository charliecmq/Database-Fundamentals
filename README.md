# 📚 E-Bookstore Database System

## 📌 Overview

This project designs, implements, and documents a relational database system for an **online electronic bookstore (E-Bookstore)** based in Kuala Lumpur, Malaysia.

The bookstore purchases books of various genres from publishers, stores them in a warehouse, and sells them to registered members through an online store. The database manages the full business cycle — from restocking books via purchase orders, through member registration and online shopping, to sales, delivery, reviews, and invoicing.

This was developed as a coursework project for the **Database Fundamentals (ODBF)** module, covering conceptual design (ER modelling), logical design, physical implementation (DDL), and data manipulation (DML) queries that answer real business questions.

## 🎯 Objectives

- Design a normalized relational database for the E-Bookstore scenario.
- Model the business using an Entity Relationship Diagram (ER diagram).
- Implement the schema in Microsoft SQL Server using Data Definition Language (DDL).
- Populate the tables with sample data using Data Manipulation Language (DML).
- Write DML queries that answer key business questions about books, members, publishers, sales, and reviews.

## 📊 Data Source

The database scenario, business rules, and requirements were provided as part of the **Database Fundamentals (ODBF) course assignment**. No external dataset is used — all records are synthetic sample data created specifically for this project to demonstrate the schema and queries.

## 🛠️ Tools & Technologies

- **Microsoft SQL Server** — relational database engine
- **Azure Data Studio** — SQL development and query execution
- **Docker** — containerized SQL Server instance
- **T-SQL** — Data Definition Language (DDL) and Data Manipulation Language (DML)
- **Microsoft Visio** (or similar) — ER diagram design

## 🗂️ Database Design

### Business Rules

- The bookstore purchases books from **publishers** and sells them to **members**.
- The store manager compiles needed books and sends **purchase orders** to publishers; the publisher supplies the ordered books.
- Arriving books are recorded, and an **invoice** is generated for the accounts department to process payment.
- Anyone wishing to buy books online must first **register as a member**. Members can view book information and read reviews.
- Members add books to a **shopping cart**, which shows a summary of the selection and total cost.
- Once payment is made, books are delivered to the member within **7 working days**.
- A member may submit a **review** for a book as a rating (1–10, where 1 = terrible and 10 = masterpiece) with optional short text.
- **Only one review per member per book** is allowed, and reviews cannot be changed once submitted.

### Entity Relationship Diagram

![ER Diagram](images/er-diagram.png)

### Database Diagram

![Database Diagram](images/database-diagram.png)

### Entities

The database consists of the following tables:

| Table | Description |
|---|---|
| `Publishers` | Publishers that supply books to the store. |
| `Books` | Book catalogue, including title, author, genre, price, and stock. |
| `Members` | Registered customers who can shop and review. |
| `ShoppingCart` | A member's active cart. |
| `CartItems` | Line items (books and quantities) within a shopping cart. |
| `Sales` | Member orders. |
| `SalesDetails` | Line items for each sale. |
| `Reviews` | Member ratings and feedback on books (one per member per book). |
| `PurchaseOrders` | Orders the store sends to publishers to restock. |
| `PurchaseOrderDetails` | Line items for each purchase order. |
| `Invoices` | Invoices generated from purchase orders. |

## 🔍 Business Queries (DML)

The project includes ten DML queries that answer the following business questions:

1. Total number of reviews (feedback) per book — showing book ID, title, and count.
2. Total number of reviews per member — showing member ID, name, and count.
3. Total number of books published by each publisher — showing publisher ID, name, and count.
4. Total number of books in each genre.
5. Books whose quantity is greater than the average quantity of all books.
6. Total number of books ordered by the store manager from various publishers.
7. Members who did not make any order.
8. The genre with the highest total quantity in stock.
9. Purchased books not yet delivered — showing member ID, address, contact number, book serial number, title, quantity, delivery date, and delivery status.
10. Members who made more than two orders.

> The SQL for these queries is provided in `sql/` (see Repository Contents).

## ⚠️ Limitations

- The database uses a limited set of synthetic sample data (5–10 rows per table) intended to demonstrate the schema and queries, not to reflect real transaction volumes.
- The design reflects the scope of the course scenario and selected business rules; a production system would require additional considerations such as security, indexing strategy, payment integration, and concurrency handling.

## 🗄️ Repository Contents

- `sql/` — SQL scripts (schema/DDL, sample data, and the business queries).
- `images/` — ER diagram, database diagram, and execution screenshots.
- `docs/` — the original assignment brief and the full project documentation/report.
- `README.md` — project documentation.
- `LICENSE` — license terms for this repository.

## 👤 Author

**Chin Mun Qin**

Developed as an academic coursework project for the Database Fundamentals (ODBF) module, covering relational database design and implementation in Microsoft SQL Server.

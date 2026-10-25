# 📚 E-Bookstore Database System

A relational database system for an **online electronic bookstore (E-Bookstore)** — designed and implemented in Microsoft SQL Server. The system models the full business cycle of an online book retailer: restocking from publishers, member registration and shopping, sales and delivery, reviews, and invoicing.

## 📌 Overview

A bookstore in Kuala Lumpur, Malaysia holds a large collection of books in its warehouse. It orders books of various genres from different publishers and sells them to customers. To reach more customers, the business wants an **online store**, which requires a database to manage books, members, orders, reviews, and the restocking supply chain.

This project designs and implements that database — from conceptual data modelling (ER design) through to a working SQL Server schema with sample data and example queries that answer real business questions.

## 🎯 Objectives

- Design a normalized relational schema for an online bookstore.
- Model the business domain with an Entity Relationship Diagram.
- Implement the schema in Microsoft SQL Server (DDL with primary/foreign keys and constraints).
- Populate the database with realistic sample data.
- Provide example queries that demonstrate joins, aggregation, subqueries, and filtering against the schema.

## 🧩 Problem Statement

- The bookstore purchases books from **publishers** and sells them to **members**. The store manager compiles a list of needed books and sends a **purchase order** to publishers; the publisher supplies the ordered books.
- Arriving books are recorded, and an **invoice** is generated for the accounts department to process payment.
- Customers must **register as members** before buying online. Members can view book information and read reviews.
- Members add books to a **shopping cart** that shows the selection summary and total cost. After payment, books are delivered within **7 working days**.
- A member can **review** a book with a rating (1–10, where 1 = terrible and 10 = masterpiece) and optional short text. Only **one review per member per book** is allowed, and reviews cannot be edited once submitted.

## 🛠️ Tech Stack

- **Microsoft SQL Server 2022** — relational database engine
- **Docker** — containerized SQL Server instance
- **Azure Data Studio** — SQL development and query execution
- **T-SQL** — schema definition (DDL) and queries (DML)

## 🗺️ Database Schema

![Database Schema](images/final.svg)

### Entities

| Table | Description |
|---|---|
| `Publishers` | Publishers that supply books to the store. |
| `Books` | Book catalogue: title, author, genre, price, and stock quantity. |
| `Members` | Registered customers who can shop and review. |
| `ShoppingCart` | A member's active cart. |
| `CartItems` | Line items (books and quantities) within a shopping cart. |
| `Sales` | Member orders. |
| `SalesDetails` | Line items for each sale. |
| `Reviews` | Member ratings and feedback on books (one per member per book). |
| `PurchaseOrders` | Orders the store sends to publishers to restock. |
| `PurchaseOrderDetails` | Line items for each purchase order. |
| `Invoices` | Invoices generated from purchase orders. |

## 🚀 Getting Started

### Prerequisites

- [Docker](https://www.docker.com/)
- [Azure Data Studio](https://learn.microsoft.com/en-us/azure-data-studio/) (or `sqlcmd`)

### 1. Run SQL Server in Docker

```bash
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=YourStrong!Passw0rd" \
  -p 1433:1433 --name ebookstore-sql \
  -d mcr.microsoft.com/mssql/server:2022-latest
```

### 2. Connect

Open Azure Data Studio and connect to:
- **Server:** `localhost`
- **User:** `sa`
- **Password:** the password you set above

### 3. Build the database

Run the scripts in this order:

```
1. sql/schema.sql        -- creates the tables, keys, and constraints
2. sql/sample_data.sql   -- loads sample records
3. sql/queries.sql       -- run the example queries
```

## 🔍 Example Queries

The `sql/queries.sql` script demonstrates the database with queries such as:

- Total number of reviews per book (book ID, title, count).
- Total number of reviews per member (member ID, name, count).
- Number of books published by each publisher.
- Number of books in each genre.
- Books with stock quantity above the average of all books.
- Total number of books ordered by the store manager from publishers.
- Members who have not placed any order.
- The genre with the highest total quantity in stock.
- Purchased books not yet delivered (member ID, address, contact, book serial number, title, quantity, delivery date and status).
- Members who placed more than two orders.

These show common SQL patterns — `JOIN`, `GROUP BY`, `HAVING`, aggregate functions, and subqueries.

## ⚠️ Notes & Limitations

- The database is populated with a small set of synthetic sample data to demonstrate the schema and queries, not real transaction volumes.
- The design focuses on the core retail/supply-chain domain. A production deployment would add security hardening, indexing strategy, payment-gateway integration, and concurrency handling.

## 🗄️ Repository Contents

- `sql/` — SQL scripts: schema (DDL), sample data, and example queries.
- `images/` — database schema diagram (`final.svg`) and optional query screenshots.
- `README.md` — project documentation.
- `LICENSE` — license terms for this repository.

## 👤 Author

**Chin Mun Qin**

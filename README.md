# 📚 Bookstore Database Analysis — SQL Project

A SQL project analyzing a bookstore database containing books, customers, and orders data. The project covers both basic and advanced SQL queries using PostgreSQL.

---

## 🗄️ Database Structure

The database consists of 3 tables:

**Books** — 500 records
| Column | Type |
|---|---|
| Book_ID | Integer |
| Title | Text |
| Author | Text |
| Genre | Text |
| Published_Year | Integer |
| Price | Decimal |
| Stock | Integer |

**Customers** — 500 records
| Column | Type |
|---|---|
| Customer_ID | Integer |
| Name | Text |
| Email | Text |
| Phone | Text |
| City | Text |
| Country | Text |

**Orders** — 500 records
| Column | Type |
|---|---|
| Order_ID | Integer |
| Customer_ID | Integer |
| Book_ID | Integer |
| Order_Date | Date |
| Quantity | Integer |
| Total_Amount | Decimal |

---

## 📝 SQL Concepts Covered

- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Aggregate functions — `SUM`, `AVG`, `COUNT`, `ROUND`
- `GROUP BY` and `HAVING`
- `JOIN` (INNER JOIN, LEFT JOIN)
- `DISTINCT`
- `COALESCE` for handling NULL values
- `DATE` filtering and `TO_CHAR` for date formatting
- Subqueries and filtering with `BETWEEN`

---

## 🔍 Questions Answered

### Basic Queries
1. Retrieve all books in the "Fiction" genre
2. Find books published after 1950
3. List all customers from Canada
4. Show orders placed in November 2023
5. Retrieve total stock of books available
6. Find the most expensive book
7. Show customers who ordered more than 1 quantity
8. Retrieve orders where total amount exceeds $20
9. List all genres available
10. Find the book with the lowest stock
11. Calculate total revenue from all orders

### Advanced Queries
1. Total books sold per genre
2. Average price of books in the Fantasy genre
3. Customers who placed at least 2 orders
4. Most frequently ordered book
5. Top 3 most expensive Fantasy books
6. Total quantity sold per author
7. Cities where customers spent over $30
8. Customer who spent the most overall
9. Remaining stock after fulfilling all orders

### My Own Analysis
- A) Which month had the highest revenue?
- B) Which country has the most customers?
- C) Authors whose books have never been ordered
- D) Average order value per customer

---

## 🛠️ Tools Used
- PostgreSQL
- pgAdmin 4

---

## 📁 Files
| File | Description |
|---|---|
| `sql_project.sql` | All SQL queries |
| `Books.csv` | Books dataset |
| `Customers.csv` | Customers dataset |
| `Orders.csv` | Orders dataset |

---

## 🙏 Credits
Project inspired by a tutorial. Dataset and additional analysis queries written independently.

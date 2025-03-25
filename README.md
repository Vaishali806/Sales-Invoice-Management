Project Overview
The Sales Invoice Management System is a web-based application designed to streamline the process of managing sales data, providing key features such as viewing most sold products, filtering products by category, searching products, and exporting sales data. This system is intended for businesses and retailers who need an efficient solution to manage and analyze their sales records.

The system is built using Java for the backend and JSP (Java Server Pages) for the front-end. It integrates with a MySQL database to store sales information, and provides the option to filter and export sales data in various formats (CSV, Excel, PDF).

Key Features
View Most Sold Products: Displays a list of products along with their total quantities sold.

Search Functionality: Allows users to search products based on their names.

Filter by Category: Users can filter products by categories such as Electronics, Furniture, and Clothing.

Data Export: Allows exporting the sales data in multiple formats, including CSV, Excel, and PDF.

User-Friendly Interface: The web pages are designed to be interactive and responsive, with a modern and visually appealing UI.

Technologies Used
Backend: Java (JSP, Servlets)

Frontend: HTML, CSS

Database: MySQL

Libraries:

Apache POI for Excel export

iText for PDF export

JavaScript for form validation and client-side interactions

IDE: Eclipse or IntelliJ IDEA (for development)

Version Control: Git, GitHub

Database Schema
The Sales Invoice Management System uses the following database schema:

sales_records table:
Stores the records of all sales transactions.

CREATE TABLE sales_records (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    product VARCHAR(100),
    quantity INT,
    price DOUBLE,
    category VARCHAR(50),
    sale_date DATE
);
Setup and Installation
Clone the Repository:
git clone https://github.com/Vaishali806/Sales-Invoice-Management.git

Set up MySQL Database:

Create a MySQL database and configure the connection settings in the application.

Run the provided SQL script to create the sales_records table and insert sample data.

Build and Run the Application:

Open the project in your preferred IDE (Eclipse/IntelliJ IDEA).

Compile and deploy the application to a local or remote server.

Access the application through the browser.

Access the Application:

Open the application URL in your browser: http://localhost:8080/sales-invoice-management

Usage
Once the application is running, users can:

View the list of most sold products.

Filter products by category (Electronics, Furniture, Clothing).

Search products by their name.

Export the sales data to CSV, Excel, or PDF format.



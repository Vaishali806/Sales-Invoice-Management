<%@ page import="java.util.List" %>
<%@ page import="com.salesinvoice.SalesDAO" %>
<%@ page import="com.salesinvoice.MostSoldProduct" %>
<!DOCTYPE html>
<html>
<head>
    <title>Most Sold Products</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f0f4f8, #d9e4f5);
            margin: 0;
            padding: 0;
            text-align: center;
            animation: fadeInBody 1s ease-in-out;
        }
        @keyframes fadeInBody {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        h2 {
            color: #2c3e50;
            text-transform: uppercase;
            letter-spacing: 1px;
            background: linear-gradient(90deg, #007bff, #00c6ff);
            background-clip: text;
            -webkit-text-fill-color: transparent;
            margin: 30px 0;
            animation: slideDown 1s ease-in-out;
        }
        @keyframes slideDown {
            from { transform: translateY(-40px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            box-shadow: 0 8px 20px rgba(0,0,0,0.05);
            border-radius: 15px;
            overflow: hidden;
            animation: fadeInTable 1s ease-in-out;
        }
        @keyframes fadeInTable {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }
        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #f0f0f0;
        }
        th {
            background: linear-gradient(90deg, #007bff, #00c6ff);
            color: white;
        }
        tr:hover {
            background-color: #f0f9ff;
            transition: 0.3s;
        }
        input[type="text"] {
            padding: 10px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 14px;
            margin-bottom: 20px;
            text-align: center;
            transition: all 0.3s ease;
        }
        input[type="text"]:focus {
            border-color: #00c6ff;
            box-shadow: 0 0 12px rgba(0, 198, 255, 0.4);
            outline: none;
            transform: scale(1.02);
        }
        button, a.export-btn {
            padding: 10px 20px;
            border: none;
            background: linear-gradient(90deg, #007bff, #00c6ff);
            color: white;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
            font-weight: bold;
            text-decoration: none;
            margin: 8px;
            display: inline-block;
        }
        button:hover, a.export-btn:hover {
            transform: scale(1.1);
            box-shadow: 0 8px 20px rgba(0, 123, 255, 0.3);
        }
        .center-link {
            margin: 30px auto;
        }
        .center-link a {
            padding: 12px 30px;
            background: linear-gradient(90deg, #007bff, #00c6ff);
            color: white;
            border-radius: 14px;
            display: inline-block;
            text-decoration: none;
            font-weight: bold;
            box-shadow: 0 8px 20px rgba(0, 123, 255, 0.3);
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
        }
        .center-link a:hover {
            background-color: #0056b3;
            transform: scale(1.08);
            box-shadow: 0 12px 35px rgba(0, 86, 179, 0.4);
        }
        select {
            padding: 10px;
            width: 180px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 14px;
            margin-bottom: 20px;
            text-align: center;
            transition: all 0.3s ease;
            background-color: white; /* White background for the dropdown */
            color: #333; /* Text color */
        }

        select:focus {
            border-color: #00c6ff;
            box-shadow: 0 0 12px rgba(0, 198, 255, 0.4);
            outline: none;
            transform: scale(1.02);
        }

        select:hover {
            background-color: #f0f9ff; /* Light hover effect */
            box-shadow: 0 8px 20px rgba(0, 123, 255, 0.2);
            transition: background-color 0.3s, box-shadow 0.3s;
        }
    </style>
</head>
<body>
<h2>Most Sold Products</h2>

<form method="get">
    <input type="text" name="search" placeholder="Search by Product" value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>" />
    
    <!-- Dropdown for Category Selection -->
    <select name="category" id="category">
        <option value="">--Select Category--</option>
        <option value="electronics" <%= request.getParameter("category") != null && request.getParameter("category").equals("electronics") ? "selected" : "" %>>Electronics</option>
        <option value="furniture" <%= request.getParameter("category") != null && request.getParameter("category").equals("furniture") ? "selected" : "" %>>Furniture</option>
        <option value="clothing" <%= request.getParameter("category") != null && request.getParameter("category").equals("clothing") ? "selected" : "" %>>Clothing</option>
        <!-- Add more categories as needed -->
    </select>
    <button type="submit">Search &amp; Filter</button>
</form>

<table>
    <tr>
        <th>Product</th>
        <th>Total Sold</th>
    </tr>
<%
    String search = request.getParameter("search");
    String category = request.getParameter("category");

    // Fetch products based on search and category filter
    List<MostSoldProduct> products = SalesDAO.getMostSoldProducts(search, category);

    for (MostSoldProduct p : products) {
%>
    <tr>
        <td><%= p.getProduct() %></td>
        <td><%= p.getQuantity() %></td>
    </tr>
<%
    }
%>
</table>

<div class="center-link">
    <a href="index.jsp" class="home-btn">Back to Home</a>
</div>

<div>
    <button onclick="location.href='ExportMostSoldServlet?type=csv'">Export as CSV</button>
    <button onclick="location.href='ExportMostSoldServlet?type=excel'">Export as Excel</button>
    <button onclick="location.href='ExportMostSoldServlet?type=pdf'">Export as PDF</button>
</div>

</body>
</html>

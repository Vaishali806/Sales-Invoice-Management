<%@ page import="java.util.*, com.salesinvoice.SalesRecord, com.salesinvoice.SalesDAO" %>
<%
List<SalesRecord> records = SalesDAO.getAllRecords();
if(request.getParameter("deleteId") != null){
    SalesDAO.deleteRecord(Integer.parseInt(request.getParameter("deleteId")));
    response.sendRedirect("viewSales.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
   
 <title>Sales Records</title>
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
            width: 90%;
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
        button {
            padding: 8px 16px;
            border: none;
            background: linear-gradient(90deg, #007bff, #00c6ff);
            color: white;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        button:hover {
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
        
        .home-btn {
    padding: 12px 30px;
    background: linear-gradient(90deg, #007bff, #00c6ff);
    color: white;
    border-radius: 14px;
    display: inline-block;
    font-size: 16px;
    font-weight: bold;
    text-decoration: none;
    transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
    box-shadow: 0 8px 20px rgba(0, 123, 255, 0.3);
    margin-top: 30px;
}
    .home-btn:hover {
    background-color: #0056b3;
    transform: scale(1.08);
    box-shadow: 0 12px 35px rgba(0, 86, 179, 0.4);
}
   
        
    </style>
</head>
<body>
<h2>Sales Records</h2>
<table border="1">
<tr>
    <th>ID</th><th>Customer</th><th>Product</th><th>Qty</th><th>Price</th><th>Category</th><th>Date</th><th>Actions</th>
</tr>
<%
for(SalesRecord rec : records){
%>
<tr>
    <td><%= rec.getId() %></td>
    <td><%= rec.getCustomerName() %></td>
    <td><%= rec.getProduct() %></td>
    <td><%= rec.getQuantity() %></td>
    <td><%= rec.getPrice() %></td>
    <td><%= rec.getCategory() %></td>
    <td><%= rec.getSaleDate() %></td>
    <td>
        <a href="editSales.jsp?id=<%= rec.getId() %>"><button>Edit</button></a>
        <a href="delete.jsp?id=<%= rec.getId() %>" onclick="return confirm('Are you sure you want to delete this record?');"><button>Delete</button></a>
    </td>
</tr>
<%
}
%>
</table>
<div class="center-link">
    <a href="index.jsp" class="home-btn">Back to Home</a>
</div>
</body>
</html>
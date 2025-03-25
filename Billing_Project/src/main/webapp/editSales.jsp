<%@page import="com.salesinvoice.SalesDAO" %>
<%@page import="com.salesinvoice.SalesRecord" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
SalesRecord rec = SalesDAO.getRecordById(id);
%>
<html>
<head>
    <title>Edit Sales Record</title>
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #f0f4f8, #d9e4f5);
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        min-height: 100vh;
        color: #333;
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
        animation: slideDown 1s ease;
    }

    @keyframes slideDown {
        from { transform: translateY(-40px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    form {
        width: 420px;
        background: linear-gradient(145deg, #ffffff, #e4ecf4);
        padding: 30px;
        border-radius: 22px;
        box-shadow: 0 10px 40px rgba(0,0,0,0.1);
        transition: transform 0.4s, box-shadow 0.4s;
        margin-bottom: 30px;
    }

    form:hover {
        transform: scale(1.02);
        box-shadow: 0 20px 50px rgba(0,0,0,0.15);
    }

    form input[type="text"],
    form input[type="number"],
    form input[type="date"],
    form input[type="submit"] {
        width: 100%;
        padding: 12px;
        margin: 12px 0;
        border: 1px solid #ccc;
        border-radius: 10px;
        font-size: 16px;
        text-align: center;
        transition: all 0.3s ease;
    }

    form input[type="text"]:focus,
    form input[type="number"]:focus,
    form input[type="date"]:focus {
        border-color: #00c6ff;
        box-shadow: 0 0 12px rgba(0, 198, 255, 0.4);
        outline: none;
        transform: scale(1.02);
    }

    form input[type="submit"] {
        background: linear-gradient(90deg, #007bff, #00c6ff);
        color: white;
        border: none;
        cursor: pointer;
        font-weight: 600;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    form input[type="submit"]:hover {
        transform: scale(1.05);
        box-shadow: 0 10px 30px rgba(0, 123, 255, 0.4);
    }

    .center-link {
        margin-top: 20px;
        animation: bounceIn 1s ease;
    }

    @keyframes bounceIn {
        0% { transform: scale(0.5); opacity: 0; }
        60% { transform: scale(1.1); opacity: 1; }
        80% { transform: scale(0.95); }
        100% { transform: scale(1); }
    }
    
    .center-link {
    margin-top: 20px;
    animation: bounceIn 1s ease;
}

    .center-link a {
        padding: 10px 25px;
        background-color: #007bff;
        color: white;
        border-radius: 12px;
        display: inline-block;
        text-decoration: none;
        font-weight: 600;
        transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
        box-shadow: 0 8px 20px rgba(0, 123, 255, 0.3);
        font-size: 15px;
    }

    .center-link a:hover {
        background-color: #0056b3;
        transform: scale(1.08);
        box-shadow: 0 12px 35px rgba(0, 86, 179, 0.4);
    }
</style>

</head>
<body>
<h2>Edit Sale Record</h2>
<form action="updateSales.jsp" method="post">
    <input type="hidden" name="id" value="<%= rec.getId() %>" />
    Customer Name: <input type="text" name="customerName" value="<%= rec.getCustomerName() %>" required /><br/>
    Product: <input type="text" name="product" value="<%= rec.getProduct() %>" required /><br/>
    Quantity: <input type="number" name="quantity" value="<%= rec.getQuantity() %>" min="1" required /><br/>
    Price: <input type="number" step="0.01" name="price" value="<%= rec.getPrice() %>" required /><br/>
    Category: <input type="text" name="category" value="<%= rec.getCategory() %>" required /><br/>
    Sale Date: <input type="date" name="saleDate" value="<%= rec.getSaleDate() %>" required /><br/>
    <input type="submit" value="Update" />
</form>
<div class="center-link">
    <a href="viewSales.jsp">Back to List</a>
</div>

</body>
</html>
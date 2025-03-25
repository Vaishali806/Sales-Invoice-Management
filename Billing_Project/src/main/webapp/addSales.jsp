<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Sales</title>
   <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f0f4f8, #d9e4f5);
            margin: 0;
            padding: 0;
            color: #333;
            animation: fadeInBody 1.2s ease-in-out;
           
        }

        @keyframes fadeInBody {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        h2 {
            margin-top: 40px;
            font-size: 32px;
            background: linear-gradient(90deg, #007bff, #00c6ff);
            background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: slideDown 1s ease-in-out;
        }

        @keyframes slideDown {
            from { transform: translateY(-40px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        form {
            width: 420px;
            margin: 50px auto;
            background: linear-gradient(145deg, #ffffff, #e4ecf4);
            padding: 35px;
            border-radius: 22px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            transition: transform 0.4s, box-shadow 0.4s;
        }

        form:hover {
            transform: scale(1.02);
            box-shadow: 0 20px 50px rgba(0,0,0,0.15);
        }

        form input[type="text"],
        form input[type="number"],
        form input[type="date"] {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 16px;
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
            padding: 14px;
            border-radius: 10px;
            font-size: 18px;
            width: 100%;
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative;
            overflow: hidden;
        }

        form input[type="submit"]::after {
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.4);
            transform: translate(-50%, -50%);
            border-radius: 50%;
            transition: width 0.5s ease, height 0.5s ease;
        }

        form input[type="submit"]:hover::after {
            width: 250%;
            height: 250%;
        }

        form input[type="submit"]:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 30px rgba(0, 123, 255, 0.4);
        }

        a {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 6px 20px rgba(0, 123, 255, 0.3);
            
        }

        a:hover {
            background-color: #0056b3;
            transform: scale(1.08);
            box-shadow: 0 10px 30px rgba(0, 86, 179, 0.4);
        }

    </style>
</head>
<body>
<h2 style="text-align: center;"> Add New Sales Record  </h2>
<form method="post" action="AddSalesServlet">
    Customer: <input type="text" name="customer" required><br>
    Product: <input type="text" name="product" required><br>
    Quantity: <input type="number" name="quantity" min="1" required><br>
    Price: <input type="number" step="0.01" name="price" required><br>
    Category: <input type="text" name="category" required><br>
    Date: <input type="date" name="date" required><br>
    <input type="submit" name="submit" value="Add Record">
</form>
<div style="text-align: center; margin-top: 10px;">
    <a href="index.jsp">Back to Home</a>
</div>
</body>
</html>

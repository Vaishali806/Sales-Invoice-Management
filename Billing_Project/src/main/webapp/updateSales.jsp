<%@ page import="com.salesinvoice.SalesDAO, com.salesinvoice.SalesRecord" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String customerName = request.getParameter("customer_name");
    String product = request.getParameter("product");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    double price = Double.parseDouble(request.getParameter("price"));
    String category = request.getParameter("category");
    String saleDate = request.getParameter("sale_date");

    SalesRecord rec = new SalesRecord();
    rec.setId(id);
    rec.setCustomerName(customerName);
    rec.setProduct(product);
    rec.setQuantity(quantity);
    rec.setPrice(price);
    rec.setCategory(category);
    rec.setSaleDate(saleDate);

    SalesDAO.updateRecord(rec);
    response.sendRedirect("viewSales.jsp");  // redirect back to view page
%>

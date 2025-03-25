<%@ page import="com.salesinvoice.SalesDAO" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String idParam = request.getParameter("id");
    if (idParam != null && !idParam.isEmpty()) {
        int id = Integer.parseInt(idParam);
        try {
            SalesDAO.deleteRecord(id);
            // Redirect to view all records page after deletion
            response.sendRedirect("viewSales.jsp");
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error while deleting record: " + e.getMessage() + "</h3>");
        }
    } else {
        out.println("<h3 style='color:red;'>Invalid Record ID!</h3>");
    }
%>

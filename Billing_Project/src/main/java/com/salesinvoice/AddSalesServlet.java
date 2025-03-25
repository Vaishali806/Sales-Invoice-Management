package com.salesinvoice;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class AddSalesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SalesRecord rec = new SalesRecord();
        rec.setCustomerName(request.getParameter("customer"));
        rec.setProduct(request.getParameter("product"));
        rec.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        rec.setPrice(Double.parseDouble(request.getParameter("price")));
        rec.setCategory(request.getParameter("category"));
        rec.setSaleDate(request.getParameter("date"));

        SalesDAO.addRecord(rec);

        response.sendRedirect("viewSales.jsp");
    }
}

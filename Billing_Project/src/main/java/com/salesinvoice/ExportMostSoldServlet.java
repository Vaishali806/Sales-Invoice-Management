package com.salesinvoice;

import java.io.*;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

//Jar files are not extract properly (Error occur)
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet("/ExportMostSoldServlet")
public class ExportMostSoldServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String category = request.getParameter("category");
        String search = request.getParameter("search");

        if (type == null || type.isEmpty()) {
            response.getWriter().println("Error: Export type not specified.");
            return;
        }


        List<MostSoldProduct> products = SalesDAO.getMostSoldProducts(category, search);

        switch (type.toLowerCase()) {
            case "csv":
                exportCSV(response, products);
                break;
            case "excel":
                exportExcel(response, products);
                break;
            case "pdf":
                exportPDF(response, products);
                break;
            default:
                response.getWriter().println("Invalid export type.");
        }
    }

    private void exportCSV(HttpServletResponse response, List<MostSoldProduct> products) throws IOException {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=most_sold_products.csv");
        PrintWriter writer = response.getWriter();
        writer.println("Product,Total Sold");
        for (MostSoldProduct p : products) {
            writer.println(p.getProduct() + "," + p.getQuantity());
        }
        writer.flush();
        writer.close();
    }

    private void exportExcel(HttpServletResponse response, List<MostSoldProduct> products) throws IOException {
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=most_sold_products.xlsx");

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Most Sold Products");

        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Product");
        header.createCell(1).setCellValue("Total Sold");

        int rowCount = 1;
        for (MostSoldProduct p : products) {
            Row row = sheet.createRow(rowCount++);
            row.createCell(0).setCellValue(p.getProduct());
            row.createCell(1).setCellValue(p.getQuantity());
        }

        workbook.write(response.getOutputStream());
        workbook.close();
    }

    private void exportPDF(HttpServletResponse response, List<MostSoldProduct> products) throws IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=most_sold_products.pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            document.add(new Paragraph("Most Sold Products Report"));
            document.add(new Paragraph(" "));
            PdfPTable table = new PdfPTable(2);
            table.addCell("Product");
            table.addCell("Total Sold");
            for (MostSoldProduct p : products) {
                table.addCell(p.getProduct());
                table.addCell(String.valueOf(p.getQuantity()));
            }
            document.add(table);
            document.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }
}

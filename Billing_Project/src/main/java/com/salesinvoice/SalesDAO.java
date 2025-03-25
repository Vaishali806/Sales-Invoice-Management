package com.salesinvoice;

import java.sql.*;
import java.util.*;

public class SalesDAO {
	public static void addRecord(SalesRecord rec) {
        try (Connection con = DBConnection.getConnection()) {
            String query = "INSERT INTO sales_records (customer_name, product, quantity, price, category, sale_date) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, rec.getCustomerName());
            pst.setString(2, rec.getProduct());
            pst.setInt(3, rec.getQuantity());
            pst.setDouble(4, rec.getPrice());
            pst.setString(5, rec.getCategory());
            pst.setString(6, rec.getSaleDate());

            int rows = pst.executeUpdate();
            if (rows > 0) {
                System.out.println("✔ Data inserted successfully!");
            } else {
                System.out.println("⚠ Data insertion failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("SQL insert error: " + e.getMessage());
        }
    }

    public static List<SalesRecord> getAllRecords() {
        List<SalesRecord> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); Statement st = con.createStatement()) {
            ResultSet rs = st.executeQuery("SELECT * FROM sales_records");
            while (rs.next()) {
                SalesRecord rec = new SalesRecord();
                rec.setId(rs.getInt("id"));
                rec.setCustomerName(rs.getString("customer_name"));
                rec.setProduct(rs.getString("product"));
                rec.setQuantity(rs.getInt("quantity"));
                rec.setPrice(rs.getDouble("price"));
                rec.setCategory(rs.getString("category"));
                rec.setSaleDate(rs.getString("sale_date"));
                list.add(rec);
            }
        } catch(Exception e) { e.printStackTrace(); }
        return list;
    }

    public static SalesRecord getRecordById(int id) {
        SalesRecord record = null;
        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT * FROM sales_records WHERE id = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                record = new SalesRecord();
                record.setId(rs.getInt("id"));
                record.setCustomerName(rs.getString("customer_name"));
                record.setProduct(rs.getString("product"));
                record.setQuantity(rs.getInt("quantity"));
                record.setPrice(rs.getDouble("price"));
                record.setCategory(rs.getString("category"));
                record.setSaleDate(rs.getString("sale_date"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return record;
    }

    public static void updateRecord(SalesRecord rec) {
        try (Connection con = DBConnection.getConnection()) {
            SalesRecord existing = getRecordById(rec.getId());

            if (existing != null) {
                String customerName = (rec.getCustomerName() == null || rec.getCustomerName().trim().isEmpty()) 
                                        ? existing.getCustomerName() : rec.getCustomerName();

                String product = (rec.getProduct() == null || rec.getProduct().trim().isEmpty()) 
                                        ? existing.getProduct() : rec.getProduct();

                int quantity = (rec.getQuantity() == 0) 
                                        ? existing.getQuantity() : rec.getQuantity();

                double price = (rec.getPrice() == 0.0) 
                                        ? existing.getPrice() : rec.getPrice();

                String category = (rec.getCategory() == null || rec.getCategory().trim().isEmpty()) 
                                        ? existing.getCategory() : rec.getCategory();

                String saleDate = (rec.getSaleDate() == null || rec.getSaleDate().trim().isEmpty()) 
                                        ? existing.getSaleDate() : rec.getSaleDate();

                String query = "UPDATE sales_records SET customer_name=?, product=?, quantity=?, price=?, category=?, sale_date=? WHERE id=?";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, customerName);
                pst.setString(2, product);
                pst.setInt(3, quantity);
                pst.setDouble(4, price);
                pst.setString(5, category);
                pst.setString(6, saleDate);
                pst.setInt(7, rec.getId());
                pst.executeUpdate();

                System.out.println("✔ Record updated successfully.");
            } else {
                System.out.println("⚠ Record with given ID not found.");
            }
        } catch(Exception e) { 
            e.printStackTrace(); 
        }
    }

    public static void deleteRecord(int id) {
        try (Connection con = DBConnection.getConnection()) {
            String query = "DELETE FROM sales_records WHERE id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch(Exception e) { e.printStackTrace(); }
    }

    public static List<MostSoldProduct> getMostSoldProducts() {
        List<MostSoldProduct> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); Statement st = con.createStatement()) {
            String query = "SELECT product, SUM(quantity) AS total_sold FROM sales_records GROUP BY product ORDER BY total_sold DESC LIMIT 5";
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                MostSoldProduct product = new MostSoldProduct();
                product.setProduct(rs.getString("product"));
                product.setQuantity(rs.getInt("total_sold"));
                list.add(product);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    

    public static List<SalesRecord> searchRecords(String keyword, String category) {
        List<SalesRecord> list = new ArrayList<>();
        String query = "SELECT * FROM sales_records WHERE (customer_name LIKE ? OR product LIKE ?)";
        if (category != null && !category.isEmpty() && !"All".equals(category)) {
            query += " AND category = '" + category + "'";
        }
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, "%" + keyword + "%");
            pst.setString(2, "%" + keyword + "%");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                SalesRecord rec = new SalesRecord();
                rec.setId(rs.getInt("id"));
                rec.setCustomerName(rs.getString("customer_name"));
                rec.setProduct(rs.getString("product"));
                rec.setQuantity(rs.getInt("quantity"));
                rec.setPrice(rs.getDouble("price"));
                rec.setCategory(rs.getString("category"));
                rec.setSaleDate(rs.getString("sale_date"));
                list.add(rec);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public static List<MostSoldProduct> getMostSoldProducts(String search, String category) {
        List<MostSoldProduct> list = new ArrayList<>();
        String query = "SELECT product, SUM(quantity) AS total_sold FROM sales_records WHERE 1=1";
        
        // Apply category filter if provided
        if (category != null && !category.isEmpty()) {
            query += " AND category = ?";
        }

        // Apply search filter if provided
        if (search != null && !search.isEmpty()) {
            query += " AND product LIKE ?";
        }

        query += " GROUP BY product ORDER BY total_sold DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {

            int parameterIndex = 1;

            // Set category parameter if provided
            if (category != null && !category.isEmpty()) {
                pst.setString(parameterIndex++, category);
            }

            // Set search parameter if provided
            if (search != null && !search.isEmpty()) {
                pst.setString(parameterIndex++, "%" + search + "%");
            }

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                MostSoldProduct product = new MostSoldProduct();
                product.setProduct(rs.getString("product"));
                product.setQuantity(rs.getInt("total_sold"));
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }



	
}

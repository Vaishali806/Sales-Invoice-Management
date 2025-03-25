package com.salesinvoice;

public class MostSoldProduct {
    private String product;
    private int quantity;

    // Default constructor
    public MostSoldProduct() {}

    // Parameterized constructor
    public MostSoldProduct(String product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    // Getter and Setter for product
    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    // Getter and Setter for quantity
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
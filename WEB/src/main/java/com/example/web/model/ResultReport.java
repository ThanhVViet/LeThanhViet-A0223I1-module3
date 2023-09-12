package com.example.web.model;

public class ResultReport {
    String orderId;
    String orderDate;
    String accountName;
    String productName;
    String quantity;
    String priceEach;
    float totalRevenue;

    public float getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(float totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public ResultReport(String orderId, String orderDate, String accountName) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.accountName = accountName;
    }

    public ResultReport(String orderId, String orderDate, float totalRevenue){
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.totalRevenue = totalRevenue;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getPriceEach() {
        return priceEach;
    }

    public void setPriceEach(String priceEach) {
        this.priceEach = priceEach;
    }

    public ResultReport(String orderId, String orderDate, String accountName, String productName, String quantity, String priceEach) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.accountName = accountName;
        this.productName = productName;
        this.quantity = quantity;
        this.priceEach = priceEach;
    }

    @Override
    public String toString() {
        return "ResultReport{" +
                "orderId='" + orderId + '\'' +
                ", orderDate='" + orderDate + '\'' +
                ", accountName='" + accountName + '\'' +
                ", productName='" + productName + '\'' +
                ", quantity='" + quantity + '\'' +
                ", priceEach='" + priceEach + '\'' +
                '}';
    }
}

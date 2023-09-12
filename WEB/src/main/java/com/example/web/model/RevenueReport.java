package com.example.web.model;

public class RevenueReport {
    String orderId;
    String orderDate;
    float totalRevenue;

    public float getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(float totalRevenue) {
        this.totalRevenue = totalRevenue;
    }


    public RevenueReport(String orderId, String orderDate, float totalRevenue){
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

}

package com.example.web.service;



import com.example.web.model.DBConnect;
import com.example.web.model.ResultReport;
import com.example.web.model.RevenueReport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Report {

    public List<ResultReport> getOrdersDetailByName(String name, String startTime, String endTime) throws SQLException {
        Connection connection = DBConnect.getConnection();
        List<ResultReport> listResult = new ArrayList<>();
        PreparedStatement ps = connection.prepareStatement("call reportByNameAndTime(?,?,?)");
        ps.setString(1, name);
        ps.setString(2, startTime);
        ps.setString(3, endTime);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String orderId = rs.getString("OrderId");
            String orderDate = rs.getString("orderDate");
            String accountName = rs.getString("AccountName");
            String productName = rs.getString("ProductName");
            String quantity = rs.getString("Quantity");
            String priceEach = rs.getString("PriceEach");
            listResult.add(new ResultReport(orderId, orderDate,accountName,productName,quantity,priceEach));
        }
        return listResult;
    }

    public List<ResultReport> getOrdersDetailByStatus(boolean status) throws SQLException {
        Connection connection = DBConnect.getConnection();
        PreparedStatement ps = connection.prepareStatement("call reportByOrderStatus(?)");
        ps.setBoolean(1,status);
        List<ResultReport> listResult = new ArrayList<>();
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String orderId = rs.getString("OrderId");
            String orderDate = rs.getString("orderDate");
            String accountName = rs.getString("AccountName");
            listResult.add(new ResultReport(orderId, orderDate,accountName));
        }
        return listResult;
    }

    public List<RevenueReport> getTotalRevenue(String startTime, String endTime) throws SQLException {
        Connection connection = DBConnect.getConnection();
        List<RevenueReport> listResult = new ArrayList<>();
        PreparedStatement ps = connection.prepareStatement("call reportRevenue(?,?)");
        ps.setString(1, startTime);
        ps.setString(2, endTime);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String orderId = rs.getString("OrderID");
            String orderDate = rs.getString("orderDate");
            Float totalRevenue = rs.getFloat("total");
            listResult.add(new RevenueReport(orderId, orderDate,totalRevenue));
        }
        return listResult;
    }
    public static void main(String[] args) throws SQLException {

        Report rp = new Report();
        List<RevenueReport> list = new ArrayList<>();
        list = rp.getTotalRevenue("2020-03-01","2020-03-30");
        System.out.println(list);
    }
}

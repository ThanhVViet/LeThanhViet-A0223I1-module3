package com.example.web.service;


import com.example.web.model.Order;

import java.util.List;

public interface OrderService {
    List<Order> getRecentOrderList();
    String getMaxOrderIdByOrderIdHead(String orderIdHead);
    void addOrderFromCart(Order order);
    void addOrderProductFromCart(String orderId, String productId, int quantity, float priceEach, String accountId);
    void updateQuantityProduct(int quantity, String productId);

    List<Order> viewAllOrder();

    void updateOder(String orderID, String accountID, String orderDate, String receiver, String address, String email, String phoneNumber, int status);

    void deleteOder(String orderID);

    void deleteOder_product(String orderID);

    Order findByID(String orderIDToFind);
}

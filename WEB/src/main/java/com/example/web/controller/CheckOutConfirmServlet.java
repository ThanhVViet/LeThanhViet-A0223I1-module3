package com.example.web.controller;

import com.example.web.model.Item;
import com.example.web.model.Order;
import com.example.web.service.OrderServiceImp;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CheckOutConfirmServlet", urlPatterns = "/checkoutconfirm")
public class CheckOutConfirmServlet extends HttpServlet {
    OrderServiceImp orderServiceImp = new OrderServiceImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        String accountId = request.getParameter("accountId");
        String receiver = request.getParameter("receiver");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String email = request.getParameter("email");

        HttpSession session = request.getSession();
        Order orderSession = (Order) session.getAttribute("order");
        List<Item> list = orderSession.getItems();

        Order order = new Order(orderId, accountId, receiver, address, email,phoneNumber);
        orderServiceImp.addOrderFromCart(order);
        for (int i = 0; i < list.size(); i++) {
            String productId = list.get(i).getProduct().getProductId();
            String quantity = String.valueOf(list.get(i).getQuantity());
            String priceEach = String.valueOf(list.get(i).getPrice());
            orderServiceImp.addOrderProductFromCart(orderId,productId,Integer.parseInt(quantity),Float.parseFloat(priceEach),accountId);
        }

        List<Integer> orderQuantities = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            orderQuantities.add(list.get(i).getQuantity());
        }

        List<Integer> quantityInStock = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            quantityInStock.add(list.get(i).getProduct().getQuantityInStock());
        }

        for (int i = 0; i < quantityInStock.size(); i++) {
            quantityInStock.set(i,(quantityInStock.get(i)-orderQuantities.get(i)));
        }

        for (int i = 0; i < quantityInStock.size(); i++) {
            orderServiceImp.updateQuantityProduct(quantityInStock.get(i),list.get(i).getProduct().getProductId());
        }


        String announcementOrderSuccessful = "Order Completed ! Please wait Admin to Confirm";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
        request.setAttribute("announcementOrderSuccessful",announcementOrderSuccessful);
        requestDispatcher.forward(request,response);
        session.removeAttribute("order");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

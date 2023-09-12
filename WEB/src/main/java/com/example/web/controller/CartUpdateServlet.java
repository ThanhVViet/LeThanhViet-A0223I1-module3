package com.example.web.controller;

import com.example.web.model.Item;
import com.example.web.model.Order;
import com.example.web.service.ProductServiceImp;
import jakarta.servlet.http.HttpSession;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartUpdateServlet", urlPatterns = "/cartUpdateServlet")
public class CartUpdateServlet extends HttpServlet {
    ProductServiceImp productServiceImp = new ProductServiceImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null)
            action = "";

        switch (action) {
            case "Update": {
                updateCart(request, response);
                break;
            }
        }
    }

    private void updateCart(HttpServletRequest request, HttpServletResponse response) {
        String[] quantity = request.getParameterValues("quantity");
        boolean checkMinutes = true;
        for (int i = 0; i < quantity.length; i++) {
            if (Integer.parseInt(quantity[i]) < 0) {
                checkMinutes = false;
            }
        }
        if (!checkMinutes) {
            String announcement = "Can not input minutes number, Please try again!";
            request.setAttribute("announcement", announcement);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {

            HttpSession session = request.getSession();
            Order order = (Order) session.getAttribute("order");
            List<Item> list = order.getItems();

            for (int i = 0; i < list.size(); i++) {
                list.get(i).setQuantity(Integer.parseInt(quantity[i]));
            }

            session.removeAttribute("order");
            session.setAttribute("order", order);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null)
            action = "";

        switch (action) {
            case "Delete": {
                deleteProduct(request, response);
                break;
            }
        }
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        String productId = request.getParameter("productId");

        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("order");
        List<Item> list = order.getItems();

        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getProduct().getProductId().equals(productId)){
                list.remove(i);
            }
        }

        session.removeAttribute("order");
        session.setAttribute("order", order);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}

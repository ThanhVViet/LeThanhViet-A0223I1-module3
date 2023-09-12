package com.example.web.controller;



import com.example.web.model.Item;
import com.example.web.model.Order;
import com.example.web.model.Product;
import com.example.web.service.ProductService;
import com.example.web.service.ProductServiceImp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddtoCartServlet", urlPatterns = "/addToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private ProductService productService;

    public void init() throws ServletException {
        productService = new ProductServiceImp();
        super.init();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        super.doPost(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


                int quantity = 1;
        String id;
        if (request.getParameter("productId") != null) {
            id = request.getParameter("productId");
            try {
                Product product = productService.getProduct(id);
                if (product != null) {
                    if (request.getParameter("quantity") != null ){
                        quantity = Integer.parseInt(request.getParameter("quantity"));
                    }
                    HttpSession session =request.getSession();
                    if (session.getAttribute("order") == null) {
                        Order order = new Order();
                        List<Item> listItems = new ArrayList<>();
                        Item item = new Item();
                        item.setQuantity(quantity);
                        item.setProduct(product);
                        item.setPrice(product.getProductPrice());
                        listItems.add(item);
                        order.setItems(listItems);
                        session.setAttribute("order", order);
                    } else {
                        Order order = (Order) session.getAttribute("order");
                        List<Item> listItems = order.getItems();
                        boolean check = false;
                        for (Item item: listItems) {
                            if (item.getProduct().getProductId().equals(product.getProductId())) {
                                item.setQuantity(item.getQuantity() + quantity);
                                check = true;
                            }
                        }
                        if (!check) {
                            Item item = new Item();
                            item.setQuantity(quantity);
                            item.setProduct(product);
                            item.setPrice(product.getProductPrice());
                            listItems.add(item);
                        }
                        session.setAttribute("order", order);
                    }
                    response.sendRedirect(request.getContextPath()+"/pagination");
                }else {
                    response.sendRedirect(request.getContextPath()+"/pagination");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

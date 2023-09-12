package com.example.web.controller;

import com.example.web.model.Product;
import com.example.web.service.ProductServiceImp;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SearchProductServlet", urlPatterns = "/search")
public class SearchProductServlet extends HttpServlet {
    ProductServiceImp productServiceImp = new ProductServiceImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
        String name = request.getParameter("searchName");
        if (name.equals("")) {
            String announcement = "Please input content";
            request.setAttribute("announcement", announcement);
            dispatcher.forward(request, response);
        } else {
            List<Product> productList = null;
            try {
                productList = this.productServiceImp.searchProduct(name);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            request.setAttribute("listProduct", productList);
            dispatcher.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

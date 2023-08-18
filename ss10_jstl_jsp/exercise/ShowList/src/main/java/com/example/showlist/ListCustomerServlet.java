package com.example.showlist;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListCustomerServlet", value = "/customers")
public class ListCustomerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customers = new ArrayList<>();
        customers.add(new Customer("Viet", "02/03/2003", "Đỗ Thúc Tịnh", "/image/badboynetwork3.webp"));
        customers.add(new Customer("Viet", "02/03/2003", "Đỗ Thúc Tịnh", "/image/badboynetwork3.webp"));
        customers.add(new Customer("Viet", "02/03/2003", "Đỗ Thúc Tịnh", "/image/badboynetwork3.webp"));
        customers.add(new Customer("Viet", "02/03/2003", "Đỗ Thúc Tịnh", "/image/badboynetwork3.webp"));
        customers.add(new Customer("Viet", "02/03/2003", "Đỗ Thúc Tịnh", "/image/badboynetwork3.webp"));
        req.setAttribute("customers", customers);
        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }
}

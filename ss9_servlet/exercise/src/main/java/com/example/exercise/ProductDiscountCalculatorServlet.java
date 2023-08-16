package com.example.exercise;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProductDiscountCalculatorServlet", value = "/display-discount")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("productName");
        double listPrice = Double.parseDouble(req.getParameter("listPrice"));
        double discountPercent = Double.parseDouble(req.getParameter("discountPercent"));

        double result =  listPrice  * discountPercent * 0.01;

        double discountPrice = result * listPrice;

        PrintWriter printWriter = resp.getWriter();
        printWriter.println("<html>");

        printWriter.println("<h1>Product Name: " + productName + "</h1>");
        printWriter.println("<h1>Discount Amount: " + result + "</h1>");
        printWriter.println("<h1>Discount Price: " + discountPrice + "</h1>");

        printWriter.println("</html>");


    }
}

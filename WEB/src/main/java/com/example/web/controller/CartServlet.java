package com.example.web.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CartServlet", urlPatterns = "/cartServlet")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String productId = request.getParameter("productId");
        String act = "Update";
        int newQuantity = 0;

        switch (action) {
            case "plus": {
                newQuantity = quantity + 1;
                break;
            }
            case "minutes": {
                newQuantity = quantity - 1;
                break;
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cartUpdateServlet");
        request.setAttribute("quantity", newQuantity);
        request.setAttribute("productId", productId);
        request.setAttribute("act", act);
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String productId = request.getParameter("productId");
        String act = "Update";
        int newQuantity = 0;

        switch (action) {
            case "plus": {
                newQuantity = quantity + 1;
                break;
            }
            case "minutes": {
                newQuantity = quantity - 1;
                break;
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cartUpdateServlet");
        request.setAttribute("quantity", newQuantity);
        request.setAttribute("productId", productId);
        request.setAttribute("act", act);
        dispatcher.forward(request, response);
    }
}

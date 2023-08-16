package com.example.demo;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/kiet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/hello-servlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double number1 = Double.parseDouble(request.getParameter("num1"));
        double number2 = Double.parseDouble(request.getParameter("num2"));
        double result = number1 + number2;
        request.setAttribute("khue",result);
        RequestDispatcher requestDispatcher =
                request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request,response);


    }

}

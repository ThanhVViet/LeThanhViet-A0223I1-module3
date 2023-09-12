package com.example.web.controller;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MainAdminNavigateServlet",urlPatterns = "/mainAdminNavigateServlet")
public class MainAdminNavigateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String target= req.getParameter("target");
        RequestDispatcher requestDispatcher;
        if (target==null){
            target = "";
        }
        switch (target){
            case "productManagement":
                requestDispatcher = req.getRequestDispatcher("admin/productManagement.jsp");
                requestDispatcher.forward(req,resp);
                break;
            case "categoryManagement":
                requestDispatcher = req.getRequestDispatcher("/categoryServlet");
                requestDispatcher.forward(req,resp);
                break;
            case "accountManagement":
                requestDispatcher = req.getRequestDispatcher("/accountServlet");
                requestDispatcher.forward(req,resp);
                break;
            case "orderManagement":
                requestDispatcher = req.getRequestDispatcher("/orderServlet");
                requestDispatcher.forward(req,resp);
                break;
            case "reportByName_TimeServlet":
                requestDispatcher = req.getRequestDispatcher("/reportByName_TimeServlet");
                requestDispatcher.forward(req,resp);
                break;
            case "reportByOrderStatus":
                requestDispatcher = req.getRequestDispatcher("/reportByOrderStatus");
                requestDispatcher.forward(req,resp);
                break;
            case "reportByRevenueServlet":
                requestDispatcher = req.getRequestDispatcher("/reportByRevenueServlet");
                requestDispatcher.forward(req,resp);
                break;
            default:
                requestDispatcher = req.getRequestDispatcher("admin/admin.jsp");
                requestDispatcher.forward(req,resp);
                break;
        }
    }
}

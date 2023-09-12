package com.example.web.controller;

import com.example.web.model.ResultReport;
import com.example.web.service.Report;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ReportByOrderStatus",urlPatterns = "/reportByOrderStatus")
public class ReportByOrderStatus extends HttpServlet {
    Report report = new Report();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/reportByOrderStatus.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Boolean status = Boolean.parseBoolean(req.getParameter("selectStatus"));
        try {
            List<ResultReport> results = report.getOrdersDetailByStatus(status);
            req.setAttribute("results", results);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/resultReportByOrderStatus.jsp");
        requestDispatcher.forward(req,resp);
    }
}

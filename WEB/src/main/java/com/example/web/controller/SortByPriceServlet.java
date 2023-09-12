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

@WebServlet(name = "SortByPriceServlet",urlPatterns = "/sort")
public class SortByPriceServlet extends HttpServlet {
    ProductServiceImp productServiceImp = new ProductServiceImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sort = request.getParameter("sortByPrice");
        String categoryId = request.getParameter("categoryId");
        List<Product> productList=null;
        switch (sort){
            case "desc":
                try {
                    productList = this.productServiceImp.sortListProductDesc(categoryId);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "asc":
                try {
                    productList = this.productServiceImp.sortListProductAsc(categoryId);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
        }
        request.setAttribute("productList",productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("showSortResult.jsp");
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String sort = request.getParameter("sortByPrice");
//        List<Product> productList=null;
//        if (sort==null){
//            sort="";
//            switch (sort){
//                default:
//                    listProduct(request,response);
//                    break;
//            }
//        }
//    }
//
//    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
//        String sort = request.getParameter("sortByPrice");
//        List<Product> productList=null;
//        try {
//            productList = this.productServiceImp.getListProduct();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        request.setAttribute("productList",productList);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("showSortResult.jsp");
//        try {
//            dispatcher.forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }
}

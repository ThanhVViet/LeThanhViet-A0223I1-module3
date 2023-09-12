package com.example.web.controller;

import com.example.web.model.Product;
import com.example.web.service.ProductService;
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

@WebServlet(name="productServlet", urlPatterns = "/productServlet")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImp();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action ==null){
            action = "";
        }
        switch (action){
            case "add":
                addProduct(req,resp);
                break;
            case "update":
                updateProduct(req,resp);
                break;
            default:
                listProducts(req,resp);
                break;
        }
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) {
        String pmID = req.getParameter("pmID");
        String pmCategoryID = req.getParameter("pmCategoryID");
        String pmName = req.getParameter("pmName");
        String pmPrice = req.getParameter("pmPrice");
        String pmQuantity = req.getParameter("pmQuantity");
        String pmStatus = req.getParameter("pmStatus");
        String pmDes = req.getParameter("pmDes");
        String pmImg = req.getParameter("pmImg");

        Product product = new Product(pmID,pmCategoryID,pmName, Float.parseFloat(pmPrice), Integer.parseInt(pmQuantity),pmImg,Integer.parseInt(pmStatus), pmDes);
        try {
            productService.updateProduct(product);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            resp.sendRedirect("/mainAdminNavigateServlet?target=productManagement");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productID = req.getParameter("productId");
        String productName = req.getParameter("productName");
        float productPrice = Float.parseFloat(req.getParameter("productPrice"));
        int quantityInStock = Integer.parseInt(req.getParameter("quantityInStock"));
        int status = Integer.parseInt(req.getParameter("status"));
        String description = req.getParameter("description");
        String img = req.getParameter("img");
        String categoryName = req.getParameter("categoryName");

        Product product = new Product(productID,productName,productPrice,quantityInStock,img,status,description,categoryName);
        try {
            this.productService.saveProduct(product);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("addProduct.jsp");
        req.setAttribute("message","New product is added!");
        requestDispatcher.forward(req,resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action ==null){
            action = "";
        }
        switch (action){
            case "update":{
                showUpdateForm(req,resp);
                break;
            }
            default:
                listProducts(req,resp);
                break;
        }
    }

    private void showUpdateForm(HttpServletRequest req, HttpServletResponse resp) {
        String productId = req.getParameter("productId");
        Product product = new Product();
        System.out.println("ok");
        try {
            product = productService.getProduct(productId);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/updateProduct.jsp");
        req.setAttribute("productId", productId);
        req.setAttribute("product", product);
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listProducts(HttpServletRequest req, HttpServletResponse resp) {
        List<Product> productList = null;
        try {
            productList = this.productService.getListProduct();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        req.setAttribute("productList",productList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/productManagement.jsp");
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

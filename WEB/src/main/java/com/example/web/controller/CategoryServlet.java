package com.example.web.controller;

import com.example.web.model.Category;
import com.example.web.model.Product;
import com.example.web.service.CategoryServiceImp;
import com.example.web.service.ProductServiceImp;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryServlet", urlPatterns = "/categoryServlet")
public class CategoryServlet extends HttpServlet {
    CategoryServiceImp categoryServiceImp = new CategoryServiceImp();
    List<Category> categoryList;
    ProductServiceImp productServiceImp = new ProductServiceImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                updateCategoryForm(req, resp);
                break;
            case "add":
                addCategoryForm(req, resp);
                break;
            case "delete":
                deleteCategory(req, resp);
            default:
                viewAllCategory(req, resp);
        }
    }

    private void deleteCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryId = req.getParameter("categoryId");
        List<Product> productList = new ArrayList<>();
        try {
            productList = productServiceImp.getListProduct(categoryId);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        if (productList.size() == 0) {
            categoryServiceImp.deleteCategory(categoryId);

        } else {
            String announcement = "Product(s) belong to this Category is(are) existing. Can not delete!";
            req.setAttribute("announcement",announcement);
        }
        try {
            categoryList = categoryServiceImp.getListCategory();
            req.setAttribute("categories", categoryList);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/viewCategory.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void addCategoryForm(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/addCategory.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addCategory(HttpServletRequest req, HttpServletResponse resp) {
        String categoryId = req.getParameter("categoryId");
        String categoryName = req.getParameter("categoryName");
        Category holder = new Category(categoryId, categoryName);
        categoryServiceImp.addCategory(holder);

        try {
            categoryList = categoryServiceImp.getListCategory();
            req.setAttribute("categories", categoryList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/viewCategory.jsp");
            requestDispatcher.forward(req, resp);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void updateCategoryForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryId = req.getParameter("categoryId");
        Category category = new Category();
        try {
            category = categoryServiceImp.getCategory(categoryId);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        req.setAttribute("category", category);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/updateCategory.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void viewAllCategory(HttpServletRequest req, HttpServletResponse resp) {
        try {
            categoryList = categoryServiceImp.getListCategory();
            req.setAttribute("categories", categoryList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/viewCategory.jsp");
            try {
                requestDispatcher.forward(req, resp);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                updateCategory(req, resp);
                break;
            case "add":
                addCategory(req, resp);
                break;
            default:
                viewAllCategory(req, resp);
        }
    }

    private void updateCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryId = req.getParameter("categoryId");
        String categoryName = req.getParameter("categoryName");
        Category holder = new Category(categoryId, categoryName);
        categoryServiceImp.updateCategory(holder);
        try {
            categoryList = categoryServiceImp.getListCategory();
            req.setAttribute("categories", categoryList);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/viewCategory.jsp");
        requestDispatcher.forward(req, resp);
    }

}

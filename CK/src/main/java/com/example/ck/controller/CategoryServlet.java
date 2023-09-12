package com.example.ck.controller;

import com.example.ck.model.Category;
import com.example.ck.service.CategoryService;
import com.example.ck.service.ICategoryService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryServlet", value = "/category")
public class CategoryServlet extends HttpServlet {
    private ICategoryService iCategoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "editForm":
                showEditForm(request, response);
                break;
            case "delete":
                deleteCategory(request, response);
                break;
            default:
                listCategory(request, response);
                break;
        }
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iCategoryService.delete(id);
        response.sendRedirect("/category");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category existingUser = (Category) iCategoryService.select(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cu_category.jsp");
        request.setAttribute("category", existingUser);
        dispatcher.forward(request, response);
    }

    private void listCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> list = iCategoryService.list();
        request.setAttribute("categoryList", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/category_list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "insert":
                insertCategory(request, response);
                break;
            case "update":
                updateCategory(request, response);
                break;
        }
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Category book = new Category(id, name);
        iCategoryService.update(book);
        response.sendRedirect("/category");

    }

    private void insertCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        Category newUser = new Category(name);
        iCategoryService.insert(newUser);
        response.sendRedirect("/servlet");
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cu_category.jsp");
        dispatcher.forward(request, response);
    }
}

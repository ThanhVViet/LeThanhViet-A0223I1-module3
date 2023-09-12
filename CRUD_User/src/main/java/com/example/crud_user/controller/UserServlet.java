package com.example.crud_user.controller;

import com.example.crud_user.model.User;
import com.example.crud_user.service.IUserService;
import com.example.crud_user.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private IUserService iUserService = new UserService();

    public UserServlet() {
        super();
    }

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
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                listUser(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "insert":
                insertUser(request, response);
                break;
            // goi bang the a nen la doget
//                case "delete":
//                    deleteUser(request, response);
//                    break;
            case "search":
                search(request, response);
                break;
            case "search1":
                search1(request, response);
                break;
            case "update":
                updateUser(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }

    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int searchName = Integer.parseInt(request.getParameter("search"));
        List<User> productList;
        productList = iUserService.findUserById(searchName);
        request.setAttribute("userList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user_list.jsp");
        dispatcher.forward(request, response);
    }

    private void search1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchName = request.getParameter("search1");
        List<User> productList;
        productList = iUserService.findUserByName(searchName);
        request.setAttribute("userList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user_list.jsp");
        dispatcher.forward(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = iUserService.selectAll();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/user_list.jsp");
        requestDispatcher.forward(request, response);

    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User book = new User(id, name, email, country);
        iUserService.update(book);
        response.sendRedirect("/user");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = (User) iUserService.select(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iUserService.delete(id);
        response.sendRedirect("/user");
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name, email, country);
        iUserService.insert(newUser);
        response.sendRedirect("/user");
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}

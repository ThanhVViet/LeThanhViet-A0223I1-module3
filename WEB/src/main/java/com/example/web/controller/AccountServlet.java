package com.example.web.controller;


import com.example.web.model.Account;
import com.example.web.service.AccountImp;
import com.example.web.service.AccountService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AccountServlet", urlPatterns = "/accountServlet")
public class AccountServlet extends HttpServlet {
    private AccountImp accountImp = new AccountImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                updateAccountForm(req, resp);
                break;
            case "delete":
                deleteAccount(req,resp);
                break;
            case "add":
                addAccountForm(req,resp);
                break;
            default:
                viewAllAccount(req, resp);
        }
    }

    private void addAccountForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/addAccount.jsp");
        requestDispatcher.forward(req,resp);
    }

    private void deleteAccount(HttpServletRequest req, HttpServletResponse resp) {
        String accountId = req.getParameter("accountId");
        accountImp.deleteAccountById(accountId);
        List<Account> accounts = new ArrayList<>();
        accounts = accountImp.viewAllAccount();
        req.setAttribute("accounts",accounts);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/viewAccount.jsp");
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateAccountForm(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        String accountId = httpServletRequest.getParameter("accountId");
        AccountService accountService = new AccountImp();
        Account handler = accountService.findById(accountId);
        httpServletRequest.setAttribute("account", handler);
        RequestDispatcher requestDispatcher = httpServletRequest.getRequestDispatcher("admin/updateAccount.jsp");
        try {
            requestDispatcher.forward(httpServletRequest, httpServletResponse);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void viewAllAccount(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        List<Account> accounts = accountImp.viewAllAccount();
        httpServletRequest.setAttribute("accounts", accounts);
        RequestDispatcher requestDispatcher = httpServletRequest.getRequestDispatcher("admin/viewAccount.jsp");
        try {
            requestDispatcher.forward(httpServletRequest, httpServletResponse);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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
                updateAccount(req, resp);
                break;
            case "add":
                addAccount(req,resp);
            default:
                viewAllAccount(req, resp);
        }
    }

    private void addAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accountId = req.getParameter("accountId");
        String accountName = req.getParameter("accountName");
        String loginName = req.getParameter("loginName");
        String password = req.getParameter("password");
        String accountAccess = req.getParameter("accountAccess");
        String address = req.getParameter("address");
        String phoneNumber = req.getParameter("phoneNumber");
        boolean gender = Boolean.parseBoolean(req.getParameter("gender"));
        boolean status = Boolean.parseBoolean(req.getParameter("status"));
        Account handler = new Account(accountId, accountName, loginName, accountAccess,password, address, phoneNumber, gender, status);
        accountImp.addNewAccount(handler);

        List<Account> accounts = accountImp.viewAllAccount();;
        req.setAttribute("accounts",accounts);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/viewAccount.jsp");
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accountId = req.getParameter("accountId");
        String accountName = req.getParameter("accountName");
        String loginName = req.getParameter("loginName");
        String password = req.getParameter("password");
        String accountAccess = req.getParameter("accountAccess");
        String address = req.getParameter("address");
        String phoneNumber = req.getParameter("phoneNumber");
        boolean gender = Boolean.parseBoolean(req.getParameter("gender"));
        boolean status = Boolean.parseBoolean(req.getParameter("status"));
        Account handler = new Account(accountId, accountName, loginName, password, accountAccess, address, phoneNumber, gender, status);
        accountImp.updateAccountById(handler);
        List<Account> accounts;
        accounts = accountImp.viewAllAccount();
        req.setAttribute("accounts",accounts);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/viewAccount.jsp");
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

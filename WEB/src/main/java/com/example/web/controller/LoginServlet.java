package com.example.web.controller;

import com.example.web.model.Account;
import com.example.web.service.AccountImp;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    AccountImp accountImp = new AccountImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null)
            action = "";
        switch (action) {
            case "login": {
                checkLogin(request, response);
                break;
            }
            case "signup": {
                signUp(request, response);
                break;
            }
        }
    }

    private void signUp(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String username = request.getParameter("registerUserName");
        String password = request.getParameter("registerPassword");
        String reTypePassword = request.getParameter("registerRetypePassword");
        String fullname = request.getParameter("registerName");
        boolean gender;
        String genderValue = request.getParameter("gender");
        if (genderValue.equals("male")) {
            gender = true;
        } else {
            gender = false;
        }
        String address = request.getParameter("registerAddress");
        String phoneNumber = request.getParameter("registerPhoneNumber");
        String maxAccountId = accountImp.getMaxAccountID();
        String id = "CT".concat(String.valueOf(Integer.parseInt(maxAccountId.substring(2)) + 1));
        System.out.println(maxAccountId.charAt(2));
        System.out.println(maxAccountId.charAt(2) + 1);


        Account accountFindOut = accountImp.findByLoginName(username);

        boolean matchUserName = username.matches("[\\w]+");
        boolean matchFullName = fullname.matches(".+");
        boolean matchAddress = address.matches(".+");
        boolean matchPassword = password.matches("[\\w]{6,}");
        boolean matchRetypePassword = password.equals(reTypePassword);
        boolean matchPhoneNumber = phoneNumber.matches("[0-9]{10,11}");

        String validateUserName = "";
        String validatePassword = "";
        String validateReTypePassword = "";
        String validateFullName = "";
        String validateAddress = "";
        String validatePhoneNumber = "";
        String signUpOK = "Register Successfully, Please Sign In";

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("signUp.jsp");
        if (!matchUserName || username.equals("example") || username.equals(" ")) {
            validateUserName = "Must include at least 1 character or inputted 'example'";
        } else if (accountFindOut != null) {
            validateUserName = "Existed account, please select other username";
        }
        if (!matchFullName || fullname.equals("example") || fullname.equals(" ")) {
            validateFullName = "Must include at least 1 character or inputted 'example'";
        }
        if (!matchPassword || password.equals("example") || password.equals(" ")) {
            validatePassword = "Password must be include at least 6 character or inputted 'example'";
        }
        if (!matchRetypePassword || reTypePassword.equals("example") || reTypePassword.equals(" ")) {
            validateReTypePassword = "Not Match Password or inputted 'example'";

        }
        if (!matchAddress || address.equals("example") || address.equals(" ")) {
            validateAddress = "Must include at least 1 character or inputted 'example'";

        }
        if (!matchPhoneNumber && !phoneNumber.equals("example") || password.equals(" ")) {
            validatePhoneNumber = "Invalid format";
        }
        request.setAttribute("validateUserName", validateUserName);
        request.setAttribute("validateFullName", validateFullName);
        request.setAttribute("validatePassword", validatePassword);
        request.setAttribute("validateReTypePassword", validateReTypePassword);
        request.setAttribute("validateAddress", validateAddress);
        request.setAttribute("validatePhoneNumber", validatePhoneNumber);

        if (matchUserName && matchFullName && matchAddress && matchPassword && matchRetypePassword && matchPhoneNumber && accountFindOut == null) {
            Account account = new Account(id, fullname, username, "0", password, address, phoneNumber, gender, true);
            accountImp.addNewAccount(account);
            request.setAttribute("signUpOK", signUpOK);
            try {
                requestDispatcher.forward(request, response);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                requestDispatcher.forward(request, response);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


    }

    private void checkLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String admin = "admin";
        String user = "user";
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        Account account = accountImp.findByLoginName(userName);

        if (account == null) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
            String announcement = "Not found 'username'. Please SignUp first!";
            request.setAttribute("announcement", announcement);
            requestDispatcher.forward(request, response);
        } else {
            if (account.getAccountAccess().equals("1")) {
                if (!password.equals(account.getPassword())) {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
                    String announcement = "Wrong 'password'. Please try again!";
                    request.setAttribute("announcement", announcement);
                    requestDispatcher.forward(request, response);
                } else {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/admin.jsp");
                    requestDispatcher.forward(request, response);
                    session.setAttribute("role", admin);
                }
            } else if (account.getPassword().equals(password)) {
                String logined = "ok";

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("cookieUserName",userName);

                httpSession.removeAttribute("cookieIsLogin");
                httpSession.setAttribute("cookieIsLogin",logined);
                httpSession.setAttribute("role",user);

                response.sendRedirect("/pagination");
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("notPassFilter.jsp");
                String announcement = "Wrong 'password'. Please try again!";
                request.setAttribute("announcement", announcement);
                requestDispatcher.forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

package com.example.web.controller;
import com.example.web.model.Account;
import com.example.web.model.Item;
import com.example.web.model.Order;
import com.example.web.service.AccountImp;
import com.example.web.service.OrderServiceImp;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "CheckOutCartServlet", urlPatterns = "/checkoutcart")
public class CheckOutCartServlet extends HttpServlet {
    OrderServiceImp orderServiceImp = new OrderServiceImp();
    AccountImp accountImp = new AccountImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String isLogined = (String) session.getAttribute("cookieIsLogin");
        if (isLogined.equals("not yet")) {
            requestLoginIfNot(request, response);
        } else {
            String email = request.getParameter("email");
            String receiver = "";
            String address = "";
            String phoneNumber = "";

            if (!email.equals("example@gmail.com")) {
                receiver = request.getParameter("fullName");
                phoneNumber = request.getParameter("phoneNumber");
                address = request.getParameter("address");
            }

            if (receiver.equals("") || address.equals("") || phoneNumber.equals("") || email.equals("example@gmail.com") || email.equals("")) {
                String announcementToFillFields = "Please fill up all fields or Do not use 'example' value";
                request.setAttribute("announcementToFillFields", announcementToFillFields);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
                requestDispatcher.forward(request, response);
            } else {
                String orderUserName = (String) session.getAttribute("cookieUserName");
                Account loginedAccount = accountImp.findByLoginName(orderUserName);

                Order order = (Order) session.getAttribute("order");
                List<Item> list = order.getItems();

                String orderDate = String.valueOf(LocalDate.now());
                String[] dateArray = orderDate.split("-");
                int no;
                String orderIdHead = "OD" + dateArray[0] + dateArray[1] + dateArray[2];
                String maxOrderIdHaveOrderIdHead = orderServiceImp.getMaxOrderIdByOrderIdHead(orderIdHead);
                if (maxOrderIdHaveOrderIdHead.equals("")) {
                    no = 1;
                } else {
                    String orderIdTails = maxOrderIdHaveOrderIdHead.substring(10);
                    no = Integer.parseInt(orderIdTails) + 1;
                }

                String orderId = orderIdHead + String.valueOf(no);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("confirmOrder.jsp");
                request.setAttribute("orderId", orderId);
                request.setAttribute("list", list);
                request.setAttribute("accountId", loginedAccount.getAccountId());
                request.setAttribute("accountName", receiver);
                request.setAttribute("orderDate", orderDate);
                request.setAttribute("receiver", receiver);
                request.setAttribute("address", address);
                request.setAttribute("phoneNumber", phoneNumber);
                request.setAttribute("email", email);

                requestDispatcher.forward(request, response);
            }
        }
    }

    private void requestLoginIfNot(HttpServletRequest request, HttpServletResponse response) {
        String announcementToLogin = "Please login first!";
        request.setAttribute("announcementToLogin", announcementToLogin);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String isLogined = (String) session.getAttribute("cookieIsLogin");
        if (isLogined.equals("not yet")) {
            requestLoginIfNot(request, response);
        } else {
            setDefaultInformation(request, response, session);
            return;
        }
    }

    private void setDefaultInformation(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        String userName = (String) session.getAttribute("cookieUserName");
        AccountImp accountImp = new AccountImp();
        Account account = accountImp.findByLoginName(userName);

        String accountName = account.getAccountName();
        String email = "Please input your email";
        String phoneNumber = account.getPhoneNumber();
        String address = account.getAddress();

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
        request.setAttribute("defaultAccountName", accountName);
        request.setAttribute("defaultEmail", email);
        request.setAttribute("defaultPhoneNumber", phoneNumber);
        request.setAttribute("defaultAddress", address);

        requestDispatcher.forward(request, response);
    }
}

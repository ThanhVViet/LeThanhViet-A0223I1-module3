package com.example.web.service;


import jakarta.servlet.*;

import java.io.IOException;
import java.util.Date;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServletRequest;


public class FilterService implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("Filter inited");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)servletRequest;
        String serverPath = req.getServletPath();
        System.out.println("Time: "+ new Date() + " Info: " + serverPath + " URL: "+req.getRequestURL());
        String role = (String) req.getSession().getAttribute("role");
        if(role ==null){
            role ="";
        }
        System.out.println("Session role: "+role);
        if(role.equals("admin")){
            filterChain.doFilter(servletRequest,servletResponse);
        }
        else {
            RequestDispatcher requestDispatcher = servletRequest.getRequestDispatcher("/login.jsp");
            requestDispatcher.forward(servletRequest,servletResponse);
        }

    }

    @Override
    public void destroy() {
        System.out.println("Filter destroyed");
    }
}

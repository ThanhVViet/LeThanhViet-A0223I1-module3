package com.example.ck.controller;


import com.example.ck.model.Category;
import com.example.ck.model.Product;
import com.example.ck.service.CategoryService;
import com.example.ck.service.ICategoryService;
import com.example.ck.service.IProductService;
import com.example.ck.service.ProductService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

import java.util.List;


@WebServlet(name = "Servlet", value = "/servlet")

public class ProductServlet extends HttpServlet {
    private IProductService iProductService = new ProductService();
    private ICategoryService iCategoryService = new CategoryService();

    public ProductServlet() {
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
                deleteProduct(request, response);
                break;
            default:
                listProduct(request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "meo":
                createProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
            case "search1":
                search1(request, response);
                break;
        }
    }

    private void search1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchName = request.getParameter("search1");
        List<Product> productList;
        productList = iProductService.findUserByName(searchName);
        request.setAttribute("list1", productList);
        request.setAttribute("searchName", searchName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
//        List<Category> list = iProductService.list();
        List<Category> list = iProductService.list();
        String cid_raw = request.getParameter("cid");
        int cid;
        if (cid_raw == null) {
            cid_raw = "0";
        }
        try {
            cid = Integer.parseInt(cid_raw);
            List<Product> list1 = iProductService.getProductByCategory(cid);
            request.setAttribute("list", list);
            request.setAttribute("list1", list1);
            request.setAttribute("cid", cid);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iProductService.delete(id);
        response.sendRedirect("/servlet");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = iProductService.select(id);

        List<Category> list = iProductService.list();
        request.setAttribute("list", list);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/cu_product.jsp");
        request.setAttribute("product", existingProduct);
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = iCategoryService.list();
        request.setAttribute("list", categories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cu_product.jsp");
        dispatcher.forward(request, response);
    }


    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String email = request.getParameter("color");
        String phone = request.getParameter("moTa");

        int id_category = Integer.parseInt(request.getParameter("cid"));

        Product product = new Product(id, name, price, quantity, email, phone, id_category);
        System.out.println(product);
        iProductService.update(product);
        response.sendRedirect("/servlet");

    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String email = request.getParameter("color");
        String phone = request.getParameter("moTa");

        int id_category = Integer.parseInt(request.getParameter("cid"));

        Product product = new Product(name, price, quantity, email, phone, id_category);
        System.out.println(product);
        iProductService.insert(product);
        response.sendRedirect("/servlet");

    }
}

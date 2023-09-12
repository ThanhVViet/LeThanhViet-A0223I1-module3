package com.example.web.service;


import com.example.web.model.Product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface ProductService {
    public Product getProductDetail(String productId);

    public List<Product> getListProduct() throws SQLException;

//    public List<Product> getSubListProduct(List<Product> list, int start, int end) throws SQLException;

    public List<Product> getListProduct(String categoryId) throws SQLException;

    public List<Product> getListProductIP() throws SQLException;

    public ArrayList<Product> getListProductSS() throws SQLException;

    public Product getProduct(String productId) throws SQLException;

    public void saveProduct(Product product) throws SQLException;

    public boolean updateProduct(Product product) throws SQLException;

    public boolean deleteProduct(String productId) throws SQLException;

    public List<Product> searchProduct(String searchName) throws SQLException;

    public List<Product> sortListProductDesc(String categoryId) throws SQLException;

    public List<Product> sortListProductAsc(String categoryId) throws SQLException;
}

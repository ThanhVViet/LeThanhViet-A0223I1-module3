package com.example.ck.repository;



import com.example.ck.model.Category;
import com.example.ck.model.Product;

import java.util.List;

public interface IProduct {
    List<Category> list();

    List<Product> getProductByCategory(int cid);

    boolean insert(Product t);

    boolean delete(int id);

    boolean update(Product t);

    Product select(int id);

    List<Product> getAllProduct();
    List<Product> findUserByName(String name);
}

package com.example.ck.service;


import com.example.ck.model.Category;
import com.example.ck.model.Product;
import com.example.ck.repository.IProduct;
import com.example.ck.repository.ProductImpl;

import java.util.List;

public class ProductService implements IProductService {
    private IProduct iProduct = new ProductImpl();

    @Override
    public List<Category> list() {
        return iProduct.list();
    }

    @Override
    public List<Product> getProductByCategory(int cid) {
        return iProduct.getProductByCategory(cid);
    }

    @Override
    public boolean insert(Product t) {
        return iProduct.insert(t);
    }

    @Override
    public boolean delete(int id) {
        return iProduct.delete(id);
    }

    @Override
    public boolean update(Product t) {
        return iProduct.update(t);
    }

    @Override
    public Product select(int id) {
        return iProduct.select(id);
    }

    @Override
    public List<Product> getAllProduct() {
        return iProduct.getAllProduct();
    }

    @Override
    public List<Product> findUserByName(String name) {
        return iProduct.findUserByName(name);
    }

}

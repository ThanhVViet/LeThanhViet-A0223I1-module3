package com.example.web.service;

import com.example.web.model.Category;

import java.sql.SQLException;
import java.util.List;

public interface CategoryService {
    public List<Category> getListCategory() throws SQLException;
    public void deleteCategory(String id);
    public Category getCategory(String categoryId) throws SQLException;
    public void addCategory(Category category);
    public void updateCategory (Category category);
}

package com.example.ck.service;



import com.example.ck.model.Category;
import com.example.ck.repository.CategoryImpl;
import com.example.ck.repository.ICategory;

import java.util.List;

public class CategoryService implements ICategoryService<Category> {
    private ICategory iCategory = new CategoryImpl();

    @Override
    public List<Category> list() {
        return iCategory.list();
    }

    @Override
    public void insert(Category category) {
        iCategory.insert(category);
    }

    @Override
    public boolean delete(int id) {
       return iCategory.delete(id);
    }

    @Override
    public boolean update(Category category) {
        return iCategory.update(category);
    }

    @Override
    public Category select(int id) {
        return (Category) iCategory.select(id);
    }
}

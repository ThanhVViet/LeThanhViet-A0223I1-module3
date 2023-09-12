package com.example.ck.service;


import com.example.ck.model.Category;

import java.util.List;

public interface ICategoryService<T> {
    List<Category> list();

    void insert(T t);

    boolean delete(int id);

    boolean update(T t);
    T select(int id);
}

package com.example.ck.repository;



import com.example.ck.model.Category;

import java.util.List;

public interface ICategory<T> {
    List<Category> list() ;
    void insert (T t);
    boolean delete(int id) ;
    boolean update(T t) ;
    T select(int id);
}

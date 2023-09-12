package com.example.crud_user.service;

import java.util.List;

public interface IUserService<T> {
    List<T> selectAll();
    void insert (T t);
    T select(int id);
    boolean delete(int id) ;
    boolean update(T t) ;
    List<T> findUserById(int name);
    List<T> findUserByName(String name);
}

package com.example.crud_user.repository;


import java.util.List;

public interface IUserRepository <T>{
    List<T> selectAll();
    void insert (T t);
    T select(int id);
    boolean delete(int id) ;
    boolean update(T t) ;
    List<T> findUserById(int name);
    List<T> findUserByName(String name);

}

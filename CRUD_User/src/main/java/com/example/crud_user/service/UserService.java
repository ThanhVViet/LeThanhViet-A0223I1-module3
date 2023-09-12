package com.example.crud_user.service;

import com.example.crud_user.model.User;
import com.example.crud_user.repository.IUserRepository;
import com.example.crud_user.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService<User> {
    private IUserRepository iUserRepository = new UserRepository();

    @Override
    public List<User> selectAll() {
        return iUserRepository.selectAll();
    }

    @Override
    public void insert(User user) {
        iUserRepository.insert(user);
    }

    @Override
    public User select(int id) {
        return (User) iUserRepository.select(id);
    }

    @Override
    public boolean delete(int id) {
        return iUserRepository.delete(id);
    }

    @Override
    public boolean update(User user) {
        return iUserRepository.update(user);
    }

    @Override
    public List<User> findUserById(int name) {
        return iUserRepository.findUserById(name);
    }

    @Override
    public List<User> findUserByName(String name) {
        return iUserRepository.findUserByName(name);
    }
}

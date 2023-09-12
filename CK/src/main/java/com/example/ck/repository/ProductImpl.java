package com.example.ck.repository;


import com.example.ck.model.Category;
import com.example.ck.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductImpl implements IProduct {
    private String SELECT = "SELECT * FROM category";
    private static final String DELETE = "delete from product where id = ?;";


    @Override
    public List<Category> list() {
        List<Category> list = new ArrayList<>();
        try {
            PreparedStatement ps = BaseRepository.getConnection().prepareStatement(SELECT);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("category_name");
                list.add(new Category(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> getProductByCategory(int cid) {
        List<Product> list = new ArrayList<>();
        String SELECT_P = "SELECT p.id, p.product_name, p.product_price, p.product_quantity, p.product_color, p.product_des, c.id as cid,"
                + "c.category_name as cname  from product p \n"
                + "     inner join category c on(p.category_id = c.id)";
        if (cid != 0) {
            SELECT_P += " where c.id=" + cid;
        }

        try {
            PreparedStatement ps = BaseRepository.getConnection().prepareStatement(SELECT_P);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Category category = new Category(rs.getInt("cid"), rs.getString("cname"));

                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("product_name"),
                        rs.getDouble("product_price"),
                        rs.getInt("product_quantity"),
                        rs.getString("product_color"),
                        rs.getString("product_des"),
                        category
                );
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }


    @Override
    public boolean insert(Product product) {
        boolean isCreated = false;

        String query = "{CALL create_product(?,?,?,?,?,?)}";
        try {
            Connection con = BaseRepository.getConnection();
            CallableStatement ps = con.prepareCall(query);
            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setInt(3, product.getQuantity());
            ps.setString(4, product.getColor());
            ps.setString(5, product.getMoTa());
            ps.setInt(6, product.getId_category());

            isCreated = ps.execute();


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isCreated;
    }

    @Override
    public boolean delete(int id) {
        boolean rowDeleted;
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDeleted;
    }

    @Override
    public boolean update(Product product) {
        boolean isUpdate = false;
        String query = "{CALL update_product(?,?,?,?,?,?,?)}";
        try {
            Connection connection = BaseRepository.getConnection();
            CallableStatement ps = connection.prepareCall(query);

            ps.setInt(1, product.getId());

            ps.setString(2, product.getName());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantity());
            ps.setString(5, product.getColor());
            ps.setString(6, product.getMoTa());
            ps.setInt(7, product.getId_category());
            isUpdate = ps.execute();
            System.out.println(query);
            System.out.println(ps);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpdate;
    }

    @Override
    public Product select(int id) {
        Product product = null;
        String query = "{CALL get_product_by_id(?)}";
        try {
            Connection connection = BaseRepository.getConnection();
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int quantity = rs.getInt(4);
                String color = rs.getString(5);
                String moTa = rs.getString(6);
                int category_id = rs.getInt(7);
                product = new Product(id, name, price, quantity, color, moTa, category_id);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return product;
    }


    @Override
    public List<Product> getAllProduct() {
        return null;
    }

    private static final String SELECT_PRODUCT_BY_ID = "select * from product where product_name like concat('%',?,'%');";

    @Override
    public List<Product> findUserByName(String name) {
        List<Product> users = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);) {
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nameUser = rs.getString("product_name");
                double email = Double.parseDouble(rs.getString("product_price"));
                int country = Integer.parseInt(rs.getString("product_quantity"));
                String color = rs.getString("product_color");
                int category_id = rs.getInt("category_id");
                users.add(new Product(id, nameUser, email, country, color, category_id));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }


}

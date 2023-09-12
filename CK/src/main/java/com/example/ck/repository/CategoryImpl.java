package com.example.ck.repository;



import com.example.ck.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryImpl implements ICategory<Category> {
    private String SELECT = "SELECT * FROM category";
    private String SELECT_CATEGORY_BY_ID = "SELECT id, category_name FROM category where id = ?";
    private static final String INSERT_CATEGORY_SQL = "INSERT INTO category" + "  (category_name) VALUES "
            + " (?);";
    private static final String DELETE_CATEGORY_SQL = "delete from category where id = ?;";
    private static final String UPDATE_CATEGORY_SQL = "update category set category_name = ? where id = ?;";

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
    public void insert(Category category) {
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CATEGORY_SQL)) {
            preparedStatement.setString(1, category.getName());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public boolean delete(int id) {
        boolean rowDeleted;
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_CATEGORY_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDeleted;
    }

    @Override
    public boolean update(Category category) {
        boolean rowUpdated;
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_CATEGORY_SQL);) {
            statement.setString(1, category.getName());
            statement.setInt(2, category.getId());

            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdated;

    }

    @Override
    public Category select(int id) {
        Category category = null;
        try (Connection connection = BaseRepository.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORY_BY_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("category_name");
                category = new Category(id, name);
                return category;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }
}

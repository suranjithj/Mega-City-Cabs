package dao;

import config.DatabaseConnection;
import models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    // Abstraction
    public User validateUser(String username, String password) {
        User user = null;
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";

        try (Connection con = DatabaseConnection.initializeDatabase();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User(); //Object Creation
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setName(rs.getString("name"));
                    user.setAddress(rs.getString("address"));
                    user.setPhone(rs.getString("phone"));
                    user.setNic(rs.getString("nic"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean registerUser(User user) {
        boolean success = false;

        // Check if the user already exists
        if (isUserExists(user.getUsername(), user.getEmail())) {
            return false;
        }

        String query = "INSERT INTO users(username, name, address, phone, nic, email, password) VALUES(?,?,?,?,?,?,?)";

        try (Connection con = DatabaseConnection.initializeDatabase();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getName());
            ps.setString(3, user.getAddress());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getNic());
            ps.setString(6, user.getEmail());
            ps.setString(7, user.getPassword());

            int rows = ps.executeUpdate();
            success = rows > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return success;
    }

    // Method user already exists
    // Abstraction
    private boolean isUserExists(String username, String nic) {
        String query = "SELECT id FROM users WHERE username = ? OR nic = ?";
        try (Connection con = DatabaseConnection.initializeDatabase();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, username);
            ps.setString(2, nic);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }


}

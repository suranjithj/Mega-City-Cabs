package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class connectionProvider {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mccabsdb1", "root", "root");
            return connection;
        }
        catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}

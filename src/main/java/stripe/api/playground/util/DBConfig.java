package stripe.api.playground.util;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * User: chenma
 * Date: 2018-12-20
 */
public class DBConfig {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn;

        Class.forName(Driver.class.getName());
        conn = DriverManager.getConnection(Constants.DB_URL, Constants.DB_USER, Constants.DB_PASSWORD);
        return conn;
    }
}

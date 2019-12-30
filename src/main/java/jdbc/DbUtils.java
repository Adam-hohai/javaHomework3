package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtils {
    public static Connection getConnection() throws Exception{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=StudentScore";
        String user = "sa";
        String password = "990919";
        Connection conn = DriverManager.getConnection(url, user, password);
        return conn;
    }
}

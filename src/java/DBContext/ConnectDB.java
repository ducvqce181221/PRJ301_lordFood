package DBContext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {

    private static String url = "jdbc:sqlserver://localhost:1433;databaseName=lorfood;encrypt=true;trustServerCertificate=true";
    private static String user = "sa";
    private static String pass = "khangmc1502@";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        try {

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection conn = DriverManager.getConnection(url, user, pass);
            if (conn != null) {
                System.out.println("Kết nối thành công!");
                return conn;
            } else {
                System.out.println("Kết nối thất bại!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

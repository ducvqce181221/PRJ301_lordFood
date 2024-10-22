package DBContext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {

    private static String url = "jdbc:sqlserver://localhost:1433;databaseName=lorfood;encrypt=true;trustServerCertificate=true";
    private static String user = "sa";
    private static String pass = "1234567812312312";
    
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectDB.getConnection();
        if (conn != null) {
            System.out.println("Kết nối thành công!");
        } else {
            System.out.println("Kết nối thất bại!");
        }
    }


    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(url, user, pass);         
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

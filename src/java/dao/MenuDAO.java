/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import DBContext.ConnectDB;
import model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class MenuDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private static String SELECT_ALL_PRODUCT = "SELECT * FROM product";
    private static String SELECT_PRODUCT_By_ID = "SELECT * FROM product WHERE categoryID = ?";
    private static String Delect_By_Id = "DELETE FROM category WHERE categoryId = ?";
    private static String Insert_Cate = "INSERT INTO category (category_name) VALUES (?);";
    private static String Update_Cate = "UPDATE category SET category_name = ? WHERE = ?";

    public List<Product> getAllProduct() {
        List<Product> listProducts = new ArrayList<>();
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(SELECT_ALL_PRODUCT);
            rs = ps.executeQuery();
            while (rs.next()) {
                listProducts.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9)));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return listProducts;
    }
    // TEST getAllProduct()
//    public static void main(String[] args) {
//        MenuDAO dao = new MenuDAO();
//        List<Product> list = dao.getAllProduct();
//        for (Product product : list) {
//            System.out.println(product);
//        }
//    }

    public List<Product> getProductByCateID(int cateid) {
        List<Product> listProducts = new ArrayList<>();
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(SELECT_PRODUCT_By_ID);
            ps.setInt(1, cateid);
            rs = ps.executeQuery();
            while (rs.next()) {
                listProducts.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9)));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return listProducts;
    }

}

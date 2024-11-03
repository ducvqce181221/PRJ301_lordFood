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
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private static String SELECT_ALL_PRODUCT = "SELECT * FROM product";
    private static String SELECT_PRODUCT_BY_CateID = "SELECT * FROM product WHERE categoryID = ?";
    private static String SELECT_PRODUCT_BY_ProID = "SELECT * FROM product WHERE product_id = ?";
    private static String DELETE_PRODUCT_BY_ProID = "DELETE FROM product WHERE product_id = ?";
    private static String INSERT_PRODUCT = "INSERT INTO product (productName, description, price, qty, imageURL, categoryID) VALUES "
            + "(?, ?, ?, ?, ?, ?)";
    private static String UPDATE_PRODUCT_BY_ProID = "UPDATE product SET productName = ?, description = ?, price = ?, qty = ?, imageURL = ?, categoryID = ? WHERE product_id = ?";
    private static String SEARCH_PRODUCT_BY_NAME = "SELECT * FROM product WHERE productName COLLATE Latin1_General_CI_AI LIKE ?";

    public List<Product> searchProduct(String productName) {
        List<Product> listProducts = new ArrayList<>();
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(SEARCH_PRODUCT_BY_NAME);
            ps.setString(1, "%" + productName + "%");
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
//        ProductDAO dao = new ProductDAO();
//        List<Product> list = dao.getAllProduct();
//        for (Product product : list) {
//            System.out.println(product);
//        }
//    }

    public Product getProductByProID(int proid) {
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(SELECT_PRODUCT_BY_ProID);
            ps.setInt(1, proid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product> getProductByCateID(int cateid) {
        List<Product> listProducts = new ArrayList<>();
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(SELECT_PRODUCT_BY_CateID);
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

    public boolean updateProduct(Product product) throws ClassNotFoundException {
        boolean rowUpdated = false;
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(UPDATE_PRODUCT_BY_ProID);
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantityOfStock());
            ps.setString(5, product.getImageURL());
            ps.setInt(6, product.getCategoryID());
            ps.setInt(7, product.getProduct_id());
            rowUpdated = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    // DEMO updateProduct(Product product)
//        public static void main(String[] args) throws ClassNotFoundException {
//        Product product = new Product(1, "Iced Milk Coffee", "Special iced milk coffee with a fragrant taste", 20000, 120, "../img/menu/peachTea.webp", 0, null, null);
//        ProductDAO productDAO = new ProductDAO();
//        boolean isUpdate = productDAO.updateProduct(product);
//        if(isUpdate){
//            System.out.println("Successfully");
//            System.out.println(product.getProduct_id());
//            System.out.println(product.getProductName());         
//            System.out.println(product.getDescription());
//            System.out.println(product.getPrice());
//            System.out.println(product.getQuantityOfStock());
//            System.out.println(product.getImageURL());
//        } else {
//            System.out.println("Fail");
//        }
//    }
    public boolean deleteProduct(int productID) throws ClassNotFoundException {
// Logic để xóa nhân viên khỏi cơ sở dữ liệu dựa trên ID
        boolean rowDelete = false;
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(DELETE_PRODUCT_BY_ProID);
            ps.setInt(1, productID);
            rowDelete = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }

    public boolean addProduct(Product product) throws ClassNotFoundException {
// Logic để thêm mới một nhân viên vào cơ sở dữ liệu
        boolean rowAdd = false;
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(INSERT_PRODUCT);
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantityOfStock());
            ps.setString(5, product.getImageURL());
            ps.setInt(6, product.getCategoryID());
            rowAdd = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowAdd;
    }

    public Product getProduct(int id) {
        Product p = null;
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(SELECT_PRODUCT_BY_ProID);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
               p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

}

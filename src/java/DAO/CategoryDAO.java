/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Category;
import java.sql.*;
import java.util.List;
import DBContext.ConnectDB;

/**
 *
 * @author Truong Van Khang - CE181852
 */
public class CategoryDAO {

    protected static Connection Con;
    protected static String Select_All = "SELECT * FROM category";
    protected static String Delect_By_Id = "DELETE FROM category WHERE categoryId = ?";
    protected static String Insert_Cate = "INSERT INTO category (category_name) VALUES (?);";
    protected static String Update_Cate = "UPDATE category SET category_name = ? WHERE = ?";

    public static List<Category> getAll() {
        List<Category> list = null;
        try {
            Con = ConnectDB.getConnection();

            PreparedStatement stm = Con.prepareStatement(Select_All);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Category c = new Category(
                        rs.getString(1),
                        rs.getString(2)
                );
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (Con != null) {
                    Con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return list;
    }

    public static boolean DelectById(String Id) {
        boolean rs = false;
        try {
            Con = ConnectDB.getConnection();
            PreparedStatement stm = Con.prepareStatement(Delect_By_Id);
            rs = stm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (Con != null) {
                    Con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return rs;
    }

    public static boolean InsertCate(String CategoryName) {
        boolean rs = false;
        try {
            Con = ConnectDB.getConnection();
            PreparedStatement stm = Con.prepareStatement(Insert_Cate);
            stm.setString(1, CategoryName);
            rs = stm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (Con != null) {
                    Con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return rs;
    }

    public static boolean UpdateCateById(String Id, String CategoryName) {
        boolean rs = false;
        try {
            Con = ConnectDB.getConnection();
            PreparedStatement stm = Con.prepareStatement(Update_Cate);
            stm.setString(1, CategoryName);
            stm.setInt(2, Integer.parseInt(Id));
            rs = stm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (Con != null) {
                    Con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return rs;
        }

    }
}

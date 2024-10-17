/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Category;
import java.sql.*;
import java.util.List;
import DBContext.ConnectDB;
import java.util.ArrayList;

/**
 *
 * @author Truong Van Khang - CE181852
 */
public class CategoryDAO {

    protected static Connection Con;
    protected static String Select_All = "SELECT * FROM category";
    protected static String Delect_By_Id = "DELETE FROM category WHERE categoryId = ?";
    protected static String Insert_Cate = "INSERT INTO category (categoryId, category_name) VALUES (?, ?)";
    protected static String Update_Cate = "UPDATE category SET category_name = ? WHERE categoryId = ?";
    protected static String Find_Deleted_Id = "SELECT MIN(t1.categoryId + 1) AS nextId "
            + "FROM category t1 "
            + "LEFT JOIN category t2 ON t1.categoryId + 1 = t2.categoryId "
            + "WHERE t2.categoryId IS NULL AND t1.categoryId >= 1";

    public static List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        try {
            Con = ConnectDB.getConnection();
            PreparedStatement stm = Con.prepareStatement(Select_All);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Category c = new Category(
                        rs.getString(1),
                        rs.getString(2));
                list.add(c);
            }
            rs.close();
            stm.close();
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
            stm.setString(1, Id);
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
        boolean result = false;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rsId = null;

        try {
            con = ConnectDB.getConnection();
            con.setAutoCommit(false);

            Statement stmt = con.createStatement();
            stmt.execute("SET IDENTITY_INSERT category ON");

            String queryFindDeletedId = Find_Deleted_Id;
            rsId = stmt.executeQuery(queryFindDeletedId);

            int nextId = 1;
            if (rsId.next() && rsId.getInt("nextId") != 0) {
                nextId = rsId.getInt("nextId");
            }

            String queryInsert = Insert_Cate;
            stm = con.prepareStatement(queryInsert);
            stm.setInt(1, nextId);
            stm.setString(2, CategoryName);

            result = stm.executeUpdate() > 0;

            stmt.execute("SET IDENTITY_INSERT category OFF");
            con.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rsId != null) {
                    rsId.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
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

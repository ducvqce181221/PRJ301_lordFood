/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Category;
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
    protected static String Select_Cate_By_ID = "SELECT * FROM category WHERE categoryId = ?";
    protected static String Select_All = "SELECT * FROM category";
    protected static String Delect_By_Id = "DELETE FROM category WHERE categoryId = ?";
    protected static String Insert_Cate = "INSERT INTO category (categoryId, category_name, create_at) VALUES (?, ?, ?)";
    protected static String Update_Cate = "UPDATE category SET category_name = ?, create_at = ? WHERE categoryId = ?";
    protected static String Find_Deleted_Id = "SELECT MIN(t1.categoryId + 1) AS nextId "
            + "FROM category t1 "
            + "LEFT JOIN category t2 ON t1.categoryId + 1 = t2.categoryId "
            + "WHERE t2.categoryId IS NULL AND t1.categoryId >= 1";
    protected static String Find_Cate_By_Name = "SELECT CategoryName FROM category WHERE CategoryName LIKE '%?%';";

    public static List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        try {
            Con = ConnectDB.getConnection();
            PreparedStatement stm = Con.prepareStatement(Select_All);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Category c = new Category(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getTimestamp(3));
                list.add(c);
            }
            rs.close();
            stm.close();
        } catch (ClassNotFoundException | SQLException e) {
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

    public static boolean InsertCate(String CategoryName, Timestamp create_at) {
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
            stm.setTimestamp(3, create_at);

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

    public static boolean UpdateCateById(String Id, String CategoryName, Timestamp create_at) {
        boolean rs = false;
        try {
            Con = ConnectDB.getConnection();
            PreparedStatement stm = Con.prepareStatement(Update_Cate);
            stm.setString(1, CategoryName);
            stm.setInt(3, Integer.parseInt(Id));
            stm.setTimestamp(2, create_at);
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

    public static List<Category> FindCateByName(String categoryName) {
        List<Category> list = new ArrayList<>();
        try {
            Con = ConnectDB.getConnection();
            PreparedStatement stm = Con.prepareStatement("SELECT * FROM category WHERE category_name LIKE ?;");
            stm.setString(1, "%" + categoryName + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Category c = new Category(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getTimestamp(3));
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

    public static Category getCateByID(int cateid) throws ClassNotFoundException {
// Logic để lấy thông tin nhân viên dựa trên ID
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Con = ConnectDB.getConnection();
            ps = Con.prepareStatement(Select_Cate_By_ID);
            ps.setInt(1, cateid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getString(1),
                        rs.getString(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

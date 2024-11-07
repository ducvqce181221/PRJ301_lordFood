/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ShippingMethod;

/**
 *
 * @author Truong Van Khang - CE181852
 */
public class ShippingMethodDAO {
    
      protected static Connection Conn = null;
    protected static String SelectAll = "Select * from ShippingMethod ";
    protected static String insert = "INSERT INTO ShippingMethod(MethodName) VALUES (?)";
    protected static String delete = "DELETE FROM ShippingMethod WHERE ShippingMethodID = ?";
    protected static String update = "UPDATE ShippingMethod SET MethodName = ? WHERE ShippingMethodID = ?";

    public static List<ShippingMethod> getAll() {
        List<ShippingMethod> list = new ArrayList<>();
        ShippingMethod s = null;
        try {
            Conn = DBContext.ConnectDB.getConnection();
            PreparedStatement stm = Conn.prepareStatement(SelectAll);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                s = new ShippingMethod(
                        rs.getString(1),
                        rs.getString(2));
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static boolean addShipM(String name) {
        boolean complete = false;
        try {
            PreparedStatement stm = Conn.prepareStatement(insert);
            stm.setString(1, name);
            complete = stm.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return complete;
    }

    public static boolean deleteShipMT(String ID) {
        boolean complete = false;
        try {
            PreparedStatement stm = Conn.prepareStatement(delete);
            stm.setString(1, ID);
            complete = stm.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return complete;
    }

    public static boolean updateShipMT(String ID, String Name) {
        boolean complete = false;
        try {
            PreparedStatement stm = Conn.prepareStatement(update);
            stm.setString(1, Name);
            stm.setString(2, ID);
            complete = stm.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return complete;
    }

}

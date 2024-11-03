/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.PaymentMethod;

/**
 *
 * @author Truong Van Khang - CE181852
 */
public class PaymentMethodDAO {

    protected static Connection Conn = null;
    protected static String SelectAll = "Select * from PaymentMethod";
    protected static String insert = "INSERT INTO PaymentMethod(MethodName) VALUES (?)";
    protected static String delete = "DELETE FROM PaymentMethod WHERE PaymentMethodID = ?";
    protected static String update = "UPDATE PaymentMethod SET MethodName = ? WHERE PaymentMethodID = ?";

    public static List<PaymentMethod> getAll() {
        List<PaymentMethod> list = new ArrayList<>();
        PaymentMethod p = null;
        try {
            Conn = DBContext.ConnectDB.getConnection();
            PreparedStatement stm = Conn.prepareStatement(SelectAll);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                p = new PaymentMethod(
                        rs.getString(1),
                        rs.getString(2));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static boolean addPaymentM(String name) {
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

    public static boolean deletePaymentMT(String ID) {
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

    public static boolean updatePaymentMT(String ID, String Name) {
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

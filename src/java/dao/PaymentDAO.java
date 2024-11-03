/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.List;
import model.Payment;
import model.ShippingMethod;

/**
 *
 * @author Truong Van Khang - CE181852
 */
public class PaymentDAO {

    protected static String SelectALL = "select * from Payment";
    protected static String addPayment = "INSERT INTO Payment (Amount, PaymentDate, ShippingMethodID, PaymentMethodID, Address)"
            + "VALUES (?, ?, ?, ?, ?);";
    protected static Connection conn = null;

    public static List<Payment> getPaymentAll() {
        List<Payment> list = null;
        Payment p = null;
        try {
            conn = DBContext.ConnectDB.getConnection();
            PreparedStatement stm = conn.prepareStatement(SelectALL);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                p = new Payment(
                        rs.getString(1),
                        rs.getDouble(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static boolean addPayment(String Amount, String Datetime,
            String ShippingID, String PaymentID, String Address) {
        boolean complete = false;
        try {
            conn = DBContext.ConnectDB.getConnection();
            PreparedStatement stm = conn.prepareStatement(addPayment);
            stm.setString(1, Amount);
            stm.setString(2, Datetime);
            stm.setString(3, ShippingID);
            stm.setString(4, PaymentID);
            stm.setString(5, Address);
            complete = stm.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return complete;
    }

}

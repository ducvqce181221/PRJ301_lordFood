/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Payment;

/**
 *
 * @author Truong Van Khang - CE181852
 */
public class PaymentDAO {

    protected static String SelectALL = "select * from Payment";
    protected static String addPayment = "INSERT INTO Payment (Amount, PaymentDate, ShippingMethodID, PaymentMethodID, Address, nameUser)"
            + "VALUES (?, ?, ?, ?, ?,?);";
    protected static String deletePayment = "DELETE FROM Payment WHERE PaymentID = ?";
    protected static Connection conn = null;

    public static List<Payment> getPaymentAll() {
        List<Payment> list = new ArrayList<>();
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
                        rs.getString(6),
                        rs.getString(7));
                list.add(p);
            }
            for (Payment payment : list) {
                System.out.println(payment.getAmount());
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static boolean addPayment(String Amount, String Datetime,
            String ShippingID, String PaymentID, String Address, String NameUser, String phone) {
        boolean complete = false;
        try {
            conn = DBContext.ConnectDB.getConnection();
            PreparedStatement stm = conn.prepareStatement(addPayment);
            stm.setString(1, Amount);
            stm.setString(2, Datetime);
            stm.setString(3, ShippingID);
            stm.setString(4, PaymentID);
            stm.setString(5, Address);
            stm.setString(6, NameUser);
            stm.setString(7, phone);
            complete = stm.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return complete;
    }
    
    public static boolean deletePayment(String Id){
               boolean rs = false;
        try {
            PreparedStatement stm = conn.prepareStatement(deletePayment);
            stm.setString(1, Id);
            rs = stm.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        return rs;
    }

}

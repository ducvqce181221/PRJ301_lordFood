/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Truong Van Khang - CE181852
 */
public class PaymentMethod {

    private String PaymentMethodID;
    private String PaymentMethName;

    public PaymentMethod(String PaymentMethodID, String PaymentMethName) {
        this.PaymentMethodID = PaymentMethodID;
        this.PaymentMethName = PaymentMethName;
    }

    public String getPaymentMethodID() {
        return PaymentMethodID;
    }

    public void setPaymentMethodID(String PaymentMethodID) {
        this.PaymentMethodID = PaymentMethodID;
    }

    public String getPaymentMethName() {
        return PaymentMethName;
    }

    public void setPaymentMethName(String PaymentMethName) {
        this.PaymentMethName = PaymentMethName;
    }

}

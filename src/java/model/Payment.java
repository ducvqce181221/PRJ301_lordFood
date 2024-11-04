/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Truong Van Khang - CE181852
 */
public class Payment {

    private String PaymentID;
    private double Amount;
    private String DateTime;
    private String ShipMedthod;
    private String paymentMethod;
    private String shipAddress;
    private String NameUser;

    public Payment(String PaymentID, double Amount, String DateTime, String ShipMedthod, String paymentMethod, String shipAddress, String NameUser) {
        this.PaymentID = PaymentID;
        this.Amount = Amount;
        this.DateTime = DateTime;
        this.ShipMedthod = ShipMedthod;
        this.paymentMethod = paymentMethod;
        this.shipAddress = shipAddress;
        this.NameUser = NameUser;
    }

    public String getPaymentID() {
        return PaymentID;
    }

    public void setPaymentID(String PaymentID) {
        this.PaymentID = PaymentID;
    }

    public double getAmount() {
        return Amount;
    }

    public void setAmount(double Amount) {
        this.Amount = Amount;
    }

    public String getDateTime() {
        return DateTime;
    }

    public void setDateTime(String DateTime) {
        this.DateTime = DateTime;
    }

    public String getShipMedthod() {
        return ShipMedthod;
    }

    public void setShipMedthod(String ShipMedthod) {
        this.ShipMedthod = ShipMedthod;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public String getNameUser() {
        return NameUser;
    }

    public void setNameUser(String NameUser) {
        this.NameUser = NameUser;
    }

}

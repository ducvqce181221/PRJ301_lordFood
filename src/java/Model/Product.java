/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Truong Van Khang - CE181852
 */
public class Product {

    private int product_id;
    private String productName;
    private String description;
    private double price;
    private int quantityOfStock;
    private String imageURL;
    private int categoryID;
    private Timestamp created_at;
    private Timestamp updated_at;

    public Product(int product_id, String productName, String description, double price, int quantityOfStock, String imageURL, int categoryID, Timestamp created_at, Timestamp updated_at) {
        this.product_id = product_id;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.quantityOfStock = quantityOfStock;
        this.imageURL = imageURL;
        this.categoryID = categoryID;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Product() {
    }

   

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantityOfStock() {
        return quantityOfStock;
    }

    public void setQuantityOfStock(int quantityOfStock) {
        this.quantityOfStock = quantityOfStock;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
    
    

}

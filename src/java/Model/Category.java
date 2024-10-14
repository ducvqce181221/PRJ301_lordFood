/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Truong Van Khang - CE181852
 */
public class Category {

    private String categoryId;
    private String category_name;

    public Category(String category_name) {
        this.category_name = category_name;
    }

    public Category(String categoryId, String category_name) {
        this.categoryId = categoryId;
        this.category_name = category_name;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

}

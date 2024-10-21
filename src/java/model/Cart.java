package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<Item> items;

    public Cart() {
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    private Item getItemById(int id) { // Lay ra san san pham da them vao gio
        for (Item i : items) {
            if (i.getProduct().getProduct_id() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityById(int id) { // lay so luong san pham cua id do
        Item item = getItemById(id);
        return (item != null) ? item.getQuantity() : 0;
    }

    public void addItem(Item t) {
        if (items == null) {
            items = new ArrayList<>();
        }
        if (t.getProduct() == null) {
            throw new IllegalArgumentException("Product cannot be null");
        }
        Item existingItem = getItemById(t.getProduct().getProduct_id());
        if (existingItem != null) {
            System.out.println("Current quantity: " + existingItem.getQuantity());
            System.out.println("Adding quantity: " + t.getQuantity());

            existingItem.setQuantity(existingItem.getQuantity() + t.getQuantity());
            System.out.println("New quantity: " + existingItem.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void DeleteItem(Item t) {
        if (items == null) {
            items = new ArrayList<>();
        }
        if (t.getProduct() == null) {
            throw new IllegalArgumentException("Product cannot be null");
        }

        Item existingItem = getItemById(t.getProduct().getProduct_id());

        if (existingItem != null) {
            int newQuantity = existingItem.getQuantity() - t.getQuantity();
            if (newQuantity <= 0) {
                items.remove(existingItem);
                System.out.println("Item removed from the cart.");
            } else {
                existingItem.setQuantity(newQuantity);
                System.out.println("Updated quantity: " + existingItem.getQuantity());
            }
        } else {
            System.out.println("Item not found in the cart.");
        }
    }

    public void removeItem(int id) { // xoa san pham ra khoi gio
        Item item = getItemById(id);
        if (item != null) {
            items.remove(item);
        }
    }
    
    public void removeAll(){
        items.clear();
    }

    public double getTotalMoney() { // lay tong so tieng
        double total = 0;
        for (Item i : items) {
            total += (i.getQuantity() * i.getProduct().getPrice());
        }
        return total;
    }

}

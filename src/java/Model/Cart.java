package Model;

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

    private Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getProduct_id() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityById(int id) { // Get the quantity of a specific product
        Item item = getItemById(id);
        return (item != null) ? item.getQuantity() : 0; // Return 0 if the item doesn't exist
    }

    public void addItem(Item t) { // Add a new product to the cart
        Item existingItem = getItemById(t.getProduct().getProduct_id());
        if (existingItem != null) {
            existingItem.setQuantity(existingItem.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int id) { // Remove a product from the cart
        Item item = getItemById(id);
        if (item != null) {
            items.remove(item);
        }
    }

    public double getTotalMoney() { // Get the total cost of all items in the cart
        double total = 0;
        for (Item i : items) {
            total += (i.getQuantity() * i.getProduct().getPrice());
        }
        return total;
    }

    public void updateItemQuantity(int productId, int quantity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

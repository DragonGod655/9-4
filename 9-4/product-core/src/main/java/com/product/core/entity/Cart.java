package com.product.core.entity;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<String, Integer> items;

    public Cart() {
        this.items = new HashMap<>();
    }

    public Map<String, Integer> getItems() {
        return items;
    }

    public void setItems(Map<String, Integer> items) {
        this.items = items;
    }

    public void addProduct(String productId, int quantity) {
        if (items.containsKey(productId)) {
            items.put(productId, items.get(productId) + quantity);
        } else {
            items.put(productId, quantity);
        }
    }

    public void updateQuantity(String productId, int quantity) {
        if (quantity <= 0) {
            removeProduct(productId);
        } else {
            items.put(productId, quantity);
        }
    }

    public void removeProduct(String productId) {
        items.remove(productId);
    }
}

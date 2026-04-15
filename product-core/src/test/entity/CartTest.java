package com.product.core.entity;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CartTest {

    @Test
    public void testAddProduct() {
        Cart cart = new Cart();
        cart.addProduct("p1", 2);
        assertEquals(2, cart.getItems().get("p1"));
        
        // Add more of same product
        cart.addProduct("p1", 3);
        assertEquals(5, cart.getItems().get("p1"));
    }

    @Test
    public void testUpdateProductQuantity() {
        Cart cart = new Cart();
        cart.addProduct("p1", 2);
        cart.updateQuantity("p1", 10);
        assertEquals(10, cart.getItems().get("p1"));
    }

    @Test
    public void testRemoveProductByZeroQuantity() {
        Cart cart = new Cart();
        cart.addProduct("p1", 2);
        cart.updateQuantity("p1", 0);
        assertFalse(cart.getItems().containsKey("p1"));
    }

    @Test
    public void testRemoveProductDirectly() {
        Cart cart = new Cart();
        cart.addProduct("p1", 1);
        cart.removeProduct("p1");
        assertFalse(cart.getItems().containsKey("p1"));
    }
}

package com.product.core.service;

import org.junit.jupiter.api.Test;
import java.util.HashMap;
import java.util.Map;
import static org.junit.jupiter.api.Assertions.*;

public class OrderServiceTest {

    @Test
    public void testCheckoutEmptyCart() {
        OrderService service = new OrderService();
        Map<String, Integer> emptyCart = new HashMap<>();
        
        boolean result = service.checkout("User-X", emptyCart);
        assertFalse(result, "Check out should fail if cart is empty");
    }

    @Test
    public void testCheckoutValidCart() {
        OrderService service = new OrderService();
        Map<String, Integer> cart = new HashMap<>();
        cart.put("p1", 2);
        cart.put("p2", 1);
        
        boolean result = service.checkout("User-X", cart);
        assertTrue(result, "Check out should succeed with a valid cart");
    }

    @Test
    public void testCheckoutNullCart() {
        OrderService service = new OrderService();
        boolean result = service.checkout("User-X", null);
        assertFalse(result, "Check out should fail on null cart");
    }
}

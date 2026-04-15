package com.product.core.service;

import com.product.core.entity.Cart;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CartServiceTest {

    @Test
    public void testGetAndManageCart() {
        CartService service = new CartService();
        String sessionId = "Sess123";
        
        // Ensure cart is created on get
        Cart cart = service.getCart(sessionId);
        assertNotNull(cart, "Cart should not be null");
        assertTrue(cart.getItems().isEmpty(), "Initial cart should be empty");
        
        // Manage operation
        service.manage(sessionId, "p1", 3);
        Cart cartAfterAdd = service.getCart(sessionId);
        assertEquals(3, cartAfterAdd.getItems().get("p1"), "Cart should contain updated quantity");
    }

    @Test
    public void testClearCart() {
        CartService service = new CartService();
        service.manage("SessXYZ", "p1", 1);
        assertFalse(service.getCart("SessXYZ").getItems().isEmpty());
        
        service.clearCart("SessXYZ");
        assertTrue(service.getCart("SessXYZ").getItems().isEmpty(), "Cart should be empty after clearing");
    }
}

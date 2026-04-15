package com.product.core.service;

import com.product.core.entity.Cart;
import java.util.HashMap;
import java.util.Map;

public class CartService {
    // Lưu trữ Giỏ hàng theo Session/User ID
    private Map<String, Cart> cartSessions = new HashMap<>();

    public Cart getCart(String sessionId) {
        return cartSessions.computeIfAbsent(sessionId, k -> new Cart());
    }

    public void manage(String sessionId, String productId, int quantity) {
        Cart cart = getCart(sessionId);
        cart.addProduct(productId, quantity);
    }
    
    public void clearCart(String sessionId) {
        cartSessions.remove(sessionId);
    }
}

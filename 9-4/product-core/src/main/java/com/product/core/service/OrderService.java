package com.product.core.service;

import com.product.core.entity.Order;
import com.product.core.entity.OrderItem;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class OrderService {
    private List<Order> orderDb = new ArrayList<>();

    public boolean checkout(String userId, Map<String, Integer> cartItems) {
        if (cartItems == null || cartItems.isEmpty()) {
            return false; // Giỏ hàng rỗng
        }

        Order order = new Order(UUID.randomUUID().toString(), userId, new Date(), 0.0);
        List<OrderItem> items = new ArrayList<>();
        
        for (Map.Entry<String, Integer> entry : cartItems.entrySet()) {
            // Giả lập giá sản phẩm (trong thực tế sẽ lấy từ Database/ProductService)
            double mockPrice = 100.0; 
            OrderItem item = new OrderItem(entry.getKey(), entry.getValue(), mockPrice);
            items.add(item);
        }
        
        order.setItems(items);
        order.calculateTotal(); // Tính toán tổng tiền
        orderDb.add(order);
        
        return true; // Thanh toán thành công
    }
}

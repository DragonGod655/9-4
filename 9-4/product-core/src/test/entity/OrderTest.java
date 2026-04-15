package com.product.core.entity;

import org.junit.jupiter.api.Test;
import java.util.Arrays;
import java.util.Date;
import static org.junit.jupiter.api.Assertions.*;

public class OrderTest {

    @Test
    public void testCalculateTotal() {
        Order order = new Order("1", "user-hash", new Date(), 0.0);
        OrderItem item1 = new OrderItem("p1", 2, 50.0); // 100
        OrderItem item2 = new OrderItem("p2", 1, 150.0); // 150
        
        order.setItems(Arrays.asList(item1, item2));
        order.calculateTotal();
        
        assertEquals(250.0, order.getTotalAmount(), "Total amount should calculate 250");
    }

    @Test
    public void testGettersAndSetters() {
        Order order = new Order();
        order.setId("O1");
        order.setUserId("U1");
        
        assertEquals("O1", order.getId());
        assertEquals("U1", order.getUserId());
    }
}

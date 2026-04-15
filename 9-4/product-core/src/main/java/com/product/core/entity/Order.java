package com.product.core.entity;

import java.util.Date;
import java.util.List;

public class Order {
    private String id;
    private String userId;
    private Date orderDate;
    private double totalAmount;
    private List<OrderItem> items;

    public Order() {
    }

    public Order(String id, String userId, Date orderDate, double totalAmount) {
        this.id = id;
        this.userId = userId;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
    
    public List<OrderItem> getItems() {
        return items;
    }
    
    public void setItems(List<OrderItem> items) {
        this.items = items;
    }

    public void calculateTotal() {
        this.totalAmount = 0.0;
        if (this.items != null) {
            for (OrderItem item : this.items) {
                this.totalAmount += (item.getPrice() * item.getQuantity());
            }
        }
    }
}

package com.product.core.service;

import com.product.core.entity.Product;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class ProductService {
    private List<Product> productDb = new ArrayList<>();

    public boolean addProduct(String name, double price) {
        if (name == null || name.trim().isEmpty() || price < 0) {
            return false;
        }
        Product product = new Product(UUID.randomUUID().toString(), name, price, "Default Description", null);
        productDb.add(product);
        return true;
    }

    public List<Product> view() {
        return productDb;
    }
}

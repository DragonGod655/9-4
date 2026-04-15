package com.product.core.service;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class ProductServiceTest {

    @Test
    public void testAddProductValid() {
        ProductService service = new ProductService();
        boolean result = service.addProduct("Laptop", 1200.0);
        
        assertTrue(result, "Product should add successfully");
        assertEquals(1, service.view().size(), "Should have exactly 1 product");
    }

    @Test
    public void testAddProductInvalid() {
        ProductService service = new ProductService();
        
        assertFalse(service.addProduct("", 100.0), "Adding empty name should fail");
        assertFalse(service.addProduct("Phone", -5.0), "Adding negative price should fail");
        assertFalse(service.addProduct(null, 10.0), "Adding null name should fail");
        
        assertEquals(0, service.view().size(), "No products should be saved");
    }
}

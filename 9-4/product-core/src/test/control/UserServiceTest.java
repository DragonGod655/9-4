package com.product.core.service;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class UserServiceTest {

    @Test
    public void testRegisterValidUser() {
        UserService service = new UserService();
        boolean result = service.registerUser("test@test.com", "password123");
        assertTrue(result, "Registering a new email should be successful");
    }

    @Test
    public void testCheckExists() {
        UserService service = new UserService();
        service.registerUser("test@test.com", "password123");
        
        assertTrue(service.checkExists("test@test.com"), "Should return true for existing user");
        assertFalse(service.checkExists("none@test.com"), "Should return false for non-existent user");
    }

    @Test
    public void testRegisterDuplicateUser() {
        UserService service = new UserService();
        service.registerUser("test@test.com", "123");
        boolean result2 = service.registerUser("test@test.com", "456"); // Cùng email
        
        assertFalse(result2, "Registering with an existing email should fail");
    }
}

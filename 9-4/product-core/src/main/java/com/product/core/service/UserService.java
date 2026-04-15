package com.product.core.service;

import com.product.core.entity.User;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class UserService {
    private List<User> userDb = new ArrayList<>();

    public boolean checkExists(String email) {
        for (User user : userDb) {
            if (user.getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }

    public boolean registerUser(String email, String password) {
        if (checkExists(email)) {
            return false;
        }
        User user = new User(UUID.randomUUID().toString(), email, password, "GUEST");
        userDb.add(user);
        return true;
    }
}

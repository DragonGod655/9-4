package com.product.core.service;

import com.product.core.entity.Category;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class CategoryService {
    private List<Category> categoryDb = new ArrayList<>();

    public boolean addCategory(String name) {
        if (name == null || name.trim().isEmpty()) {
            return false;
        }
        Category category = new Category(UUID.randomUUID().toString(), name);
        categoryDb.add(category);
        return true;
    }

    public List<Category> getAllCategories() {
        return categoryDb;
    }
}

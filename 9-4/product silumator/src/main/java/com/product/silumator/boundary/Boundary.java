package com.product.silumator.boundary;

import com.product.core.entity.User;
import com.product.core.entity.Product;
import com.product.core.entity.Category;
import com.product.core.entity.Order;
import java.util.Date;

/**
 * Lớp Boundary hợp nhất đại diện cho tương tác ở vòng ngoài,
 * giao tiếp trực tiếp với 4 Entity chính của hệ thống.
 */
public class Boundary {

    // ==========================================
    // 1. TƯƠNG TÁC VỚI ENTITY: PRODUCT
    // ==========================================
    public Product createNewProduct(String id, String name, double price, String description, String categoryId) {
        System.out.println("[Boundary - Product] Đang tạo sản phẩm mới: " + name);
        Product product = new Product(id, name, price, description, categoryId);
        // Ở thực tế sẽ gọi ProductService.addProduct(...)
        return product;
    }

    public void displayProductInfo(Product product) {
        System.out.println("[Boundary - Product] Thông tin sp: " + product.getName() + " - Giá: " + product.getPrice());
    }

    // ==========================================
    // 2. TƯƠNG TÁC VỚI ENTITY: USER
    // ==========================================
    public User registerUser(String id, String email, String password, String role) {
        System.out.println("[Boundary - User] Khách hàng đăng ký tài khoản: " + email);
        User user = new User(id, email, password, role);
        return user;
    }

    // ==========================================
    // 3. TƯƠNG TÁC VỚI ENTITY: CATEGORY
    // ==========================================
    public Category createCategory(String id, String name) {
        System.out.println("[Boundary - Category] Tạo mới danh mục: " + name);
        Category category = new Category(id, name);
        return category;
    }

    // ==========================================
    // 4. TƯƠNG TÁC VỚI ENTITY: ORDER
    // ==========================================
    public Order processCheckout(String orderId, String userId, double totalAmount) {
        System.out.println("[Boundary - Order] Người dùng " + userId + " đang tiến hành thanh toán đơn hàng...");
        Order order = new Order(orderId, userId, new Date(), totalAmount);
        System.out.println("[Boundary - Order] Hoàn tất hóa đơn " + orderId + " với tổng tiền: " + totalAmount);
        return order;
    }
}

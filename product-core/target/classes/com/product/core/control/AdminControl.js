// product-core/src/controllers/AdminController.js
// Các tính năng thao tác của QTV và xử lý các Constraint

class AdminController {
    
    // --- QUẢN LÝ PRODUCT ---
    static async deleteProduct(req, res) {
        const { productId } = req.params;
        
        // KIỂM TRA RÀNG BUỘC (Constraint)
        // const hasOrders = await db.OrderDetails.count({ where: { productId }});
        const hasOrders = 1; // Giả lập đang có đơn hàng dính tới SP này
        
        if (hasOrders > 0) {
            return res.status(400).json({ 
                error: "Dữ liệu bị ràng buộc! Sản phẩm này đã tồn tại trong các đơn đặt hàng trực tuyến. Không thể xóa." 
            });
        }
        
        // Nếu không vướng: await db.Product.destroy({ where: { id: productId }})
        return res.json({ message: "Xóa sản phẩm thành công vì chưa có trong đơn hàng nào." });
    }

    // --- QUẢN LÝ USER ---
    static async getUserDetails(req, res) {
        // Không query trường password
        // const user = await db.User.findOne({ where: { id }, attributes: { exclude: ['password_hash'] }});
        return res.json({ id: 2, email: "user@doamin.com", role: "customer", status: "active" });
    }

    static async deleteUser(req, res) {
        const { userId } = req.params;

        // KIỂM TRA RÀNG BUỘC ĐƠN HÀNG ONLINE
        // const onlineOrders = await db.Orders.count({ where: { userId }});
        const onlineOrders = 0; // Thay đổi tùy vào DB thật

        if (onlineOrders > 0) {
            return res.status(400).json({ 
                error: "Không thể xoá! User này đã từng đặt hàng online." 
            });
        }
        
        return res.json({ message: "Đã xóa hoàn toàn User khỏi hệ thống." });
    }

    // --- QUẢN LÝ ĐƠN HÀNG ---
    static async updateOrderItemQuantity(req, res) {
        const { orderId, productId, newQuantity } = req.body;
        // await db.OrderDetails.update({ quantity: newQuantity }, { where: { orderId, productId } });
        // Recalculate Order Total...
        return res.json({ message: "Cập nhật số lượng của mặt hàng trong đơn hàng trực tuyến thành công." });
    }
}

module.exports = AdminController;

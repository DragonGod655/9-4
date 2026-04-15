// product-core/src/controllers/AuthController.js
// Xử lý Đăng ký, Đăng nhập và logic gộp giỏ hàng Session vào DB

class AuthController {
    static async register(req, res) {
        const { email, password, name } = req.body;
        // 1. Lưu CSDL mới với password băm (hash)
        // const newUser = await db.User.create({ email, password_hash: hash, role: 'customer' });

        // 2. Gửi Email thông báo
        // await MailService.send(email, "Đăng ký thành công", "Mật khẩu của bạn là...");

        return res.json({ message: "Tạo tài khoản thành công! Vui lòng đăng nhập." });
    }

    static async login(req, res) {
        // Mô phỏng đăng nhập thành công
        const user = { id: 1, email: "test@gmail.com", role: "customer" }; 
        const token = "mocked_jwt_token";

        // Gộp Giỏ hàng từ Session sang Database
        const sessionCart = req.session.cart || [];
        if (sessionCart.length > 0) {
            console.log("Merging Session Cart to Database for user:", user.id);
            for (let item of sessionCart) {
                // await db.Cart.upsert(... item logic)
            }
            // Clear session back to null
            req.session.cart = null;
        }

        return res.json({ message: "Đăng nhập thành công, Giỏ hàng đã đồng bộ!", token });
    }

    static async checkout(req, res) {
        // Chỉ Customer mới chạy method này (cần Auth Middleware cản trước)
        // 1. Validate Cart > 0
        // 2. Insert Orders, Insert Order_Details
        // 3. Xoá DB Carts
        // 4. Send Email: Xác nhận mã đơn hàng
        
        req.session.cart = null; // Dự phòng
        return res.json({ message: "Thanh toán thành công! Email đã được gửi đi." });
    }
}

module.exports = AuthController;

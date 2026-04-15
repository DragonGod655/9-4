// product-core/src/controllers/CartController.js
// Xử lý giỏ hàng cho Guest (Session) và Customer (Database)

class CartController {
    static async updateCart(req, res) {
        const { productId, quantity } = req.body;
        const isCustomer = req.user ? true : false;
        
        if (!isCustomer) {
            // Guest Flow: Dùng Session
            let cart = req.session.cart || [];
            if (quantity <= 0) {
                // Xoá sản phẩm
                cart = cart.filter(item => item.productId !== productId);
            } else {
                // Thêm hoặc Cập nhật
                const index = cart.findIndex(item => item.productId === productId);
                if (index >= 0) cart[index].quantity = quantity;
                else cart.push({ productId, quantity });
            }
            req.session.cart = cart;
            return res.json({ message: "Updated session cart", cart: req.session.cart });
        } else {
            // Customer Flow: Dùng Database (Mô phỏng)
            // const db = require('../models');
            if (quantity <= 0) {
                // await db.Cart.destroy({ where: { userId: req.user.id, productId }});
                return res.json({ message: "Product removed from DB cart" });
            } else {
                // await db.Cart.upsert({ userId: req.user.id, productId, quantity });
                return res.json({ message: "Product updated in DB cart" });
            }
        }
    }

    static async viewCart(req, res) {
        if (!req.user) return res.json({ cart: req.session.cart || [] });
        // Lấy từ DB cho Customer
        // const customerCart = await db.Cart.findAll({ where: { userId: req.user.id }});
        return res.json({ cart: "Data from DB Cart" });
    }
}

module.exports = CartController;

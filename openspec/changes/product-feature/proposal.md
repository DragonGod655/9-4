# Proposal: Hệ Thống E-commerce (BDD/Cucumber Demo)

## 1. Mục tiêu dự án
Xây dựng một hệ thống E-commerce mô phỏng các nghiệp vụ mua bán trực tuyến cơ bản và quản trị cửa hàng. Dự án áp dụng phương pháp phát triển phần mềm hướng hành vi (Behavior-Driven Development - BDD) thông qua việc sử dụng Gherkin và Cucumber. 

Hệ thống giúp đảm bảo các kịch bản kiểm thử (Test Scenarios) hoàn toàn bám sát các yêu cầu từ phía người dùng (User Stories) đã được đặc tả, từ đó đồng nhất luồng tư duy giữa sản phẩm và kỹ thuật.

## 2. Đối tượng người dùng (Actors)
Hệ thống xoay quanh 3 nhóm đối tượng người dùng chính:
- **Admin**: Quản trị viên điều hành và duy trì hoạt động của hệ thống E-commerce.
- **Customer**: Khách hàng đã có tài khoản và tiến hành đăng nhập vào hệ thống.
- **Guest**: Người dùng vãng lai, chưa có tài khoản hoặc chưa đăng nhập.

## 3. Các tính năng cốt lõi (Core Features)
Dựa trên các đặc tả yêu cầu, hệ thống bao gồm tổng cộng 13 tính năng chính được phân chia chặt chẽ theo quyền hạn (Role-based):

### Dành cho Quản trị viên (Admin)
1. **Quản lý sản phẩm**: Thêm mới, chỉnh sửa thông tin hoặc xóa các sản phẩm ra khỏi hệ thống (nếu sản phẩm chưa từng xuất hiện trong đơn hàng).
2. **Quản lý danh mục**: Thêm mới, chỉnh sửa và xóa các danh mục nhằm phục vụ việc phân loại mặt hàng kinh doanh.
3. **Quản lý người dùng**: Tra cứu, chỉnh sửa thông tin hoặc vô hiệu hóa/xóa các user (tài khoản chưa từng phát sinh đơn hàng).
4. **Quản lý đơn đặt hàng**: Xem toàn bộ danh sách các đơn hàng sắp xếp theo ngày mua; cho phép cập nhật số lượng mặt hàng trực tiếp bên trong các đơn hàng trực tuyến.

### Dành cho Khách hàng đã đăng nhập (Customer)
5. **Thanh toán**: Thực hiện tiến trình Checkout các sản phẩm đang có trong giỏ. Hệ thống tự động ghi nhận vào cơ sở dữ liệu, xóa session giỏ hàng hiện tại và gửi Email xác nhận tới khách hàng.

### Dành cho Người dùng vãng lai (Guest)
6. **Xem danh sách sản phẩm**: Duyệt qua danh sách tất cả các sản phẩm đang được rao bán.
7. **Xem chi tiết sản phẩm**: Nhấp vào một sản phẩm cụ thể để tra cứu thông tin chi tiết.
8. **Thêm vào giỏ hàng**: Lựa chọn và thêm các sản phẩm với số lượng tùy ý vào giỏ mua hàng (giỏ hàng tạm lưu trữ qua session).
9. **Xem giỏ hàng**: Kiểm tra các sản phẩm định mua cũng như số lượng trong giỏ hàng.
10. **Cập nhật giỏ hàng**: Điều chỉnh số lượng mặt hàng trong giỏ, hệ thống sẽ tự động xóa sản phẩm ra khỏi giỏ nếu số lượng bị đặt về 0.
11. **Đăng ký tài khoản**: Đăng ký trở thành thành viên mới thông qua Email chưa tồn tại cùng các thông tin xác thực bắt buộc.

## 4. Lợi điểm & Khả năng mở rộng
- **Tài liệu sống (Living Documentation)**: Các file `.feature` vừa đóng vai trò là tài liệu mô tả yêu cầu nghiệp vụ thân thiện với phía khách hàng, vừa là code chạy kiểm thử tự động.
- **Kịch bản thực tế**: Các Acceptance Criteria (AC) bao phủ toàn diện cả kịch bản thành công (Happy Path) và các trường hợp lỗi/ngoại lệ phổ biến (Unhappy Path như lỗi thiếu thông tin, đăng ký trùng Email, giỏ hàng trống...).
- **Đóng gói tính năng**: Bằng cách phân tách rõ ràng Boundary, Control và Entity, mã nguồn sẵn sàng cho những lần tích hợp các module Cổng thanh toán, Voucher hay Vận chuyển ở các version tiếp theo.

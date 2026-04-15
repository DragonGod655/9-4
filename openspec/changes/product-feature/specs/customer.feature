Feature: khách hàng mua sắm và quản lý đơn

  # User Story 1: Trải nghiệm Mua Sắm & Thanh Toán Đa Kênh
  # Là một khách hàng
  # Tôi muốn lựa chọn sản phẩm, điều chỉnh số lượng và thanh toán linh hoạt (Tiền mặt/QR)
  # Để hoàn tất việc mua đồ thể thao một cách nhanh chóng nhất
  # Acceptance Criteria:
  # - Cho phép chọn loại thanh toán, hiện QR nếu chọn chuyển khoản.
  # - Ngăn chặn thanh toán khi giỏ hàng trống hoặc chưa chọn phương thức trả tiền.
  # - Ngăn chặn thanh toán khi số lượng mua vượt quá tồn kho.

  Scenario: Mua hàng và chốt đơn thành công (Happy Path)
    Given customer đã đăng nhập và có sản phẩm trong giỏ
    When customer chọn phương thức thanh toán "Chuyển khoản"
    Then hệ thống hiển thị Modal mã QR đếm ngược 5 phút
    And sau khi khách bấm "Xác nhận đã chuyển", đơn hàng được tạo với trạng thái Chờ Duyệt

  Scenario: Đặt hàng thất bại do thiếu thông tin hoặc kho (Unhappy Path)
    Given customer đang ở màn hình Giỏ Hàng
    When customer nhấn nút Thanh Toán nhưng chưa chọn phương thức thanh toán
    Or customer cố tình gõ số lượng vượt quá tồn kho
    Then hệ thống hiển thị cảnh báo lỗi tương ứng và yêu cầu điều chỉnh lại


  # User Story 2: Giám Sát Hành Trình Đơn Hàng & Hủy Đơn
  # Là một khách hàng
  # Tôi muốn theo dõi trạng thái đơn hàng (Timeline) và đọc được giải trình từ Shop
  # Để nắm bắt được lý do đơn hàng bị thay đổi hoặc bị từ chối
  # Acceptance Criteria:
  # - Hiển thị Trạng thái chi tiết và "Lời xin lỗi/Giải trình" từ Admin nếu đơn bị hủy.
  # - Được phép hủy khi đơn còn ở trạng thái Chờ. Bắt buộc nhập lý do hủy.
  # - Đơn đã "Đang Giao" thì nút Hủy phải bị ẩn đi.

  Scenario: Hủy đơn hàng đang chờ duyệt (Happy Path)
    Given customer có một đơn hàng đang ở trạng thái "Chờ duyệt"
    When customer bấm Hủy và chọn lý do "Thay đổi ý định"
    Then đơn hàng chuyển thành "Chờ hoàn tiền" (nếu đã trả QR) hoặc "Đã Hủy"
    And số lượng tồn kho của sản phẩm được trả lại hệ thống ngay lập tức

  Scenario: Xem giải trình từ Shop khi đơn bị từ chối (Happy Path)
    Given một đơn hàng của khách bị Admin bấm "Từ chối do lỗi" kèm lời xin lỗi
    When khách hàng vào xem Lịch Sử Mua Hàng
    Then trạng thái đơn hàng hiển thị màu Đỏ (Hủy)
    And một khối thông báo "Giải trình từ Admin" xuất hiện chi tiết dưới đơn hàng đó

  Scenario: Không được phép hủy đơn khi đang trên đường giao (Unhappy Path)
    Given đơn hàng của khách đã được Admin bấm "Chấp nhận giao hàng"
    When khách hàng vào xem chi tiết đơn
    Then nút "Hủy Đơn" bị biến mất hoàn toàn để đảm bảo an toàn vận hành


  # User Story 3: Hồ Sơ Tài Khoản & Cảnh Báo Sẹo Gian Lận
  # Là một khách hàng
  # Tôi muốn xem tình trạng "Sức khỏe" tài khoản của mình
  # Để biết mình có đang bị gậy cảnh báo nào vì bom hàng hay không
  # Acceptance Criteria:
  # - Hiển thị số lượng "Bom hàng" (Strikes) ngay tại trang Profile dưới dạng badge màu.
  # - Badge biến mất hoặc ẩn đi nếu người dùng không đăng nhập được.

  Scenario: Kiểm tra tình trạng thẻ phạt tài khoản (Happy Path)
    Given customer vào trang Thông tin cá nhân
    When hệ thống kiểm tra mảng bomCount trong database
    Then hiển thị chỉ số "Số lần Boom hàng: X/2" (X là số lần vi phạm)
    And nếu X=1, hiện badge cảnh báo màu Vàng: "Cảnh báo (1/2 sẹo)"
    And nếu X=0, hiện badge an toàn màu Xanh: "Uy tín (0/2)"


  # User Story 4: Tìm Kiếm & Bộ Lọc Nâng Cao (Dự phòng)
  # Là một khách hàng
  # Tôi muốn lọc sản phẩm theo danh mục và sắp xếp theo giá cả
  # Để nhanh chóng tìm được món đồ phù hợp với túi tiền của mình
  # Acceptance Criteria:
  # - Cho phép lọc theo Categories (Bóng, Vợt, Quần áo, Giày, Khác).
  # - Cho phép Sort theo Giá tăng/giảm dần.

  Scenario: Tìm kiếm và lọc sản phẩm (Happy Path)
    Given khách đang ở trang chủ với hàng chục món đồ
    When khách chọn Filter "Bóng" và Sort "Giá từ thấp đến cao"
    Then màn hình chỉ hiển thị các loại bóng được xếp theo thứ tự giá rẻ nhất lên đầu



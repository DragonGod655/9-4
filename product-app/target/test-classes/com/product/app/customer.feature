Feature: customer người dùng có tài khoản

  # User Story:
  # Là một khách hàng đã đăng nhập
  # Tôi muốn chọn sản phẩm và đặt đơn hàng với phương thức thanh toán phù hợp
  # Để hoàn tất việc mua sắm và nhận xác nhận đơn hàng
  # Acceptance Criteria:
  # - Hệ thống hiển thị thông tin sản phẩm gồm: tên, giá, hình ảnh, mô tả
  # - Hệ thống cho phép chọn phương thức thanh toán: tiền mặt hoặc chuyển khoản
  # - Sau khi đặt hàng, đơn hàng có trạng thái "chờ thanh toán"
  Scenario: AC7 (happy path) Mua hàng và đặt đơn thành công
    Given customer đã đăng nhập và truy cập vào trang web
    When customer bấm vào một sản phẩm phù hợp
    Then hệ thống hiển thị thông tin sản phẩm gồm: tên, giá, hình ảnh, mô tả
    And customer bấm vào nút mua
    And hệ thống hiển thị các phương thức thanh toán: tiền mặt hoặc chuyển khoản
    And customer chọn phương thức thanh toán và bấm đặt hàng
    And hệ thống thông báo đơn hàng đang chờ thanh toán và xác nhận đơn hàng đã đặt thành công

  # User Story:
  # Là một khách hàng đã đăng nhập
  # Tôi muốn thực hiện thanh toán khi giỏ hàng trống
  # Để biết hệ thống sẽ thông báo lỗi và không cho phép thanh toán
  # Acceptance Criteria:
  # - Hệ thống hiển thị thông báo "Giỏ hàng trống" và không cho tiến hành thanh toán
  Scenario: AC7 (unhappy path) Thanh toán khi giỏ hàng trống
    Given customer đã đăng nhập nhưng giỏ hàng trống
    When customer thực hiện thanh toán
    Then hệ thống hiển thị thông báo giỏ hàng trống không thể thanh toán

  # User Story:
  # Là một khách hàng đã đăng nhập
  # Tôi muốn đặt mua một sản phẩm đã hết hàng
  # Để biết hệ thống sẽ thông báo không thể đặt đơn khi hết hàng
  # Acceptance Criteria:
  # - Hệ thống hiển thị thông báo "Sản phẩm đã hết hàng" và không tạo đơn hàng
  Scenario: AC7 (unhappy path) Đặt hàng khi sản phẩm hết hàng
    Given customer đã đăng nhập và truy cập vào trang web
    When customer bấm vào một sản phẩm và bấm nút mua
    But sản phẩm đó đã hết hàng
    Then hệ thống hiển thị thông báo sản phẩm đã hết hàng và không thể đặt đơn

  # User Story:
  # Là một khách hàng đã đăng nhập
  # Tôi muốn đặt hàng mà không chọn phương thức thanh toán
  # Để biết hệ thống sẽ yêu cầu chọn phương thức trước khi tạo đơn
  # Acceptance Criteria:
  # - Hệ thống thông báo yêu cầu chọn phương thức thanh toán và không tạo đơn hàng
  Scenario: AC7 (unhappy path) Đặt hàng khi không chọn phương thức thanh toán
    Given customer đã đăng nhập và truy cập vào trang web
    When customer bấm vào một sản phẩm phù hợp và bấm nút mua
    Then hệ thống hiển thị các phương thức thanh toán: tiền mặt hoặc chuyển khoản
    And customer bấm đặt hàng mà không chọn phương thức thanh toán
    And hệ thống hiển thị thông báo yêu cầu chọn phương thức thanh toán và không tạo đơn hàng

  # User Story:
  # Là một khách hàng đã đặt đơn
  # Tôi muốn hủy đơn hàng và cung cấp lý do hủy
  # Để nhận lại tiền hoàn trả khi không muốn mua nữa
  # Acceptance Criteria:
  # - Hệ thống hiển thị form chọn lý do hủy bắt buộc
  # - Sau khi chọn lý do, đơn hàng chuyển sang trạng thái "chờ xử lý hoàn tiền"
  # - Hệ thống xác nhận hủy đơn và thông báo đang xử lý hoàn tiền
  Scenario: AC8 (happy path) Hủy đặt hàng thành công
    Given customer đã đăng nhập và truy cập vào trang web
    When customer xem danh sách đơn hàng đã đặt
    And customer bấm vào nút hủy trên đơn hàng muốn hủy
    Then hệ thống hiển thị form yêu cầu chọn lý do hủy đơn hàng
    And customer chọn một lý do hủy bất kỳ
    And hệ thống cập nhật trạng thái đơn hàng thành "chờ xử lý hoàn tiền"
    And hệ thống xác nhận đơn hàng đã được hủy và đang xử lý hoàn tiền cho customer

  # User Story:
  # Là một khách hàng
  # Tôi muốn hủy đơn hàng nhưng không chọn lý do hủy
  # Để biết hệ thống sẽ yêu cầu bắt buộc phải chọn lý do trước khi hủy
  # Acceptance Criteria:
  # - Hệ thống không cho phép hủy đơn nếu chưa chọn lý do
  # - Hiển thị thông báo yêu cầu chọn lý do hủy
  Scenario: AC8 (unhappy path) Hủy đặt hàng thất bại khi không chọn lý do
    Given customer đã đăng nhập và có đơn hàng cần hủy
    When customer bấm vào nút hủy đơn hàng
    And customer không chọn lý do hủy và bấm xác nhận
    Then hệ thống hiển thị thông báo yêu cầu chọn lý do hủy và không thực hiện hủy đơn hàng

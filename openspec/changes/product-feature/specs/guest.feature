Feature: guest người chưa có tài khoản

  # User Story 1: Khám Phá Sản Phẩm Thể Thao
  # Là một khách vãng lai
  # Tôi muốn xem danh sách và chi tiết sản phẩm bằng giao diện Quick View
  # Để nhanh chóng nắm bắt các phụ kiện thể thao đang bán mà không cần đổi trang
  # Acceptance Criteria:
  # - Hiện danh sách đầy đủ khi vào trang. Hiện thông báo nếu kho trống.
  # - Bấm vào sản phẩm hiện Modal chi tiết ngay lập tức (Quick View).

  Scenario: Xem danh mục và chi tiết sản phẩm (Happy Path)
    Given guest truy cập vào trang SportsGear
    When guest xem danh sách sản phẩm hoặc bấm vào một món đồ bất kỳ
    Then hệ thống hiển thị danh sách hoặc bật Modal chi tiết sản phẩm (Quick View)

  Scenario: Hệ thống chưa có sản phẩm nào (Unhappy Path)
    Given guest truy cập nhưng database sản phẩm đang trống
    Then hệ thống hiển thị thông báo "Cửa hàng đang nhập hàng, vui lòng quay lại sau."


  # User Story 2: Giỏ Hàng Tạm Thời (Transient Cart)
  # Là một khách vãng lai
  # Tôi muốn có thể thêm sản phẩm vào giỏ hàng ngay lập tức mà không cần đăng nhập
  # Để lưu lại các món đồ ưa thích trong phiên làm việc hiện tại
  # Acceptance Criteria:
  # - Hệ thống cho phép "Cất giỏ" ngay cho khách vãng lai.
  # - Không cho phép "Thanh Toán" nếu chưa có tài khoản (bật modal Auth).

  Scenario: Thêm sản phẩm vào giỏ hàng tạm (Happy Path)
    Given guest đã chọn được một món đồ ưng ý
    When guest bấm "Cất giỏ"
    Then sản phẩm được thêm vào giỏ hàng tạm thời và cập nhật số lượng trên icon giỏ
    And hệ thống không yêu cầu đăng nhập ở bước này để tránh làm phiền khách

  Scenario: Cố tình thanh toán khi chưa đăng nhập (Unhappy Path)
    Given guest đã có đồ trong giỏ hàng tạm
    When guest nhấn nút "Thanh Toán" trong giỏ
    Then hệ thống chặn lại và yêu cầu Đăng Nhập hoặc Đăng Ký để tiếp tục


  # User Story 3: Đăng Ký Tài Khoản & Kiểm Soát Mật Mã
  # Là một khách vãng lai
  # Tôi muốn đăng ký tài khoản mới và có thể kiểm tra mật khẩu lúc gõ
  # Để đảm bảo thông tin chính xác và giỏ hàng tạm được lưu vào tài khoản mới
  # Acceptance Criteria:
  # - Cho phép bật/tắt hiển thị mật khẩu bằng icon "con mắt".
  # - Sau khi đăng ký thành công, toàn bộ giỏ hàng tạm trước đó phải được chuyển vào tài khoản mới.
  # - Báo lỗi nếu trùng Email hoặc Tên đăng nhập.

  Scenario: Đăng ký tài khoản thành công và hòa nhập giỏ hàng (Happy Path)
    Given guest có 3 sản phẩm trong giỏ hàng tạm
    When guest đăng ký tài khoản mới với thông tin hợp lệ
    Then tài khoản được tạo thành công
    And 3 sản phẩm kia tự động được chuyển vào giỏ hàng chính thức của tài khoản vừa tạo

  Scenario: Đăng ký thất bại do trùng thông tin (Unhappy Path)
    Given một email đã được sử dụng trước đó
    When guest cố tình đăng ký bằng email cũ đó
    Then hệ thống báo lỗi "Email đã tồn tại" và giữ nguyên màn hình đăng ký


  # User Story 4: Đăng Nhập Hệ Thống Đa Năng
  # Là một người dùng (Khách/Admin)
  # Tôi muốn đăng nhập vào hệ thống qua các cổng bảo mật tương ứng
  # Để thực hiện quyền hạn của mình
  # Acceptance Criteria:
  # - Khách đăng nhập vào cổng thường, Admin đăng nhập cổng riêng.
  # - Báo lỗi nếu sai pass hoặc tài khoản bị Ban.

  Scenario: Đăng nhập vào hệ thống (Happy Path)
    Given người dùng đã có tài khoản (Customer hoặc Admin)
    When nhập đúng thông tin tại cổng đăng nhập tương ứng
    Then hệ thống cấp quyền truy cập và hiển thị giao diện phù hợp

  Scenario: Đăng nhập thất bại (Unhappy Path)
    Given một tài khoản đang bị trạng thái "BỊ PHONG SÁT"
    When người dùng cố gắng đăng nhập
    Then hệ thống từ chối và hiển thị thông báo "Tài khoản bị cấm do vi phạm chính sách"


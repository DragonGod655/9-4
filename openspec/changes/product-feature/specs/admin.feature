Feature: admin quản lý hệ thống

  # User Story 1: Quản lý Sản Phẩm
  # Là một quản trị viên
  # Tôi muốn toàn quyền quản lý danh mục sản phẩm (thêm, sửa, xóa, tồn kho thủ công)
  # Để đưa hàng hóa lên kệ bán một cách chính xác
  # Acceptance Criteria:
  # - Thêm/sửa thành công khi nhập đủ thông tin và thất bại khi thiếu
  # - Xóa thành công nếu sản phẩm chưa phát sinh đơn hàng, ngược lại thì báo lỗi
  # - Lưu thông số Tồn Kho hiển thị thẳng ra cho khách

  Scenario: Thêm sản phẩm thành công (Happy Path)
    Given admin đã đăng nhập
    When admin thêm sản phẩm mới
    Then hệ thống lưu sản phẩm thành công

  Scenario: Thêm sản phẩm nhưng thiếu tên hoặc giá (Unhappy Path)
    Given admin đã đăng nhập
    When admin thêm sản phẩm nhưng thiếu tên hoặc giá
    Then hệ thống hiển thị lỗi và không lưu sản phẩm

  Scenario: Sửa sản phẩm thành công (Happy Path)
    Given admin đã đăng nhập
    When admin chỉnh sửa thông tin sản phẩm bằng dữ liệu hợp lệ
    Then hệ thống cập nhật sản phẩm

  Scenario: Sửa sản phẩm thất bại (Unhappy Path)
    Given admin đã đăng nhập
    When admin nhập thông tin sản phẩm không hợp lệ
    Then hệ thống báo lỗi và không cập nhật sản phẩm

  Scenario: Định mức tồn kho thủ công (Happy Path)
    Given admin mở bảng tùy chỉnh của một món đồ thể thao
    When admin gõ số lượng tồn kho và bấm Lưu Lại
    Then sản phẩm ngay lập tức cập nhật ngưỡng tồn kho và sẵn sàng bán trên kệ

  Scenario: Xóa sản phẩm thành công (Happy Path)
    Given admin đã đăng nhập
    When admin xóa sản phẩm chưa có trong đơn hàng nào
    Then sản phẩm bị xóa khỏi hệ thống

  Scenario: Xóa sản phẩm đang vướng đơn hàng (Unhappy Path)
    Given admin đã đăng nhập
    When admin cố ý xóa sản phẩm đang nằm trong một đơn hàng
    Then hệ thống hiển thị lỗi ngăn chặn vì sản phẩm đang trong đơn


  # User Story 2: Quyền Lực Xử Vi Phạm Thần Dân
  # Là một quản trị viên
  # Tôi muốn được sử dụng công cụ Tổng Trạm Sinh Tử Khách Hàng
  # Để thiết lập trật tự kỷ cương trên nền tảng, thanh trừng tài khoản vi phạm
  # Acceptance Criteria:
  # - Xử tử hình (Ban) vĩnh viễn user ngay lập tức không cần lý do.
  # - Ban tự động tài khoản nếu xác nhận khách đó "Bom hàng" đủ 2 lần.
  # - Admin có quyền "Ân xá" cho tài khoản bị ban, reset chỉ số Bom Hàng về 0.

  Scenario: Ban tài khoản vĩnh viễn theo uy quyền Vua (Happy Path)
    Given admin truy cập vào Tổng Trạm Sinh Tử Khách Hàng
    When admin chọn nút BAN Tử Hình ở một tài khoản bất kỳ
    Then tài khoản lập tức bị khóa vĩnh viễn và bị chặn Login

  Scenario: Ân xá tài khoản theo uy quyền Vua (Happy Path)
    Given một tài khoản đã bị khóa vĩnh viễn và bị chặn Login
    When admin đánh dấu "Khách Bom hàng" cho tài khoản vi phạm trên 2 lần
    Then hệ thống thu hồi tồn kho và lập tức từ chối quyền Đăng nhập của khách đó vĩnh viễn

  Scenario: Ghi nhận Bom Hàng và Khóa Tài khoản tự động (Happy Path)
    Given một đơn hàng đang giao nhưng bị từ chối nhận sai trái
    When admin đánh dấu "Khách Bom hàng" cho tài khoản vi phạm trên 2 lần
    Then hệ thống thu hồi tồn kho và lập tức từ chối quyền Đăng nhập của khách đó vĩnh viễn

  Scenario: Ân xá tài khoản theo uy quyền Vua (Happy Path)
    Given một tài khoản đang bị khóa (Ban)
    When admin chọn nút Ân Xá (Gỡ Ban) cho tài khoản đó
    Then tài khoản lập tức được mở khóa và có thể đăng nhập lại
    And chỉ số Bom Hàng của tài khoản đó được reset về 0


  # User Story 3: Giám Sát và Điều Phối Đơn Hàng
  # Là một quản trị viên
  # Tôi muốn điều hướng và giám sát vòng chu trình sinh mệnh của các đơn hàng
  # Để giao dịch lưu thông trơn tru từ khi nhận đơn đến lúc kết thúc viên mãn
  # Acceptance Criteria:
  # - Đơn lên phải xem/duyệt/từ chối được. Từ chối bắt buộc có lời xin lỗi.
  # - Chốt sổ "Giao Thành Công" khi đã hoàn tất.
  # - Có thể quét dọn dữ liệu rớt/hủy để làm nhẹ hệ thống, nhưng cấm xóa đơn đang chờ.

  Scenario: Xem danh sách tổng quan đơn hàng (Happy Path)
    Given admin đã đăng nhập
    When admin mở trang Bảng Điều Khiển Đơn Hàng
    Then hệ thống hiển thị danh sách đơn hàng sắp xếp theo ngày giờ

  Scenario: Thông báo không có đơn hàng nào (Unhappy Path)
    Given admin đã đăng nhập
    When hệ thống database bị trống hoặc vừa Quét Sạch
    Then hệ thống hiển thị thông báo "Chưa có đơn hàng nào."

  Scenario: Xác nhận và duyệt Đơn Hàng mới (Happy Path)
    Given một đơn hàng mang trạng thái Chờ duyệt
    When admin bấm Xác nhận Chấp nhận giao hàng
    Then hệ thống đổi nhãn đơn hàng thành Đang giao

  Scenario: Đóng sổ kết thúc vòng đời đơn hàng (Happy Path)
    Given một đơn hàng đang trong quá trình chuyển phát (Đang giao)
    When admin ấn nút xác nhận Khách đã nhận tận tay
    Then trạng thái sẽ đổi màu thành Giao Thành Công rực rỡ

  Scenario: Admin Hủy đơn kèm Lời giải trình (Happy Path)
    Given admin phát hiện đơn hàng bị trục trặc
    When admin bấm Từ chối đơn và nhập Lời xin lỗi
    Then đơn hàng chuyển sang trạng thái Hủy, lời xin lỗi được lưu và tồn kho nhả lại kho

  Scenario: Dọn dẹp sạch sẽ lịch sử nhưng bảo vệ đơn hoạt động (Happy Path)
    Given admin đang duyệt danh sách Trạm Sinh Tử
    When admin chọn nút Quét Sạch dữ liệu rác
    Then các đơn kết thúc (Giao xong/Hủy bỏ) sẽ bị dọn bay
    And các đơn đang dang dở tiến trình sẽ vẫn hiển thị bình yên


  # User Story 4: Quản Trị Tồn Kho Tự Động Toàn Hệ Thống
  # Là một quản trị viên
  # Tôi muốn kho lưu trữ hàng hóa vận hành trừ/cộng tự động khép kín
  # Để tránh việc bán quá số lượng có sẵn gây bể vỡ uy tín
  # Acceptance Criteria:
  # - Hàng tự trừ đi ở kho khi chốt thanh toán, và nếu hết thì chặn khách bấm thêm.

  Scenario: Trừ Tồn Kho tự động lúc mua (Happy Path)
    Given một sản phẩm đang có sẵn số lượng lớn
    When khách hàng tiến hành chốt và đặt hàng
    Then hệ thống lập tức trừ đi đúng số lượng mua khỏi tổng tồn kho của món đó

  Scenario: Khách hàng ngoan cố mua sản phẩm khi đã cạn kho (Unhappy Path)
    Given một sản phẩm đã chạm mức 0 tồn kho
    When khách hàng cố gắng ấn nút Mua hoặc Thêm Giỏ
    Then hệ thống giơ biển đỏ chặn lại và thông báo từ chối

  
  # User Story 5: Xử Lý Biến Cố Tài Chính
  # Là quản trị viên
  # Tôi muốn có công cụ hoàn tiền thủ công cho các đơn đã thanh toán trước nhưng bị rớt đài
  # Để khắc phục khắc phục hậu quả đền bù cho khách
  # Acceptance Criteria:
  # - Bấm hoàn tiền thì đơn đổi sang Đã hoàn tiền thành công.

  Scenario: Xác nhận Hoàn trả tiền tệ cho đơn hủy (Happy Path)
    Given một đơn hàng đang ở trạng thái "Chờ xử lý hoàn tiền"
    When admin bấm nút Xác nhận chuyển khoản tay
    Then hệ thống gạch sổ nợ và cập nhật trạng thái "Đã hoàn tiền thành công"


  # User Story 6: Cổng Bảo Mật Độc Bản
  # Là một quản trị viên
  # Tôi muốn mọi tác vụ quan trọng phải qua một bức tường thành đăng nhập riêng
  # Để tách biệt dân thường khỏi công cụ quản trị
  # Acceptance Criteria:
  # - Form đăng nhập Admin khác form Khách hàng, yêu cầu mật mã cố định.

  Scenario: Vượt tường thành cổng Quản Trị (Happy Path)
    Given khách hoặc admin đang ở giao diện chính
    When chọn Đăng Nhập Cổng Admin và nhập mã "admin123"
    Then quyền lực Vua Hàng Hóa được bật mở và load giao diện tổng trạm

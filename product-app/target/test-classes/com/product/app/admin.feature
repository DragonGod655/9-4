Feature: admin quản lý hệ thống

  # User Story:
  # Là một quản trị viên
  # Tôi muốn thêm sản phẩm mới vào hệ thống với đầy đủ thông tin
  # Để cập nhật danh mục hàng hóa cho khách hàng
  # Acceptance Criteria:
  # - Sản phẩm được lưu thành công khi nhập đầy đủ tên, giá và thông tin hợp lệ
  Scenario: AC1 (happy path) Thêm sản phẩm thành công
    Given admin đã đăng nhập
    When admin thêm sản phẩm mới
    Then hệ thống lưu sản phẩm thành công

  # User Story:
  # Là một quản trị viên
  # Tôi muốn thêm sản phẩm nhưng bỏ trống tên hoặc giá
  # Để biết hệ thống sẽ báo lỗi và không lưu khi thiếu thông tin
  # Acceptance Criteria:
  # - Hệ thống hiển thị lỗi cho trường bỏ trống và không lưu sản phẩm
  Scenario: AC1 (unhappy path) Thêm sản phẩm thất bại khi thiếu thông tin
    Given admin đã đăng nhập
    When admin thêm sản phẩm nhưng thiếu tên hoặc giá
    Then hệ thống hiển thị lỗi và không lưu sản phẩm

  # User Story:
  # Là một quản trị viên
  # Tôi muốn chỉnh sửa thông tin sản phẩm đã có với dữ liệu hợp lệ
  # Để cập nhật giá, mô tả hoặc hình ảnh khi cần thiết
  # Acceptance Criteria:
  # - Hệ thống cập nhật và lưu thông tin sản phẩm mới khi dữ liệu hợp lệ
  Scenario: AC2 (happy path) Sửa sản phẩm thành công
    Given admin đã đăng nhập
    When admin chỉnh sửa thông tin sản phẩm
    Then hệ thống cập nhật sản phẩm

  # User Story:
  # Là một quản trị viên
  # Tôi muốn sửa sản phẩm nhưng nhập thông tin không hợp lệ
  # Để biết hệ thống sẽ báo lỗi và không cập nhật khi dữ liệu sai
  # Acceptance Criteria:
  # - Hệ thống hiển thị thông báo lỗi và không cập nhật sản phẩm khi dữ liệu không hợp lệ
  Scenario: AC2 (unhappy path) Sửa sản phẩm thất bại
    Given admin đã đăng nhập
    When admin nhập thông tin sản phẩm không hợp lệ
    Then hệ thống báo lỗi và không cập nhật sản phẩm

  # User Story:
  # Là một quản trị viên
  # Tôi muốn xóa sản phẩm không còn kinh doanh khỏi hệ thống
  # Để dọn sạch danh mục và tránh nhầm lẫn cho khách hàng
  # Acceptance Criteria:
  # - Sản phẩm bị xóa hoàn toàn khỏi hệ thống nếu chưa có trong đơn hàng nào
  Scenario: AC3 (happy path) Xóa sản phẩm thành công
    Given admin đã đăng nhập
    When admin xóa sản phẩm chưa có trong đơn hàng nào
    Then sản phẩm bị xóa khỏi hệ thống

  # User Story:
  # Là một quản trị viên
  # Tôi muốn xóa sản phẩm đang nằm trong đơn hàng
  # Để biết hệ thống sẽ ngăn chặn và báo lỗi khi sản phẩm đang được sử dụng
  # Acceptance Criteria:
  # - Hệ thống không cho xóa và hiển thị lỗi khi sản phẩm đang có trong đơn hàng
  Scenario: AC3 (unhappy path) Xóa sản phẩm đang có trong đơn hàng
    Given admin đã đăng nhập
    When admin xoa san pham khi dang giao hoac khong ton tai
    Then hệ thống hiển thị lỗi không thể xóa sản phẩm đang trong đơn hàng

  # User Story:
  # Là một quản trị viên
  # Tôi muốn thêm, sửa hoặc xóa danh mục sản phẩm với thông tin hợp lệ
  # Để tổ chức sản phẩm theo nhóm giúp khách hàng tìm kiếm dễ hơn
  # Acceptance Criteria:
  # - Hệ thống cập nhật danh mục thành công khi thông tin nhập vào hợp lệ
  Scenario: AC4 (happy path) Quản lý danh mục thành công
    Given admin đã đăng nhập
    When admin thêm hoặc sửa hoac xoa danh muc
    Then hệ thống cập nhật danh mục

  # User Story:
  # Là một quản trị viên
  # Tôi muốn thêm hoặc sửa danh mục với tên đã tồn tại trong hệ thống
  # Để biết hệ thống sẽ báo lỗi trùng danh mục và không lưu
  # Acceptance Criteria:
  # - Hệ thống hiển thị lỗi "Trùng danh mục" và không lưu thay đổi
  Scenario: AC4 (unhappy path) Thêm danh mục bị trùng
    Given admin đã đăng nhập
    When admin thêm hoac sua danh muc bi trung thong tin
    Then hệ thống hiển thị lỗi trùng danh mục

  # User Story:
  # Là một quản trị viên
  # Tôi muốn xem và chỉnh sửa thông tin người dùng hợp lệ
  # Để quản lý tài khoản khách hàng trong hệ thống
  # Acceptance Criteria:
  # - Hệ thống lưu thay đổi thông tin user khi dữ liệu hợp lệ
  Scenario: AC5 (happy path) Quản lý user thành công
    Given admin đã đăng nhập
    When admin xem thong tin hoặc chỉnh sửa user
    Then hệ thống lưu thay đổi user

  # User Story:
  # Là một quản trị viên
  # Tôi muốn chỉnh sửa thông tin của user không tồn tại trong hệ thống
  # Để biết hệ thống sẽ báo lỗi và không lưu thay đổi
  # Acceptance Criteria:
  # - Hệ thống hiển thị lỗi khi user không tồn tại và không thực hiện lưu
  Scenario: AC5 (unhappy path) Chỉnh sửa user không tồn tại
    Given admin đã đăng nhập
    When admin chỉnh sửa user không tồn tại
    Then hệ thống hiển thị lỗi va khong luu user

  # User Story:
  # Là một quản trị viên
  # Tôi muốn xóa tài khoản của người dùng đã từng đặt hàng
  # Để biết hệ thống sẽ ngăn chặn và báo lỗi khi tài khoản có liên kết đơn hàng
  # Acceptance Criteria:
  # - Hệ thống không cho xóa và hiển thị lỗi khi user có lịch sử đơn hàng
  Scenario: AC5 (unhappy path) Xóa user đã có đơn hàng
    Given admin đã đăng nhập
    When admin xóa tài khoản người dùng đã từng đặt hàng
    Then hệ thống hiển thị lỗi không thể xóa tài khoản đã có đơn hàng

  # User Story:
  # Là một quản trị viên
  # Tôi muốn xem toàn bộ danh sách đơn hàng của khách hàng
  # Để theo dõi và xử lý các đơn hàng theo thứ tự ngày mua
  # Acceptance Criteria:
  # - Hệ thống hiển thị đầy đủ danh sách đơn hàng, sắp xếp theo ngày mua mới nhất
  Scenario: AC6 (happy path) Xem danh sách đơn hàng
    Given admin đã đăng nhập
    When admin mở trang đơn hàng
    Then hệ thống hiển thị danh sách đơn hàng sắp xếp theo ngày mua

  # User Story:
  # Là một quản trị viên
  # Tôi muốn mở trang đơn hàng khi không có đơn hàng hoặc đã bị xóa
  # Để biết hệ thống sẽ thông báo không có đơn hàng nào
  # Acceptance Criteria:
  # - Hệ thống hiển thị thông báo "Không có đơn hàng" thay vì trang trống
  Scenario: AC6 (unhappy path) Không có đơn hàng nào
    Given admin đã đăng nhập
    When admin mở trang đơn hàng da bi xoa
    Then hệ thống hiển thị thông báo không có đơn hàng

  # User Story:
  # Là một quản trị viên
  # Tôi muốn cập nhật số lượng sản phẩm trong đơn hàng đang xử lý
  # Để điều chỉnh đơn hàng khi có thay đổi từ phía khách hàng
  # Acceptance Criteria:
  # - Hệ thống lưu số lượng mới và cập nhật tổng tiền đơn hàng tương ứng
  Scenario: AC6 (happy path) Cập nhật số lượng mặt hàng trong đơn hàng
    Given admin đã đăng nhập
    When admin cập nhật số lượng sản phẩm trong đơn hàng trực tuyến
    Then hệ thống lưu thay đổi số lượng trong đơn hàng

  # User Story: Bom hàng - Ban vĩnh viễn
  # Là một quản trị viên
  # Tôi muốn ghi nhận các đơn hàng bị bom và tự động khóa tài khoản khách hàng khi vi phạm 2 lần
  # Để bảo vệ hệ thống khỏi những người dùng không uy tín
  # Acceptance Criteria:
  # - Hệ thống ghi nhận số lần bom hàng và khóa tài khoản vĩnh viễn khi đạt ngưỡng 2 lần
  Scenario: AC7 (happy path) Ghi nhận bom hàng và tự động ban khi đủ 2 lần
    Given admin đang xem đơn hàng ở trạng thái "Đang giao"
    When admin nhấn ghi nhận bom hàng lần thứ 1
    Then hệ thống tăng số gậy cảnh cáo của khách lên 1
    When admin tiếp tục ghi nhận bom hàng lần thứ 2 cho khách đó
    Then hệ thống tự động khóa tài khoản khách hàng vĩnh viễn

  # User Story: Kiểm soát đăng nhập của tài khoản bị ban
  # Là hệ thống
  # Tôi muốn chặn các tài khoản đã bị ban không cho phép đăng nhập
  # Để đảm bảo quy định của cửa hàng được thực thi
  # Acceptance Criteria:
  # - Hệ thống hiển thị thông báo lỗi và từ chối truy cập khi tài khoản bị ban đăng nhập
  Scenario: AC7 (unhappy path) Đăng nhập thất bại khi tài khoản bị ban
    Given tài khoản khách hàng đã bị ban vĩnh viễn
    When người dùng đăng nhập vào tài khoản đã bị ban
    Then hệ thống hiển thị thông báo "TÀI KHOẢN NÀY ĐÃ BỊ CẤM VĨNH VIỄN" và từ chối truy cập

  # User Story: Quyền ban thủ công và ân xá
  # Là một quản trị viên
  # Tôi muốn có quyền ban trực tiếp hoặc ân xá cho người dùng
  # Để linh hoạt trong việc quản trị cộng đồng khách hàng
  # Acceptance Criteria:
  # - Admin có thể ban ngay lập tức hoặc gỡ ban và reset số lần vi phạm
  Scenario: AC7 (happy path) Admin ban trực tiếp hoặc ân xá cho người dùng
    Given admin đang xem danh sách khách hàng
    When admin nhấn nút ban tử hình một khách hàng
    Then tài khoản khách hàng bị khóa ngay lập tức
    When admin nhấn nút ân xá cho một khách hàng đang bị ban
    Then hệ thống gỡ ban và reset số lần bom hàng của khách về 0

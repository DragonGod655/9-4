Feature: guest người chưa có tài khoản

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn xem danh sách sản phẩm khi vào trang web
  # Để biết cửa hàng đang bán những dụng cụ thể thao nào
  # Acceptance Criteria:
  # - Hệ thống hiển thị danh sách tất cả sản phẩm khi guest truy cập trang web
  # - Mỗi sản phẩm hiển thị tên, hình ảnh và giá cơ bản
  Scenario: AC1 (happy path) Xem danh sách sản phẩm
    Given guest đã truy cập trang web
    When guest xem danh sách sản phẩm
    Then hệ thống hiển thị danh sách sản phẩm

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn xem danh sách sản phẩm khi vào trang web
  # Để biết nếu hệ thống không có sản phẩm thì sẽ thông báo ra sao
  # Acceptance Criteria:
  # - Hệ thống hiển thị thông báo rõ ràng khi không có sản phẩm nào trong danh mục
  Scenario: AC1 (unhappy path) Không có sản phẩm nào
    Given guest đã truy cập trang web
    When guest xem danh sách sản phẩm nhưng hệ thống không có sản phẩm
    Then hệ thống hiển thị thông báo không có sản phẩm nào

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn bấm vào một sản phẩm để xem thông tin chi tiết
  # Để biết tên, giá, hình ảnh và mô tả của sản phẩm đó
  # Acceptance Criteria:
  # - Hệ thống hiển thị đầy đủ: tên, giá bán, hình ảnh và mô tả sản phẩm
  # - Hiển thị nút "Thêm vào giỏ hàng" và nút "Mua"
  Scenario: AC2 (happy path) Xem chi tiết sản phẩm
    Given guest đã truy cập vào trang web
    When guest bấm vào một sản phẩm phù hợp
    Then hệ thống hiển thị chi tiết thông tin sản phẩm

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn bấm vào sản phẩm để xem chi tiết
  # Để biết hệ thống xử lý thế nào khi sản phẩm không còn tồn tại
  # Acceptance Criteria:
  # - Hệ thống hiển thị thông báo sản phẩm không tồn tại thay vì trang lỗi
  Scenario: AC2 (unhappy path) Xem chi tiết sản phẩm không tồn tại
    Given guest đã truy cập trang web
    When guest chọn xem chi tiết sản phẩm không tồn tại
    Then hệ thống hiển thị thông báo sản phẩm không tồn tại

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn thêm sản phẩm vào giỏ hàng sau khi xem
  # Để lưu sản phẩm và mua sau khi đăng nhập hoặc đăng ký
  # Acceptance Criteria:
  # - Khi bấm thêm giỏ hàng, hệ thống bắt buộc phải đăng nhập hoặc đăng ký
  # - Sau khi đăng nhập/đăng ký thành công, sản phẩm được thêm vào giỏ
  Scenario: AC3 (happy path) Thêm sản phẩm vào giỏ hàng
    Given guest đã truy cập vào trang web
    And guest bấm vào một sản phẩm phù hợp
    And hệ thống hiển thị thông tin giá, tên, hình ảnh phù hợp
    When guest bấm thêm giỏ hàng
    Then hệ thống hiển thị phần đăng nhập đăng ký và bắt buộc người dùng đăng nhập hoặc đăng ký
    And hệ thống thông báo đăng nhập hoặc đăng ký thành công
    And guest ấn vào nút thêm giỏ hàng
    And sản phẩm sẽ được thêm vào giỏ hàng thành công

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn thêm sản phẩm vào giỏ hàng
  # Để biết hệ thống xử lý thế nào khi sản phẩm không còn tồn tại
  # Acceptance Criteria:
  # - Hệ thống thông báo sản phẩm không tồn tại và không thêm vào giỏ hàng
  Scenario: AC3 (unhappy path) Thêm sản phẩm không tồn tại vào giỏ
    Given guest đã truy cập trang sản phẩm
    When guest chọn mua sản phẩm không tồn tại
    Then hệ thống hiển thị thông báo không có sản phẩm

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn bấm vào giỏ hàng để xem các sản phẩm đã chọn
  # Để kiểm tra lại trước khi mua và cần đăng nhập để xem được
  # Acceptance Criteria:
  # - Khi bấm vào giỏ hàng, hệ thống yêu cầu đăng nhập/đăng ký bắt buộc
  # - Sau khi đăng nhập thành công, hiển thị danh sách sản phẩm trong giỏ
  Scenario: AC4 (happy path) Xem giỏ hàng có sản phẩm
    Given guest đã truy cập vào trang web
    When guest bấm vào giỏ hàng
    Then hệ thống hiển thị phần đăng nhập đăng ký và bắt buộc người dùng nhập thông tin hợp lệ
    And guest đăng nhập hoặc đăng ký thành công
    And guest bấm vào giỏ hàng
    And hệ thống hiển thị danh sách sản phẩm có trong giỏ hàng

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn bấm vào giỏ hàng khi chưa đăng nhập
  # Để biết hệ thống sẽ yêu cầu đăng nhập trước khi cho xem giỏ hàng
  # Acceptance Criteria:
  # - Hệ thống không cho phép xem giỏ hàng khi chưa đăng nhập
  # - Hiển thị yêu cầu đăng nhập hoặc đăng ký rõ ràng
  Scenario: AC4 (unhappy path) Xem giỏ hàng khi chưa đăng nhập
    Given guest đã truy cập vào trang web
    When guest bấm vào giỏ hàng nhưng chưa đăng nhập
    Then hệ thống hiển thị yêu cầu đăng nhập hoặc đăng ký và không cho phép xem giỏ hàng

  # User Story:
  # Là một khách đã đăng nhập
  # Tôi muốn chỉnh sửa số lượng sản phẩm trong giỏ hàng
  # Để điều chỉnh số lượng phù hợp trước khi mua
  # Acceptance Criteria:
  # - Hệ thống cập nhật và lưu số lượng mới khi nhập giá trị hợp lệ
  Scenario: AC5 (happy path) Cập nhật số lượng sản phẩm trong giỏ
    Given guest đã có sản phẩm trong giỏ hàng session
    When guest chỉnh sửa số lượng sản phẩm thành số hợp lệ
    Then hệ thống cập nhật số lượng sản phẩm trong session

  # User Story:
  # Là một khách đã đăng nhập
  # Tôi muốn đặt số lượng sản phẩm thành 0
  # Để xóa sản phẩm đó khỏi giỏ hàng một cách nhanh chóng
  # Acceptance Criteria:
  # - Khi số lượng = 0, hệ thống tự động xóa sản phẩm khỏi giỏ hàng
  Scenario: AC5 (happy path) Xóa sản phẩm khỏi giỏ khi đặt số lượng bằng 0
    Given guest đã có sản phẩm trong giỏ hàng session
    When guest chỉnh sửa số lượng sản phẩm thành 0
    Then hệ thống xóa sản phẩm đó khỏi giỏ hàng trong session

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn đăng ký tài khoản mới bằng email và thông tin hợp lệ
  # Để có thể đăng nhập và mua hàng trên hệ thống
  # Acceptance Criteria:
  # - Tài khoản mới được lưu vào CSDL khi email chưa tồn tại và thông tin hợp lệ
  # - Hệ thống gửi email thông báo đăng ký thành công
  Scenario: AC6 (happy path) Đăng ký tài khoản thành công
    Given guest chưa có tài khoản
    When guest đăng ký với email chưa tồn tại và thông tin hợp lệ
    Then hệ thống lưu tài khoản mới vào CSDL và gửi email thông báo

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn đăng ký tài khoản bằng email đã được dùng trước đó
  # Để biết hệ thống xử lý lỗi trùng email như thế nào
  # Acceptance Criteria:
  # - Hệ thống hiển thị lỗi "Email đã tồn tại" và không lưu tài khoản mới
  Scenario: AC6 (unhappy path) Đăng ký với email đã tồn tại
    Given guest chưa có tài khoản
    When guest đăng ký với email đã được đăng ký trước đó
    Then hệ thống hiển thị lỗi email đã tồn tại và không lưu tài khoản

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn đăng ký tài khoản nhưng bỏ trống thông tin bắt buộc
  # Để biết hệ thống sẽ thông báo lỗi khi thiếu thông tin
  # Acceptance Criteria:
  # - Hệ thống hiển thị thông báo lỗi cho từng trường bắt buộc bị bỏ trống
  # - Không lưu tài khoản khi thiếu thông tin
  Scenario: AC6 (unhappy path) Đăng ký với thông tin không hợp lệ
    Given guest chưa có tài khoản
    When guest đăng ký nhưng bỏ trống các trường bắt buộc
    Then hệ thống hiển thị lỗi thiếu thông tin và không lưu tài khoản

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn đăng ký/đăng nhập nhanh bằng tài khoản Google
  # Để không cần nhập thông tin thủ công và được tự động đăng nhập ngay sau khi xác thực
  # Acceptance Criteria:
  # - Hệ thống hiển thị popup xác thực Google khi bấm nút "Google"
  # - Sau khi xác thực thành công, hệ thống tự động tạo tài khoản (nếu chưa có) và đăng nhập luôn
  # - Giao diện cập nhật hiển thị tên người dùng từ Google
  Scenario: AC7 (happy path) Đăng ký và tự động đăng nhập bằng Google thành công
    Given guest đã truy cập vào trang web
    When guest bấm vào nút đăng nhập
    And guest chọn đăng nhập bằng Google
    Then hệ thống hiển thị popup xác thực Google
    And guest xác nhận cho phép truy cập tài khoản Google
    And hệ thống tự động tạo tài khoản mới và đăng nhập thành công
    And giao diện hiển thị tên người dùng từ Google và trạng thái đã đăng nhập

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn đăng ký/đăng nhập nhanh bằng tài khoản Facebook
  # Để không cần nhập thông tin thủ công và được tự động đăng nhập ngay sau khi xác thực
  # Acceptance Criteria:
  # - Hệ thống hiển thị popup xác thực Facebook khi bấm nút "Facebook"
  # - Sau khi xác thực thành công, hệ thống tự động tạo tài khoản (nếu chưa có) và đăng nhập luôn
  # - Giao diện cập nhật hiển thị tên người dùng từ Facebook
  Scenario: AC7 (happy path) Đăng ký và tự động đăng nhập bằng Facebook thành công
    Given guest đã truy cập vào trang web
    When guest bấm vào nút đăng nhập
    And guest chọn đăng nhập bằng Facebook
    Then hệ thống hiển thị popup xác thực Facebook
    And guest xác nhận cho phép truy cập tài khoản Facebook
    And hệ thống tự động tạo tài khoản mới và đăng nhập thành công
    And giao diện hiển thị tên người dùng từ Facebook và trạng thái đã đăng nhập

  # User Story:
  # Là một khách chưa có tài khoản
  # Tôi muốn đăng nhập bằng Google hoặc Facebook nhưng từ chối cấp quyền truy cập
  # Để biết hệ thống xử lý thế nào khi người dùng hủy xác thực mạng xã hội
  # Acceptance Criteria:
  # - Hệ thống không tạo tài khoản và không đăng nhập khi người dùng từ chối
  # - Quay lại trang đăng nhập ban đầu
  Scenario: AC7 (unhappy path) Đăng nhập mạng xã hội thất bại khi từ chối cấp quyền
    Given guest đã truy cập vào trang web
    When guest bấm vào nút đăng nhập
    And guest chọn đăng nhập bằng Google hoặc Facebook
    And hệ thống hiển thị popup xác thực mạng xã hội
    But guest bấm hủy và từ chối cấp quyền truy cập
    Then hệ thống không tạo tài khoản và không đăng nhập
    And hệ thống quay lại trang đăng nhập ban đầu

  # User Story:
  # Là một khách có tài khoản đã bị cấm
  # Tôi muốn đăng nhập lại bằng Google hoặc Facebook
  # Để biết hệ thống có cho phép đăng nhập khi tài khoản đã bị khóa không
  # Acceptance Criteria:
  # - Hệ thống nhận diện tài khoản bị cấm và từ chối đăng nhập
  # - Hiển thị thông báo tài khoản đã bị khóa
  Scenario: AC7 (unhappy path) Đăng nhập mạng xã hội thất bại khi tài khoản bị cấm
    Given guest có tài khoản đã bị cấm trên hệ thống
    When guest bấm vào nút đăng nhập
    And guest chọn đăng nhập bằng Google hoặc Facebook
    And hệ thống hiển thị popup xác thực mạng xã hội
    And guest xác nhận cho phép truy cập tài khoản
    Then hệ thống nhận diện tài khoản đã bị cấm và từ chối đăng nhập
    And hệ thống hiển thị thông báo tài khoản đã bị khóa

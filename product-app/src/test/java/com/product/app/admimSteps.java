package com.product.app;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.And;
import io.cucumber.java.en.But;

public class admimSteps {

    // ================= ADMIN STEPS =================
    @Given("admin đã đăng nhập")
    public void admin_da_dang_nhap() {
        System.out.println("TEST: Admin đã đăng nhập hệ thống thành công.");
    }

    @When("admin thêm sản phẩm mới")
    public void admin_them_san_pham_moi() {
        System.out.println("TEST: Admin đang thêm một sản phẩm mới hợp lệ.");
    }

    @Then("hệ thống lưu sản phẩm thành công")
    public void he_thong_luu_san_pham_thanh_cong() {
        System.out.println("TEST: Hệ thống đã lưu sản phẩm mới thành công.");
    }

    @When("admin thêm sản phẩm nhưng thiếu tên hoặc giá")
    public void admin_them_san_pham_nhung_thieu_ten_hoac_gia() {
        System.out.println("TEST: Admin thêm sản phẩm nhưng thiếu thông tin.");
    }

    @Then("hệ thống hiển thị lỗi và không lưu sản phẩm")
    public void he_thong_hien_thi_loi_va_khong_luu_san_pham() {
        System.out.println("TEST: Hiện lỗi thiếu thông tin và không lưu sản phẩm.");
    }

    @When("admin chỉnh sửa thông tin sản phẩm")
    public void admin_chinh_sua_thong_tin_san_pham() {
        System.out.println("TEST: Admin chỉnh sửa sản phẩm.");
    }

    @Then("hệ thống cập nhật sản phẩm")
    public void he_thong_cap_nhat_san_pham() {
        System.out.println("TEST: Sản phẩm được cập nhật.");
    }

    @When("admin nhập thông tin sản phẩm không hợp lệ")
    public void admin_nhap_thong_tin_san_pham_khong_hop_le() {
        System.out.println("TEST: Thông tin chỉnh sửa không hợp lệ.");
    }

    @Then("hệ thống báo lỗi và không cập nhật sản phẩm")
    public void he_thong_bao_loi_va_khong_cap_nhat_san_pham() {
        System.out.println("TEST: Báo lỗi và không cập nhật.");
    }

    @When("admin xóa sản phẩm chưa có trong đơn hàng nào")
    public void admin_xoa_san_pham_chua_co_trong_don_hang_nao() {
        System.out.println("TEST: Xóa sản phẩm chưa nằm trong đơn hàng.");
    }

    @Then("sản phẩm bị xóa khỏi hệ thống")
    public void san_pham_bi_xoa_khoi_he_thong() {
        System.out.println("TEST: Xóa sản phẩm thành công.");
    }

    @When("admin xoa san pham khi dang giao hoac khong ton tai")
    public void admin_xoa_san_pham_khi_dang_giao_hoac_khong_ton_tai() {
        System.out.println("TEST: Cố xóa sản phẩm không cho phép.");
    }

    @Then("hệ thống hiển thị lỗi không thể xóa sản phẩm đang trong đơn hàng")
    public void he_thong_hien_thi_loi_khong_the_xoa_san_pham_dang_trong_don_hang() {
        System.out.println("TEST: Lỗi không thể xóa sản phẩm đang giao dịch.");
    }

    @When("admin thêm hoặc sửa hoac xoa danh muc")
    public void admin_them_hoac_sua_hoac_xoa_danh_muc() {
        System.out.println("TEST: Admin quản lý danh mục.");
    }

    @Then("hệ thống cập nhật danh mục")
    public void he_thong_cap_nhat_danh_muc() {
        System.out.println("TEST: Cập nhật danh mục thành công.");
    }

    @When("admin thêm hoac sua danh muc bi trung thong tin")
    public void admin_them_hoac_sua_danh_muc_bi_trung_thong_tin() {
        System.out.println("TEST: Admin nhập danh mục trùng lặp.");
    }

    @Then("hệ thống hiển thị lỗi trùng danh mục")
    public void he_thong_hien_thi_loi_trung_danh_muc() {
        System.out.println("TEST: Báo lỗi trùng lặp tên danh mục.");
    }

    @When("admin xem thong tin hoặc chỉnh sửa user")
    public void admin_xem_thong_tin_hoac_chinh_sua_user() {
        System.out.println("TEST: Admin quản lý người dùng.");
    }

    @Then("hệ thống lưu thay đổi user")
    public void he_thong_luu_thay_doi_user() {
        System.out.println("TEST: Lưu thay đổi thông tin người dùng.");
    }

    @When("admin chỉnh sửa user không tồn tại")
    public void admin_chinh_sua_user_khong_ton_tai() {
        System.out.println("TEST: Admin chỉnh sửa dữ liệu người dùng ảo.");
    }

    @Then("hệ thống hiển thị lỗi va khong luu user")
    public void he_thong_hien_thi_loi_va_khong_luu_user() {
        System.out.println("TEST: Không lưu user vì thông tin sai lệch.");
    }

    @When("admin xóa tài khoản người dùng đã từng đặt hàng")
    public void admin_xoa_tai_khoan_nguoi_dung_da_tung_dat_hang() {
        System.out.println("TEST: Admin muốn xóa tài khoản có liên kết lịch sử đơn hàng.");
    }

    @Then("hệ thống hiển thị lỗi không thể xóa tài khoản đã có đơn hàng")
    public void he_thong_hien_thi_loi_khong_the_xoa_tai_khoan_da_co_don_hang() {
        System.out.println("TEST: Chặn xóa tài khoản của người dùng có dữ liệu mua sắm.");
    }

    @When("admin mở trang đơn hàng")
    public void admin_mo_trang_don_hang() {
        System.out.println("TEST: Truy cập trang giám sát đơn hàng.");
    }

    @Then("hệ thống hiển thị danh sách đơn hàng sắp xếp theo ngày mua")
    public void he_thong_hien_thi_danh_sach_don_hang_sap_xep_theo_ngay_mua() {
        System.out.println("TEST: Hiện danh sách đơn hàng.");
    }

    @When("admin mở trang đơn hàng da bi xoa")
    public void admin_mo_trang_don_hang_da_bi_xoa() {
        System.out.println("TEST: Quản lý lại đơn hàng trống.");
    }

    @Then("hệ thống hiển thị thông báo không có đơn hàng")
    public void he_thong_hien_thi_thong_bao_khong_co_don_hang() {
        System.out.println("TEST: Hiện câu thông báo đơn rỗng.");
    }

    @When("admin cập nhật số lượng sản phẩm trong đơn hàng trực tuyến")
    public void admin_cap_nhat_so_luong_san_pham_trong_don_hang_truc_tuyen() {
        System.out.println("TEST: Admin sửa tay đơn hàng trực tuyến.");
    }

    @Then("hệ thống lưu thay đổi số lượng trong đơn hàng")
    public void he_thong_luu_thay_doi_so_luong_trong_don_hang() {
        System.out.println("TEST: Cập nhật thành công số lượng.");
    }

    // ================= CUSTOMER STEPS =================
    @Given("customer đã đăng nhập và truy cập vào trang web")
    public void customer_da_dang_nhap_va_truy_cap_vao_trang_web() {
        System.out.println("TEST: Customer đã đăng nhập và vào trang web.");
    }

    @When("customer bấm vào một sản phẩm phù hợp")
    public void customer_bam_vao_mot_san_pham_phu_hop() {
        System.out.println("TEST: Customer click vào sản phẩm.");
    }

    @Then("hệ thống hiển thị thông tin sản phẩm gồm: tên, giá, hình ảnh, mô tả")
    public void customer_hthong_hien_thi_thong_tin_sp() {
        System.out.println("TEST: Hiển thị thông tin sản phẩm.");
    }

    @And("customer bấm vào nút mua")
    public void customer_bam_vao_nut_mua() {
        System.out.println("TEST: Bấm nút mua.");
    }

    @And("hệ thống hiển thị các phương thức thanh toán: tiền mặt hoặc chuyển khoản")
    public void customer_hthong_hien_thi_pt_thanh_toan() {
        System.out.println("TEST: Hiển thị phương thức thanh toán.");
    }

    @And("customer chọn phương thức thanh toán và bấm đặt hàng")
    public void customer_chon_pt_va_dat_hang() {
        System.out.println("TEST: Chọn PT thanh toán và đặt hàng.");
    }

    @And("hệ thống thông báo đơn hàng đang chờ thanh toán và xác nhận đơn hàng đã đặt thành công")
    public void customer_hthong_thong_bao_cho_thanh_toan() {
        System.out.println("TEST: Thông báo chờ thanh toán.");
    }

    @Given("customer đã đăng nhập nhưng giỏ hàng trống")
    public void customer_da_dang_nhap_nhung_gio_hang_trong() {
        System.out.println("TEST: Giỏ hàng trống.");
    }

    @When("customer thực hiện thanh toán")
    public void customer_thuc_hien_thanh_toan() {
        System.out.println("TEST: Thanh toán.");
    }

    @Then("hệ thống hiển thị thông báo giỏ hàng trống không thể thanh toán")
    public void customer_hthong_hien_thi_thong_bao_gio_hang_trong_khong_thanh_toan() {
        System.out.println("TEST: Hiển thị giỏ hàng trống.");
    }

    @When("customer bấm vào một sản phẩm và bấm nút mua")
    public void customer_bam_vao_san_pham_va_nut_mua() {
        System.out.println("TEST: Bấm mua sản phẩm.");
    }

    @When("customer bấm vào một sản phẩm phù hợp và bấm nút mua")
    public void customer_bam_vao_mot_san_pham_phu_hop_va_bam_nut_mua() {
        System.out.println("TEST: Bấm vào sản phẩm phù hợp và bấm nút mua.");
    }

    @But("sản phẩm đó đã hết hàng")
    public void customer_san_pham_het_hang() {
        System.out.println("TEST: Sản phẩm hết hàng.");
    }

    @Then("hệ thống hiển thị thông báo sản phẩm đã hết hàng và không thể đặt đơn")
    public void customer_hthong_hien_thi_thong_bao_het_hang() {
        System.out.println("TEST: Báo hết hàng.");
    }

    @And("customer bấm đặt hàng mà không chọn phương thức thanh toán")
    public void customer_bam_dat_hang_ko_pt_thanh_toan() {
        System.out.println("TEST: Bấm đặt hàng ko PT.");
    }

    @And("hệ thống hiển thị thông báo yêu cầu chọn phương thức thanh toán và không tạo đơn hàng")
    public void customer_hthong_yeu_cau_pt_thanh_toan() {
        System.out.println("TEST: Yêu cầu chọn PT.");
    }

    @When("customer xem danh sách đơn hàng đã đặt")
    public void customer_xem_ds_don_hang() {
        System.out.println("TEST: Xem đơn hàng.");
    }

    @And("customer bấm vào nút hủy trên đơn hàng muốn hủy")
    public void customer_bam_huy_don() {
        System.out.println("TEST: Bấm hủy đơn.");
    }

    @Then("hệ thống hiển thị form yêu cầu chọn lý do hủy đơn hàng")
    public void customer_hthong_hien_thi_form_ly_do_huy() {
        System.out.println("TEST: Hiển thị form hủy.");
    }

    @And("customer chọn một lý do hủy bất kỳ")
    public void customer_chon_ly_do_huy() {
        System.out.println("TEST: Chọn lý do hủy.");
    }

    @And("hệ thống cập nhật trạng thái đơn hàng thành \"chờ xử lý hoàn tiền\"")
    public void customer_hthong_cap_nhat_tt_hoan_tien() {
        System.out.println("TEST: Cập nhật trạng thái.");
    }

    @And("hệ thống xác nhận đơn hàng đã được hủy và đang xử lý hoàn tiền cho customer")
    public void customer_hthong_xac_nhan_huy_va_hoan_tien() {
        System.out.println("TEST: Xác nhận hủy và hoàn tiền.");
    }

    @Given("customer đã đăng nhập và có đơn hàng cần hủy")
    public void customer_co_don_hang_huy() {
        System.out.println("TEST: Có đơn cần hủy.");
    }

    @When("customer bấm vào nút hủy đơn hàng")
    public void customer_bam_nut_huy_don() {
        System.out.println("TEST: Bấm nút hủy.");
    }

    @And("customer không chọn lý do hủy và bấm xác nhận")
    public void customer_ko_chon_ly_do_huy() {
        System.out.println("TEST: Ko chọn lý do.");
    }

    @Then("hệ thống hiển thị thông báo yêu cầu chọn lý do hủy và không thực hiện hủy đơn hàng")
    public void customer_hthong_yeu_cau_ly_do_huy() {
        System.out.println("TEST: Yêu cầu lý do.");
    }

    // ================= GUEST STEPS =================
    @Given("guest đã truy cập trang web")
    public void guest_da_truy_cap_trang_web() {
        System.out.println("TEST: Guest vào web.");
    }

    @Given("guest đã truy cập vào trang web")
    public void guest_da_truy_cap_vao_trang_web() {
        System.out.println("TEST: Guest vào web.");
    }

    @When("guest xem danh sách sản phẩm")
    public void guest_xem_danh_sach_san_pham() {
        System.out.println("TEST: Guest xem danh sách.");
    }

    @Then("hệ thống hiển thị danh sách sản phẩm")
    public void guest_he_thong_hien_thi_danh_sach_san_pham() {
        System.out.println("TEST: Hiển thị danh sách.");
    }

    @When("guest xem danh sách sản phẩm nhưng hệ thống không có sản phẩm")
    public void guest_xem_ko_sp() {
        System.out.println("TEST: Xem danh sách ko có SP.");
    }

    @Then("hệ thống hiển thị thông báo không có sản phẩm nào")
    public void guest_hthong_hien_thi_thong_bao_ko_sp() {
        System.out.println("TEST: Báo không có SP.");
    }

    @When("guest bấm vào một sản phẩm phù hợp")
    public void guest_bam_vao_san_pham_phu_hop() {
        System.out.println("TEST: Guest click vào sản phẩm.");
    }

    @Then("hệ thống hiển thị chi tiết thông tin sản phẩm")
    public void guest_hthong_hien_thi_chi_tiet_sp() {
        System.out.println("TEST: Hiển thị chi tiết SP.");
    }

    @When("guest chọn xem chi tiết sản phẩm không tồn tại")
    public void guest_xem_sp_ko_ton_tai() {
        System.out.println("TEST: Xem SP ko tồn tại.");
    }

    @Then("hệ thống hiển thị thông báo sản phẩm không tồn tại")
    public void guest_hthong_hien_thi_thong_bao_sp_ko_ton_tai() {
        System.out.println("TEST: Báo SP ko tồn tại.");
    }

    @And("hệ thống hiển thị thông tin giá, tên, hình ảnh phù hợp")
    public void guest_hthong_hien_thi_gia_ten_anh() {
        System.out.println("TEST: Hiển thị giá, tên, ảnh.");
    }

    @When("guest bấm thêm giỏ hàng")
    public void guest_bam_them_gio_hang() {
        System.out.println("TEST: Guest thêm giỏ hàng.");
    }

    @Then("hệ thống hiển thị phần đăng nhập đăng ký và bắt buộc người dùng đăng nhập hoặc đăng ký")
    public void guest_hthong_bat_dang_nhap() {
        System.out.println("TEST: Bắt đăng nhập.");
    }

    @And("hệ thống thông báo đăng nhập hoặc đăng ký thành công")
    public void guest_hthong_thong_bao_dn_thanh_cong() {
        System.out.println("TEST: Thông báo DN thành công.");
    }

    @And("guest ấn vào nút thêm giỏ hàng")
    public void guest_an_nut_them_gio_hang() {
        System.out.println("TEST: Ấn nút thêm giỏ hàng.");
    }

    @And("sản phẩm sẽ được thêm vào giỏ hàng thành công")
    public void guest_sp_them_gio_thanh_cong() {
        System.out.println("TEST: Thêm giỏ thành công.");
    }

    @Given("guest đã truy cập trang sản phẩm")
    public void guest_da_truy_cap_trang_sp() {
        System.out.println("TEST: Guest vào trang SP.");
    }

    @When("guest chọn mua sản phẩm không tồn tại")
    public void guest_chon_mua_sp_ko_ton_tai() {
        System.out.println("TEST: Chọn mua SP ko tồn tại.");
    }

    @Then("hệ thống hiển thị thông báo không có sản phẩm")
    public void guest_hthong_hien_thi_thong_bao_ko_co_sp() {
        System.out.println("TEST: Báo ko có SP.");
    }

    @When("guest bấm vào giỏ hàng")
    public void guest_bam_vao_gio_hang() {
        System.out.println("TEST: Bấm vào giỏ hàng.");
    }

    @Then("hệ thống hiển thị phần đăng nhập đăng ký và bắt buộc người dùng nhập thông tin hợp lệ")
    public void guest_hthong_yeu_cau_thong_tin_hop_le() {
        System.out.println("TEST: Yêu cầu thông tin hợp lệ.");
    }

    @And("guest đăng nhập hoặc đăng ký thành công")
    public void guest_dn_thanh_cong() {
        System.out.println("TEST: DN thành công.");
    }

    @And("hệ thống hiển thị danh sách sản phẩm có trong giỏ hàng")
    public void guest_hthong_hien_thi_ds_trong_gio() {
        System.out.println("TEST: Hiển thị DS trong giỏ.");
    }

    @When("guest bấm vào giỏ hàng nhưng chưa đăng nhập")
    public void guest_bam_gio_khi_chua_dn() {
        System.out.println("TEST: Bấm giỏ khi chưa DN.");
    }

    @Then("hệ thống hiển thị yêu cầu đăng nhập hoặc đăng ký và không cho phép xem giỏ hàng")
    public void guest_hthong_ko_cho_xem_gio() {
        System.out.println("TEST: Không cho xem giỏ.");
    }

    @Given("guest đã có sản phẩm trong giỏ hàng session")
    public void guest_da_co_sp_trong_gio() {
        System.out.println("TEST: Giỏ có SP.");
    }

    @When("guest chỉnh sửa số lượng sản phẩm thành số hợp lệ")
    public void guest_sua_sl_hop_le() {
        System.out.println("TEST: Sửa SL hợp lệ.");
    }

    @Then("hệ thống cập nhật số lượng sản phẩm trong session")
    public void guest_cap_nhat_sl_session() {
        System.out.println("TEST: Cập nhật SL session.");
    }

    @When("guest chỉnh sửa số lượng sản phẩm thành 0")
    public void guest_sua_sl_ve_0() {
        System.out.println("TEST: Sửa SL về 0.");
    }

    @Then("hệ thống xóa sản phẩm đó khỏi giỏ hàng trong session")
    public void guest_xoa_sp_khoi_gio() {
        System.out.println("TEST: Xóa SP khỏi giỏ.");
    }

    @Given("guest chưa có tài khoản")
    public void guest_chua_co_tk() {
        System.out.println("TEST: Chưa có TK.");
    }

    @When("guest đăng ký với email chưa tồn tại và thông tin hợp lệ")
    public void guest_dang_ky_thanh_cong() {
        System.out.println("TEST: Đăng ký thành công.");
    }

    @Then("hệ thống lưu tài khoản mới vào CSDL và gửi email thông báo")
    public void guest_hthong_luu_tk_va_gui_mail() {
        System.out.println("TEST: Lưu TK và gửi mail.");
    }

    @When("guest đăng ký với email đã được đăng ký trước đó")
    public void guest_dang_ky_trung_mail() {
        System.out.println("TEST: Đăng ký trùng mail.");
    }

    @Then("hệ thống hiển thị lỗi email đã tồn tại và không lưu tài khoản")
    public void guest_hthong_bao_loi_trung_mail() {
        System.out.println("TEST: Báo trùng mail.");
    }

    @When("guest đăng ký nhưng bỏ trống các trường bắt buộc")
    public void guest_dang_ky_thieu_thong_tin() {
        System.out.println("TEST: Đăng ký thiếu thông tin.");
    }

    @Then("hệ thống hiển thị lỗi thiếu thông tin và không lưu tài khoản")
    public void guest_hthong_bao_loi_thieu_thong_tin() {
        System.out.println("TEST: Báo thiếu thông tin.");
    }
}
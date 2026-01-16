package com.project.MilitaryManagement.payload.response;

import lombok.With;

@With
public record QuanNhanResponse (
    Long id,
    String hoTenKhaiSinh,
    String hoTenThuongDung,
    String soHieuQuanNhan,
    String canCuocCongDan,
    String ngayThangNamSinh,
    String capBac,
    String ngayNhanCapBac,
    String ngayCapTheQuanNhan,
    String chucVu,
    String ngayNhanChucVu,
    String cnqs,
    String bacKyThuat,
    String nhapNgu,
    String xuatNgu,
    String taiNgu,
    String ngayChuyenQncn,String luong,
    String ngayVaoDoan,
    String ngayVaoDang,
    String ngayChinhThuc,
    String ngayChuyenCnvcqp,
    String thanhPhanGd,
    String thanhPhanBanThan,
    String danToc,
    String tonGiao,
    String vanHoa,
    String ngoaiNgu,
    String sucKhoe,
    String hangThuongBinh
){
}

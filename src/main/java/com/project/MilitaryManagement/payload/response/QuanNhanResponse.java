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
    String ngayCapTheQuanNhan
){
}

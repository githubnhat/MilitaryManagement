package com.project.MilitaryManagement.payload.request;

import lombok.With;

@With
public record QuanNhanRequest (
        Long id,
        long [] ids,
        String hoTenKhaiSinh,
        String hoTenThuongDung,
        String ngayThangNamSinh,
        String danToc,
        String tonGiao,
        String thanhPhanGd,
        String thanhPhanBanThan,
        String nguyenQuan,      // Mới
        String hoKhau,          // Mới
        String nhapNgu,
        String donViCSM,        // Mới
        String ngayVaoDoan,
        String ngayVaoDang,
        String ngayChinhThuc,
        String trinhDoHocVan,   // Mới (thay cho vanHoa)
        String ngoaiNgu,
        String tiengDanToc  // Mới
) {
}


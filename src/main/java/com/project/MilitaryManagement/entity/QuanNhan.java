package com.project.MilitaryManagement.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class QuanNhan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Mã định danh quân nhân
    @Column
    private int status;
    // --- Thông tin cá nhân & quân nhân ---
    @Column(length = 100)
    private String hoTenKhaiSinh;
    @Column(length = 100)
    private String hoTenThuongDung;
    @Column(length = 20)
    private String ngayThangNamSinh;
    @Column(length = 12)
    private String danToc;
    @Column(length = 100)
    private String tonGiao;
    @Column(length = 20)
    private String thanhPhanGd;
    @Column(length = 50)
    private String thanhPhanBanThan;
    @Column(length = 50)
    private String nguyenQuan;
    @Column(length = 50)
    private String hoKhau;
    @Column(length = 50)
    private String donViCSM;
    @Column(length = 50)
    private String trinhDoHocVan;
    @Column(length = 50)
    private String tiengDanToc;
    @Column(length = 50)
    private String nhapNgu;
    @Column(length = 50)
    private String ngayVaoDoan;
    @Column(length = 50)
    private String ngayVaoDang;
    @Column(length = 50)
    private String ngayChinhThuc;
    @Column(length = 50)
    private String ngoaiNgu;
}

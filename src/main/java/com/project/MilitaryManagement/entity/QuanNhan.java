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
    private String soHieuQuanNhan;
    @Column(length = 12)
    private String canCuocCongDan;
    @Column(length = 100)
    private String ngayThangNamSinh;
    @Column(length = 20)
    private String capBac;
    @Column(length = 50)
    private String ngayNhanCapBac;
    @Column(length = 50)
    private String ngayCapTheQuanNhan;
    @Column(length = 50)
    private String chucVu;
    @Column(length = 50)
    private String ngayNhanChucVu;
    @Column(length = 50)
    private String cnqs;
    @Column(length = 50)
    private String bacKyThuat;
    @Column(length = 50)
    private String nhapNgu;
    @Column(length = 50)
    private String xuatNgu;
    @Column(length = 50)
    private String taiNgu;
    @Column(length = 50)
    private String ngayChuyenQncn;
    @Column(length = 50)
    private String ngayChuyenCnvcqp;
    @Column(length = 50)
    private String luong;
    @Column(length = 50)
    private String ngayVaoDoan;
    @Column(length = 50)
    private String ngayVaoDang;
    @Column(length = 50)
    private String ngayChinhThuc;
    @Column(length = 50)
    private String thanhPhanGd;
    @Column(length = 50)
    private String thanhPhanBanThan;
    @Column(length = 50)
    private String danToc;
    @Column(length = 50)
    private String tonGiao;
}

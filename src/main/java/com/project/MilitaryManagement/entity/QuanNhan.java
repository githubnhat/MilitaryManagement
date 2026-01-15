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
}

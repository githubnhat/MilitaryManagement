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
    @Column(length = 20)
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
    @Column(length = 50)
    private String soHieuQuanNhan;
    @Column(length = 50)
    private String canCuocCongDan;
    @Column(length = 255)
    private String chuyenMonDaoTao;
    @Column(length = 255)
    private String chuyenMonTuHoc;
    @Column
    private Integer sucKhoe;
    @Column(length = 255)
    private String benhLy;
    @Column
    private Double chieuCao;
    @Column
    private Double canNang;
    @Column(length = 50)
    private String khiChat;
    @Column(length = 255)
    private String soThichCaNhan;
    @Column(length = 255)
    private String truocNhapNgu;
    @Column(length = 50)
    private String lyDoNhapNgu;
    @Column(length = 100)
    private String suyNghiMoiTruong;
    @Column(length = 100)
    private String nguyenVongBanThan;
    @Column(length = 255)
    private String chiTietCMKT;
    @Column(length = 255)
    private String diaChiDiPhep;
    @Column(length = 100)
    private String nguoiBaoTin;
    @Column(length = 255)
    private String diaChiNguoiBaoTin;
    @Column(length = 20)
    private String soDienThoaiBaoTin;
    @Column(length = 100)
    private String hoTenCha;
    @Column(length = 20)
    private String ngaySinhCha;
    @Column(length = 20)
    private String sdtCha;
    @Column(length = 20)
    private String tinhTrangCha; // Còn sống / Từ trần
    @Column(length = 20)
    private String ngayTuTranCha;
    @Column(length = 100)
    private String ngheNghiepCha;
    @Column(length = 100)
    private String chucVuCha;
    @Column(length = 255)
    private String noiOHienNayCha;
    @Column(length = 255)
    private String sucKhoeCha;
    @Column(length = 255)
    private String coQuanCha;
    @Column
    private Boolean laDangVienCha;
    //Thông tin mẹ
    @Column(length = 100)
    private String hoTenMe;
    @Column(length = 20)
    private String ngaySinhMe;
    @Column(length = 20)
    private String sdtMe;
    @Column(length = 20)
    private String tinhTrangMe;
    @Column(length = 20)
    private String ngayTuTranMe;
    @Column(length = 255)
    private String coQuanMe;
    @Column
    private Boolean laDangVienMe;
    @Column(length = 255)
    private String sucKhoeMe;
    @Column(length = 255)
    private String noiOHienNayMe;
    @Column(length = 50)
    private String honNhanChaMe;
    @Column(length = 50)
    private String kinhTeGiaDinh;
    @Column int soAnhEm;
    @Column int conThuMay;
    @Column
    private Integer soAnhEmTrai;
    @Column
    private Integer soAnhEmGai;
    @Column
    private Integer soAnhEmLaCanBo;
    @Column(length = 255)
    private String sdtLienLacGiaDinh;
    @Column(length = 255)
    private String thongTinOngBaNoi;
    @Column(length = 255)
    private String thongTinOngBaNgoai;
    @Column(length = 255)
    private String ghiChuNoi;
    @Column(length = 255)
    private String ghiChuNgoai;
    @ManyToOne
    @JoinColumn(name = "id_tieu_doi")
    private TieuDoi tieuDoi;

}

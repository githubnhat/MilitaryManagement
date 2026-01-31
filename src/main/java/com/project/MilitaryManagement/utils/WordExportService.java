package com.project.MilitaryManagement.utils;

import com.project.MilitaryManagement.entity.QuanNhan;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.xwpf.usermodel.*;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WordExportService {

    public void exportFromTemplate(HttpServletResponse response, QuanNhan quanNhan) throws IOException {
        ClassPathResource resource = new ClassPathResource("templates/file/phieu_thong_tin_template.docx");
        try (InputStream inputStream = resource.getInputStream();
             XWPFDocument document = new XWPFDocument(inputStream)) {

            Map<String, String> data = createDataMap(quanNhan);

            // Xử lý thay thế trong Paragraphs
            for (XWPFParagraph p : document.getParagraphs()) replaceInParagraph(p, data);

            // Xử lý thay thế trong Tables
            for (XWPFTable table : document.getTables()) {
                for (XWPFTableRow row : table.getRows()) {
                    for (XWPFTableCell cell : row.getTableCells()) {
                        for (XWPFParagraph p : cell.getParagraphs()) replaceInParagraph(p, data);
                    }
                }
            }

            // Gửi file
            response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
            String headerKey = "Content-Disposition";
            String rawFileName = "PhieuThongTin_" + quanNhan.getHoTenKhaiSinh() + ".docx";
            String encodedFileName = URLEncoder.encode(rawFileName, StandardCharsets.UTF_8.toString()).replaceAll("\\+", "%20");
            response.setHeader(headerKey, "attachment; filename*=UTF-8''" + encodedFileName);
            document.write(response.getOutputStream());
        }
    }

    private String cleanDonVi(String input) {
        if (input == null || input.isEmpty()) return "..........";

        // Giải thích Regex:
        // (?i): Không phân biệt hoa thường
        // (đại đội|tiểu đoàn): Tìm một trong hai cụm từ này
        // \\s*: Tìm tất cả khoảng trắng (nếu có) ngay sau đó
        return input.replaceAll("(?i)(đại đội|tiểu đoàn)\\s*", "").trim();
    }

    private Map<String, String> createDataMap(QuanNhan qn) {
        Map<String, String> data = new HashMap<>();
//        String checked = "☑";
//        String unchecked = "☐";

        String checked = "\u2612";
        String unchecked = "\u2610";

        // --- I. THÔNG TIN BẢN THÂN ---
        data.put("${hoTenKhaiSinh}", formatValue(qn.getHoTenKhaiSinh()));
        data.put("${hoTenThuongDung}", formatValue(qn.getHoTenThuongDung()));

        // Xử lý tách ngày/tháng/năm từ chuỗi ngayThangNamSinh (giả định định dạng dd/MM/yyyy)
        String[] birthParts = parseDate(qn.getNgayThangNamSinh());
        data.put("${ngaySinh}", birthParts[0]);
        data.put("${thangSinh}", birthParts[1]);
        data.put("${namSinh}", birthParts[2]);

        data.put("${danToc}", formatValue(qn.getDanToc()));
        data.put("${tonGiao}", formatValue(qn.getTonGiao()));
        data.put("${thanhPhanGd}", formatValue(qn.getThanhPhanGd()));
        data.put("${thanhPhanBanThan}", formatValue(qn.getThanhPhanBanThan()));
        data.put("${nguyenQuan}", formatValue(qn.getNguyenQuan()));
        data.put("${hoKhau}", formatValue(qn.getHoKhau()));
        data.put("${nhapNgu}", formatValue(qn.getNhapNgu()));
        data.put("${donViCSM}", formatValue(qn.getDonViCSM()));
        data.put("${ngayVaoDoan}", formatValue(qn.getNgayVaoDoan()));
        data.put("${ngayVaoDang}", formatValue(qn.getNgayVaoDang()));
        data.put("${ngayChinhThuc}", formatValue(qn.getNgayChinhThuc()));
        data.put("${trinhDoHocVan}", formatValue(qn.getTrinhDoHocVan()));
        data.put("${ngoaiNgu}", formatValue(qn.getNgoaiNgu()));
        data.put("${tiengDanToc}", formatValue(qn.getTiengDanToc()));
        data.put("${chuyenMonDaoTao}", formatValue(qn.getChuyenMonDaoTao()));
        data.put("${chuyenMonTuHoc}", formatValue(qn.getChuyenMonTuHoc()));
        data.put("${sucKhoe}", qn.getSucKhoe() != null ? String.valueOf(qn.getSucKhoe()) : "...");
        data.put("${benhLy}", formatValue(qn.getBenhLy()));
        data.put("${chieuCao}", qn.getChieuCao() != null ? String.valueOf(qn.getChieuCao()) : "...");
        data.put("${canNang}", qn.getCanNang() != null ? String.valueOf(qn.getCanNang()) : "...");

        // Khí chất Checkbox
        data.put("${khiChat_tramLang}", "Trầm lặng".equalsIgnoreCase(qn.getKhiChat()) ? checked : unchecked);
        data.put("${khiChat_nongNay}", "Nóng nảy".equalsIgnoreCase(qn.getKhiChat()) ? checked : unchecked);
        data.put("${khiChat_hoatBat}", "Hoạt bát".equalsIgnoreCase(qn.getKhiChat()) ? checked : unchecked);

        // Đối tượng chính sách
        data.put("${conLietSi}", qn.isConLietSi() ? checked : unchecked);
        data.put("${conTB}", qn.isConTB() ? checked : unchecked);
        data.put("${conBB}", qn.isConBB() ? checked : unchecked);
        data.put("${hoNgheo}", qn.isHoNgheo() ? checked : unchecked);
        data.put("${hoCanNgheo}", qn.isHoCanNgheo() ? checked : unchecked);

        data.put("${soThichCaNhan}", formatValue(qn.getSoThichCaNhan()));
        data.put("${truocNhapNgu}", formatValue(qn.getTruocNhapNgu()));

        // Lý do nhập ngũ & Suy nghĩ
        data.put("${lyDoNhapNgu_lenhGoi}", "Lệnh gọi".equalsIgnoreCase(qn.getLyDoNhapNgu()) ? checked : unchecked);
        data.put("${lyDoNhapNgu_tinhNguyen}", "Tình nguyện".equalsIgnoreCase(qn.getLyDoNhapNgu()) ? checked : unchecked);
        data.put("${suyNghiMoiTruon_tot}", "Tốt".equalsIgnoreCase(qn.getSuyNghiMoiTruong()) ? checked : unchecked);
        data.put("${suyNghiMoiTruong_gianNan}", "Gian nan".equalsIgnoreCase(qn.getSuyNghiMoiTruong()) ? checked : unchecked);

        // Nguyện vọng Checkbox (Dựa trên so sánh String hoặc logic của bạn)
        data.put("${nguyenVongBanThan_tieuDoiTruong}", qn.getNguyenVongBanThan() != null && qn.getNguyenVongBanThan().contains("tiểu đội trưởng") ? checked : unchecked);
        data.put("${nguyenVongBanThan_cmkt}", qn.getNguyenVongBanThan() != null && qn.getNguyenVongBanThan().contains("CMKT") ? checked : unchecked);
        data.put("${chiTietCMKT}", formatValue(qn.getChiTietCMKT()));
        data.put("${nguyenVongBanThan_sqdb}", qn.getNguyenVongBanThan() != null && qn.getNguyenVongBanThan().contains("SQDB") ? checked : unchecked);
        data.put("${nguyenVongBanThan_siQuan}", qn.getNguyenVongBanThan() != null && qn.getNguyenVongBanThan().contains("sĩ quan") ? checked : unchecked);
        data.put("${nguyenVongBanThan_ketNapDang}", qn.getNguyenVongBanThan() != null && qn.getNguyenVongBanThan().contains("Đảng") ? checked : unchecked);
        data.put("${nguyenVongBanThan_raQuan}", qn.getNguyenVongBanThan() != null && qn.getNguyenVongBanThan().contains("Ra quân") ? checked : unchecked);

        data.put("${diaChiDiPhep}", formatValue(qn.getDiaChiDiPhep()));
        data.put("${nguoiBaoTin}", formatValue(qn.getNguoiBaoTin()));
        data.put("${diaChiNguoiBaoTin}", formatValue(qn.getDiaChiNguoiBaoTin()));
        data.put("${soDienThoaiBaoTin}", formatValue(qn.getSoDienThoaiBaoTin()));

        // --- II. GIA ĐÌNH ---
        // Cha
        data.put("${hoTenCha}", formatValue(qn.getHoTenCha()));
        data.put("${ngaySinhCha}", formatValue(qn.getNgaySinhCha()));
        data.put("${sdtCha}", formatValue(qn.getSdtCha()));
        data.put("${tinhTrangCha_conSong}", "Còn sống".equalsIgnoreCase(qn.getTinhTrangCha()) ? checked : unchecked);
        data.put("${tinhTrangCha_tuTran}", "Từ trần".equalsIgnoreCase(qn.getTinhTrangCha()) ? checked : unchecked);
        data.put("${ngayTuTranCha}", formatValue(qn.getNgayTuTranCha()));
        data.put("${ngheNghiepCha}", formatValue(qn.getNgheNghiepCha()));
        data.put("${chucVuCha}", formatValue(qn.getChucVuCha()));
        data.put("${coQuanCha}", formatValue(qn.getCoQuanCha()));
        data.put("${laDangVienCha_dangVien}", qn.getLaDangVienCha() != null && qn.getLaDangVienCha() ? checked : unchecked);
        data.put("${noiOHienNayCha}", formatValue(qn.getNoiOHienNayCha()));
        data.put("${sucKhoeCha}", formatValue(qn.getSucKhoeCha()));
        data.put("${benhLyCha}", formatValue(qn.getBenhLyCha()));

        // Mẹ
        data.put("${hoTenMe}", formatValue(qn.getHoTenMe()));
        data.put("${ngaySinhMe}", formatValue(qn.getNgaySinhMe()));
        data.put("${sdtMe}", formatValue(qn.getSdtMe()));
        data.put("${tinhTrangMe_conSong}", "Còn sống".equalsIgnoreCase(qn.getTinhTrangMe()) ? checked : unchecked);
        data.put("${tinhTrangMe_tuTran}", "Từ trần".equalsIgnoreCase(qn.getTinhTrangMe()) ? checked : unchecked);
        data.put("${ngayTuTranMe}", formatValue(qn.getNgayTuTranMe()));
        data.put("${ngheNghiepMe}", formatValue(qn.getNgheNghiepMe()));
        data.put("${chucVuMe}", formatValue(qn.getChucVuMe()));
        data.put("${coQuanMe}", formatValue(qn.getCoQuanMe()));
        data.put("${laDangVienMe_dangVien}", qn.getLaDangVienMe() != null && qn.getLaDangVienMe() ? checked : unchecked);
        data.put("${noiOHienNayMe}", formatValue(qn.getNoiOHienNayMe()));
        data.put("${sucKhoeMe}", formatValue(qn.getSucKhoeMe()));
        data.put("${benhLyMe}", formatValue(qn.getBenhLyMe()));

        // Hôn nhân cha mẹ & Kinh tế
        data.put("${honNhanChaMe_hanhPhuc}", "Hạnh phúc".equalsIgnoreCase(qn.getHonNhanChaMe()) ? checked : unchecked);
        data.put("${honNhanChaMe_lyThan}", "Ly thân".equalsIgnoreCase(qn.getHonNhanChaMe()) ? checked : unchecked);
        data.put("${honNhanChaMe_lyHon}", "Ly hôn".equalsIgnoreCase(qn.getHonNhanChaMe()) ? checked : unchecked);
        data.put("${honNhanChaMe_baoLuc}", "Bạo lực gia đình".equalsIgnoreCase(qn.getHonNhanChaMe()) ? checked : unchecked);
        data.put("${kinhTeGiaDinh_khaGia}", "Khá giả".equalsIgnoreCase(qn.getKinhTeGiaDinh()) ? checked : unchecked);
        data.put("${kinhTeGiaDinh_duSong}", "Đủ sống".equalsIgnoreCase(qn.getKinhTeGiaDinh()) ? checked : unchecked);
        data.put("${kinhTeGiaDinh_khoKhan}", "Khó khăn".equalsIgnoreCase(qn.getKinhTeGiaDinh()) ? checked : unchecked);

        data.put("${soAnhEm}", String.valueOf(qn.getSoAnhEm()));
        data.put("${soAnhEmTrai}", String.valueOf(qn.getSoAnhEmTrai()));
        data.put("${soAnhEmGai}", String.valueOf(qn.getSoAnhEmGai()));
        data.put("${conThuMay}", String.valueOf(qn.getConThuMay()));
        data.put("${soAnhEmLaCanBo}", String.valueOf(qn.getSoAnhEmLaCanBo()));
        data.put("${sdtLienLacGiaDinh}", formatValue(qn.getSdtLienLacGiaDinh()));

        // Ông bà nội
        data.put("${statusOngNoi_conSong}", "con_song".equalsIgnoreCase(qn.getStatusOngNoi()) ? checked : unchecked);
        data.put("${statusOngNoi_tuTran}", "da_mat".equalsIgnoreCase(qn.getStatusOngNoi()) ? checked : unchecked);
        data.put("${ngayMatOngNoi}", formatValue(qn.getNgayMatOngNoi()));
        data.put("${statusBaNoi_conSong}", "con_song".equalsIgnoreCase(qn.getStatusBaNoi()) ? checked : unchecked);
        data.put("${statusBaNoi_tuTran}", "da_mat".equalsIgnoreCase(qn.getStatusBaNoi()) ? checked : unchecked);
        data.put("${ngayMatBaNoi}", formatValue(qn.getNgayMatBaNoi()));
        data.put("${ghiChuNoi}", formatValue(qn.getGhiChuNoi()));

        // Ông bà ngoại
        data.put("${statusOngNgoai_conSong}", "con_song".equalsIgnoreCase(qn.getStatusOngNgoai()) ? checked : unchecked);
        data.put("${statusOngNgoai_tuTran}", "da_mat".equalsIgnoreCase(qn.getStatusOngNgoai()) ? checked : unchecked);
        data.put("${ngayMatOngNgoai}", formatValue(qn.getNgayMatOngNgoai()));
        data.put("${statusBaNgoai_conSong}", "con_song".equalsIgnoreCase(qn.getStatusBaNgoai()) ? checked : unchecked);
        data.put("${statusBaNgoai_tuTran}", "da_mat".equalsIgnoreCase(qn.getStatusBaNgoai()) ? checked : unchecked);
        data.put("${ngayMatBaNgoai}", formatValue(qn.getNgayMatBaNgoai()));
        data.put("${ghiChuNgoai}", formatValue(qn.getGhiChuNgoai()));

        // --- III. QUAN HỆ XÃ HỘI ---
        data.put("${hoTenBanGai}", formatValue(qn.getHoTenBanGai()));
        data.put("${ngaySinhBanGai}", formatValue(qn.getNgaySinhBanGai()));
        data.put("${diaChiBanGai}", formatValue(qn.getDiaChiBanGai()));
        data.put("${sdtBanGai}", formatValue(qn.getSdtBanGai()));
        data.put("${hoTenBanTrai}", formatValue(qn.getHoTenBanTrai()));
        data.put("${ngaySinhBanTrai}", formatValue(qn.getNgaySinhBanTrai()));
        data.put("${diaChiBanTrai}", formatValue(qn.getDiaChiBanTrai()));
        data.put("${sdtBanTrai}", formatValue(qn.getSdtBanTrai()));
        data.put("${nguoiAnhHuongTichCuc}", formatValue(qn.getNguoiAnhHuongTichCuc()));

        data.put("${hoTenCBDP1}", formatValue(qn.getHoTenCBDP1()));
        data.put("${chucVuCBDP1}", formatValue(qn.getChucVuCBDP1()));
        data.put("${sdtCBDP1}", formatValue(qn.getSdtCBDP1()));
        data.put("${hoTenCBDP2}", formatValue(qn.getHoTenCBDP2()));
        data.put("${chucVuCBDP2}", formatValue(qn.getChucVuCBDP2()));
        data.put("${sdtCBDP2}", formatValue(qn.getSdtCBDP2()));

        return data;
    }

    private void replaceInParagraph(XWPFParagraph paragraph, Map<String, String> data) {
        List<XWPFRun> runs = paragraph.getRuns();
        if (runs == null || runs.isEmpty()) return;

        // Lấy toàn bộ văn bản trong đoạn để kiểm tra placeholder
        String paragraphText = paragraph.getParagraphText();
        boolean containsKey = false;
        for (String key : data.keySet()) {
            if (paragraphText.contains(key)) {
                containsKey = true;
                break;
            }
        }

        if (containsKey) {
            // Thay thế dữ liệu trên chuỗi tổng
            for (Map.Entry<String, String> entry : data.entrySet()) {
                paragraphText = paragraphText.replace(entry.getKey(), entry.getValue() != null ? entry.getValue() : "................");
            }

            // Xóa sạch các Run cũ để "dọn dẹp" các mảnh vụn placeholder
            for (int i = runs.size() - 1; i >= 0; i--) {
                paragraph.removeRun(i);
            }

            // Tạo một Run mới duy nhất để ghi đè, xử lý ký tự Tab để không bị mất định dạng
            XWPFRun newRun = paragraph.createRun();
            String[] parts = paragraphText.split("\t", -1);
            for (int i = 0; i < parts.length; i++) {
                newRun.setText(parts[i]);
                if (i < parts.length - 1) {
                    newRun.addTab(); // Giữ nguyên khoảng cách Tab bạn đã căn trong Word
                }
            }
        }
    }

    private String formatValue(Object value) {
        if (value == null || value.toString().trim().isEmpty()) {
            return "..............................";
        }
        return value.toString();
    }

    private String[] parseDate(String dateStr) {
        if (dateStr == null || !dateStr.contains("/")) {
            return new String[]{"...", "...", "..."};
        }
        String[] parts = dateStr.split("/");
        if (parts.length == 3) return parts;
        return new String[]{"...", "...", "..."};
    }
}
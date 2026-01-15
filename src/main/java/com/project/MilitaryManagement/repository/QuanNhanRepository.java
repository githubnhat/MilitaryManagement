package com.project.MilitaryManagement.repository;

import com.project.MilitaryManagement.entity.Military;
import com.project.MilitaryManagement.entity.QuanNhan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuanNhanRepository extends JpaRepository<QuanNhan, Long> {

    List<QuanNhan> findAllByStatus(int status);

    QuanNhan findQuanNhanByIdAndStatus(Long id, int status);
    @Query("SELECT m FROM QuanNhan m WHERE m.status = 1 AND (" +
            "LOWER(m.hoTenKhaiSinh) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(m.soHieuQuanNhan) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(m.canCuocCongDan) LIKE LOWER(CONCAT('%', :keyword, '%')))")
    List<QuanNhan> searchByKeyword(@Param("keyword") String keyword);
}

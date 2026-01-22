package com.project.MilitaryManagement.repository;

import com.project.MilitaryManagement.entity.DaiDoi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface DaiDoiRepository extends JpaRepository<DaiDoi, Long> {
    List<DaiDoi> findAllByStatus(int status);
    List<DaiDoi> findByTieuDoanIdAndStatus(Long tieuDoanId, int status);
}
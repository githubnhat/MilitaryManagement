package com.project.MilitaryManagement.repository;

import com.project.MilitaryManagement.entity.TieuDoi;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TieuDoiRepository extends JpaRepository<TieuDoi, Long> {
    List<TieuDoi> findAllByStatus(int status);
}

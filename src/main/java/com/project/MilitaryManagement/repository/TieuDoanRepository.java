package com.project.MilitaryManagement.repository;

import com.project.MilitaryManagement.entity.TieuDoan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TieuDoanRepository extends JpaRepository<TieuDoan, Long> {
    List<TieuDoan> findAllByStatus(int status);
    TieuDoan findTieuDoanByIdAndStatus(Long id, int status);
}


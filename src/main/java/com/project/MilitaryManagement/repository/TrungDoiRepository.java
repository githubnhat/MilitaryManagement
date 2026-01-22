package com.project.MilitaryManagement.repository;

import com.project.MilitaryManagement.entity.TrungDoi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface TrungDoiRepository extends JpaRepository<TrungDoi, Long> {
    List<TrungDoi> findAllByStatus(int status);
    List<TrungDoi> findByDaiDoi_IdAndStatus(Long daiDoiId, int status);
}
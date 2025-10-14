package com.project.MilitaryManagement.repository;

import com.project.MilitaryManagement.entity.Military;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MilitaryRepository extends JpaRepository<Military, Long> {
    List<Military> findAllByStatus(int status);

    Military findMilitaryByIdAndStatus(Long id, int status);

    @Query("SELECT m FROM Military m WHERE m.status = 1 AND (" +
            "LOWER(m.birthFullName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(m.militaryIdNumber) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(m.nationalIdNumber) LIKE LOWER(CONCAT('%', :keyword, '%')))")
    List<Military> searchByKeyword(@Param("keyword") String keyword);
}

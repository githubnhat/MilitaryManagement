package com.project.MilitaryManagement.repository;

import com.project.MilitaryManagement.entity.Military;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MilitaryRepository extends JpaRepository<Military, Long> {
    List<Military> findAllByStatus(int status);

    Military findMilitaryById(Long id);
}

package com.project.MilitaryManagement.service;

import com.project.MilitaryManagement.entity.Military;
import com.project.MilitaryManagement.entity.QuanNhan;
import com.project.MilitaryManagement.payload.request.MilitaryRequest;
import com.project.MilitaryManagement.payload.request.QuanNhanRequest;
import com.project.MilitaryManagement.payload.response.MilitaryResponse;
import com.project.MilitaryManagement.payload.response.QuanNhanResponse;
import org.springframework.http.ResponseEntity;

import java.util.List;
import java.util.Map;

public interface QuanNhanService {
    ResponseEntity<QuanNhanResponse> save(QuanNhanRequest request) throws Exception;
    QuanNhan findQuanNhanById(Long id);
    List<QuanNhan> findAllByStatus(int status);
    List<QuanNhan> searchByKeyword(String keyword);
    ResponseEntity<QuanNhanResponse> update(QuanNhanRequest request) throws Exception;
    boolean delete (long [] ids);
    Map<String, List<Object[]>> getThongKeDonVi();
}

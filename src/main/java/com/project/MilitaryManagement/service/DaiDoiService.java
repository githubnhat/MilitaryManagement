package com.project.MilitaryManagement.service;

import com.project.MilitaryManagement.entity.DaiDoi;
import com.project.MilitaryManagement.payload.request.DaiDoiRequest;
import com.project.MilitaryManagement.payload.response.DaiDoiResponse;
import org.springframework.http.ResponseEntity;
import java.util.List;

public interface DaiDoiService {
    ResponseEntity<DaiDoiResponse> save(DaiDoiRequest request) throws Exception;
    List<DaiDoi> findAllByStatus(int status);
    List<DaiDoi> findByTieuDoanId(Long tieuDoanId);
    ResponseEntity<DaiDoiResponse> update(DaiDoiRequest request) throws Exception;
    boolean delete(long[] ids);
}
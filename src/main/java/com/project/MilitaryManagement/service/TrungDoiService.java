package com.project.MilitaryManagement.service;

import com.project.MilitaryManagement.entity.TrungDoi;
import com.project.MilitaryManagement.payload.request.DaiDoiRequest;
import com.project.MilitaryManagement.payload.request.TrungDoiRequest;
import com.project.MilitaryManagement.payload.response.DaiDoiResponse;
import com.project.MilitaryManagement.payload.response.TrungDoiResponse;
import org.springframework.http.ResponseEntity;
import java.util.List;

public interface TrungDoiService {
    ResponseEntity<TrungDoiResponse> save(TrungDoiRequest request) throws Exception;
    List<TrungDoi> findAllByStatus(int status);
    List<TrungDoi> findByDaiDoi_IdAndStatus(Long daiDoiId);
    ResponseEntity<TrungDoiResponse> update(TrungDoiRequest request) throws Exception;
    boolean delete(long[] ids);
}
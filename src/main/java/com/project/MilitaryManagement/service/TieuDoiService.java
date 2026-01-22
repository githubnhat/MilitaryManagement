package com.project.MilitaryManagement.service;

import com.project.MilitaryManagement.entity.TieuDoi;
import com.project.MilitaryManagement.payload.request.TieuDoiRequest;
import com.project.MilitaryManagement.payload.response.TieuDoiResponse;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface TieuDoiService {
    ResponseEntity<TieuDoiResponse> save(TieuDoiRequest request) throws Exception;
    List<TieuDoi> findAllByStatus(int status);
}

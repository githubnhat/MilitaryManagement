package com.project.MilitaryManagement.service;

import com.project.MilitaryManagement.entity.TieuDoan;
import com.project.MilitaryManagement.payload.request.TieuDoanRequest;
import com.project.MilitaryManagement.payload.response.TieuDoanResponse;
import org.springframework.http.ResponseEntity;

import java.util.List;


public interface TieuDoanService {
    ResponseEntity<TieuDoanResponse> save(TieuDoanRequest request) throws Exception;
    List<TieuDoan> findAllByStatus(int status);
    ResponseEntity<TieuDoanResponse> update(TieuDoanRequest request) throws Exception;
    boolean delete (long [] ids);
}

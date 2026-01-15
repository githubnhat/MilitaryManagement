package com.project.MilitaryManagement.service;

import com.project.MilitaryManagement.payload.request.MilitaryRequest;
import com.project.MilitaryManagement.payload.response.MilitaryResponse;
import org.springframework.http.ResponseEntity;

public interface QuanNhanService {
    ResponseEntity<MilitaryResponse> save(MilitaryRequest request) throws Exception;
}

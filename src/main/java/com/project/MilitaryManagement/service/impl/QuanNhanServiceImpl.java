package com.project.MilitaryManagement.service.impl;

import com.project.MilitaryManagement.payload.request.MilitaryRequest;
import com.project.MilitaryManagement.payload.response.MilitaryResponse;
import com.project.MilitaryManagement.service.QuanNhanService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class QuanNhanServiceImpl implements QuanNhanService {
    @Override
    public ResponseEntity<MilitaryResponse> save(MilitaryRequest request) throws Exception {
        return null;
    }
}

package com.project.MilitaryManagement.service.impl;

import com.project.MilitaryManagement.entity.TieuDoan;
import com.project.MilitaryManagement.mapper.TieuDoanMapper;
import com.project.MilitaryManagement.payload.request.QuanNhanRequest;
import com.project.MilitaryManagement.payload.request.TieuDoanRequest;
import com.project.MilitaryManagement.payload.response.TieuDoanResponse;
import com.project.MilitaryManagement.repository.TieuDoanRepository;
import com.project.MilitaryManagement.repository.TieuDoiRepository;
import com.project.MilitaryManagement.service.TieuDoanService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TieuDoanServiceImpl implements TieuDoanService {
    private final TieuDoanRepository tieuDoanRepository;
    private final TieuDoanMapper tieuDoanMapper;

    @Override
    public ResponseEntity<TieuDoanResponse> save(TieuDoanRequest request) throws Exception {
        TieuDoan tieuDoan = tieuDoanMapper.toTieuDoan(request);
        tieuDoan.setStatus(1);
        TieuDoan result = tieuDoanRepository.save(tieuDoan);
        TieuDoanResponse tieuDoanResponse = tieuDoanMapper.toTieuDoanResponse(result);
        return ResponseEntity.accepted().body(tieuDoanResponse);
    }

    @Override
    public List<TieuDoan> findAllByStatus(int status) {
        List<TieuDoan> tieuDoanList = tieuDoanRepository.findAllByStatus(status);
        return tieuDoanList.isEmpty() ? null : tieuDoanList;
    }
}

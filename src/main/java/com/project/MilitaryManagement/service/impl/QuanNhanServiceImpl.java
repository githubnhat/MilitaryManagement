package com.project.MilitaryManagement.service.impl;

import com.project.MilitaryManagement.entity.Military;
import com.project.MilitaryManagement.entity.QuanNhan;
import com.project.MilitaryManagement.mapper.MilitaryMapper;
import com.project.MilitaryManagement.mapper.QuanNhanMapper;
import com.project.MilitaryManagement.payload.request.MilitaryRequest;
import com.project.MilitaryManagement.payload.request.QuanNhanRequest;
import com.project.MilitaryManagement.payload.response.MilitaryResponse;
import com.project.MilitaryManagement.payload.response.QuanNhanResponse;
import com.project.MilitaryManagement.repository.MilitaryRepository;
import com.project.MilitaryManagement.repository.QuanNhanRepository;
import com.project.MilitaryManagement.service.QuanNhanService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QuanNhanServiceImpl implements QuanNhanService {

    private final QuanNhanRepository quanNhanRepository;
    private final QuanNhanMapper quanNhanMapper;
    @Override
    public ResponseEntity<QuanNhanResponse> save(QuanNhanRequest request) throws Exception {
        QuanNhan quanNhan = quanNhanMapper.toQuanNhan(request);
        quanNhan.setStatus(1);
        QuanNhanResponse quanNhanResponse = quanNhanMapper.toQuanNhanResponse(quanNhanRepository.save(quanNhan));
        return ResponseEntity.accepted().body(quanNhanResponse);
    }

    @Override
    public QuanNhan findQuanNhanById(Long id) {
        return quanNhanRepository.findQuanNhanByIdAndStatus(id,1);
    }

    @Override
    public List<QuanNhan> findAllByStatus(int status) {
        List<QuanNhan> quanNhans = quanNhanRepository.findAllByStatus(status);
        return quanNhans;
    }

    @Override
    public List<QuanNhan> searchByKeyword(String keyword) {
        return quanNhanRepository.searchByKeyword(keyword);
    }


}

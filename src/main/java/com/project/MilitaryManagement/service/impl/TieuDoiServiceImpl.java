package com.project.MilitaryManagement.service.impl;

import com.project.MilitaryManagement.entity.TieuDoi;
import com.project.MilitaryManagement.entity.TrungDoi;
import com.project.MilitaryManagement.mapper.TieuDoiMapper;
import com.project.MilitaryManagement.payload.request.TieuDoiRequest;
import com.project.MilitaryManagement.payload.response.TieuDoiResponse;
import com.project.MilitaryManagement.payload.response.TrungDoiResponse;
import com.project.MilitaryManagement.repository.TieuDoiRepository;
import com.project.MilitaryManagement.repository.TrungDoiRepository;
import com.project.MilitaryManagement.service.TieuDoiService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TieuDoiServiceImpl implements TieuDoiService {

    private final TieuDoiRepository tieuDoiRepository;
    private final TieuDoiMapper tieuDoiMapper;
    private final TrungDoiRepository trungDoiRepository;

    @Override
    public ResponseEntity<TieuDoiResponse> save(TieuDoiRequest request) throws Exception {
        TieuDoi tieuDoi = tieuDoiMapper.toTieuDoi(request);
        if (request.trungDoi() != null) {
            TrungDoi trungDoi = trungDoiRepository.findById(request.trungDoi())
                    .orElseThrow(() -> new Exception("Trung đội không tồn tại"));
            tieuDoi.setTrungDoi(trungDoi); // Gán đối tượng Entity vào
        }
        tieuDoi.setStatus(1);
        TieuDoi result = tieuDoiRepository.save(tieuDoi);
        return ResponseEntity.accepted().body(tieuDoiMapper.toTieuDoiResponse(result));
    }

    @Override
    public List<TieuDoi> findAllByStatus(int status) {
        List<TieuDoi> list = tieuDoiRepository.findAllByStatus(status);
        return list.isEmpty() ? null : list;
    }


}


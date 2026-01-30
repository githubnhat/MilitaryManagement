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
import org.springframework.http.HttpStatus;
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

    // Cập nhật trong TieuDoiServiceImpl
    @Override
    public ResponseEntity<TieuDoiResponse> update(TieuDoiRequest request) throws Exception {
        // 1. Kiểm tra ID trực tiếp từ Record
        if (request.id() == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

        // 2. Tìm bản ghi cũ
        TieuDoi existing = tieuDoiRepository.findById(request.id())
                .orElseThrow(() -> new Exception("Tiểu đội không tồn tại"));

        // 3. Map dữ liệu
        TieuDoi entity = tieuDoiMapper.toTieuDoi(request);

        // 4. Đồng bộ ID và Status (Fix lỗi Hibernate findById is null)
        entity.setId(request.id());
        entity.setStatus(existing.getStatus());

        // 5. Cập nhật Trung đội trực thuộc
        if (request.trungDoi() != null) {
            TrungDoi trungDoi = trungDoiRepository.findById(request.trungDoi())
                    .orElseThrow(() -> new Exception("Trung đội không tồn tại"));
            entity.setTrungDoi(trungDoi);
        }

        TieuDoi updated = tieuDoiRepository.save(entity);
        return ResponseEntity.accepted().body(tieuDoiMapper.toTieuDoiResponse(updated));
    }

    @Override
    public boolean delete(long[] ids) {
        for (long id : ids) {
            tieuDoiRepository.findById(id).ifPresent(td -> {
                td.setStatus(0); // Xóa mềm
                tieuDoiRepository.save(td);
            });
        }
        return true;
    }

    @Override
    public List<TieuDoi> findByTrungDoi_IdAndStatus(Long tieuDoiId) {
        return tieuDoiRepository.findByTrungDoi_IdAndStatus(tieuDoiId, 1);
    }
}


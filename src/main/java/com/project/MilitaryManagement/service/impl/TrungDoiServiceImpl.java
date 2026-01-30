package com.project.MilitaryManagement.service.impl;

import com.project.MilitaryManagement.entity.DaiDoi;
import com.project.MilitaryManagement.entity.TrungDoi;
import com.project.MilitaryManagement.mapper.TrungDoiMapper;
import com.project.MilitaryManagement.payload.request.TrungDoiRequest;
import com.project.MilitaryManagement.payload.response.TrungDoiResponse;
import com.project.MilitaryManagement.repository.DaiDoiRepository;
import com.project.MilitaryManagement.repository.TrungDoiRepository;
import com.project.MilitaryManagement.service.TrungDoiService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TrungDoiServiceImpl implements TrungDoiService {
    private final TrungDoiRepository trungDoiRepository;
    private final TrungDoiMapper trungDoiMapper;
    private final DaiDoiRepository daiDoiRepository;

    @Override
    public ResponseEntity<TrungDoiResponse> save(TrungDoiRequest request) throws Exception {
        TrungDoi trungDoi = trungDoiMapper.toTrungDoi(request);

        // Gán Đại đội trực thuộc
        if (request.daiDoi() != null) {
            DaiDoi daiDoi = daiDoiRepository.findById(request.daiDoi())
                    .orElseThrow(() -> new Exception("Đại đội không tồn tại"));
            trungDoi.setDaiDoi(daiDoi);
        }

        trungDoi.setStatus(1);
        return ResponseEntity.ok(trungDoiMapper.toTrungDoiResponse(trungDoiRepository.save(trungDoi)));
    }

    @Override
    public List<TrungDoi> findAllByStatus(int status) {
        List<TrungDoi> list = trungDoiRepository.findAllByStatus(status);
        return list.isEmpty() ? null : list; // Logic giống TieuDoanServiceImpl
    }

    @Override
    public List<TrungDoi> findByDaiDoi_IdAndStatus(Long daiDoiId) {
        return trungDoiRepository.findByDaiDoi_IdAndStatus(daiDoiId, 1);
    }

    @Override
    public ResponseEntity<TrungDoiResponse> update(TrungDoiRequest request) throws Exception {
        // 1. Kiểm tra ID trực tiếp từ Record (tránh lỗi mapper)
        if (request.id() == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

        // 2. Tìm bản ghi cũ để giữ status và kiểm tra tồn tại
        TrungDoi existing = trungDoiRepository.findById(request.id())
                .orElseThrow(() -> new Exception("Trung đội không tồn tại"));

        // 3. Map request sang entity
        TrungDoi entity = trungDoiMapper.toTrungDoi(request);

        // 4. Ép ID và Status vào entity
        entity.setId(request.id());
        entity.setStatus(existing.getStatus());

        // 5. Cập nhật Đại đội trực thuộc
        if (request.daiDoi() != null) {
            DaiDoi daiDoi = daiDoiRepository.findById(request.daiDoi())
                    .orElseThrow(() -> new Exception("Đại đội không tồn tại"));
            entity.setDaiDoi(daiDoi);
        }

        TrungDoi updated = trungDoiRepository.save(entity);
        return ResponseEntity.accepted().body(trungDoiMapper.toTrungDoiResponse(updated));
    }

    @Override
    public boolean delete(long[] ids) {
        for (long id : ids) {
            trungDoiRepository.findById(id).ifPresent(td -> {
                td.setStatus(0); // Xóa mềm
                trungDoiRepository.save(td);
            });
        }
        return true;
    }
}
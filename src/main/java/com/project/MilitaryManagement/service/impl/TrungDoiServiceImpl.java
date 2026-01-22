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
        if (request.daiDoi() != null) {
            DaiDoi daiDoiCha = daiDoiRepository.findById(request.daiDoi())
                    .orElseThrow(() -> new Exception("Không tìm thấy Đại đội!"));

            // 3. Gán đối tượng vào (Đây là bước quyết định việc lưu DB)
            trungDoi.setDaiDoi(daiDoiCha);
        }
        trungDoi.setStatus(1); // Mặc định status là 1 giống TieuDoanServiceImpl
        TrungDoi result = trungDoiRepository.save(trungDoi);
        return ResponseEntity.accepted().body(trungDoiMapper.toTrungDoiResponse(result));
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
}
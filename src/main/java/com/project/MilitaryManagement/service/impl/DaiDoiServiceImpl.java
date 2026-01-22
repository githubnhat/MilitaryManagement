package com.project.MilitaryManagement.service.impl;

import com.project.MilitaryManagement.entity.DaiDoi;
import com.project.MilitaryManagement.entity.TieuDoan;
import com.project.MilitaryManagement.mapper.DaiDoiMapper;
import com.project.MilitaryManagement.payload.request.DaiDoiRequest;
import com.project.MilitaryManagement.payload.response.DaiDoiResponse;
import com.project.MilitaryManagement.repository.DaiDoiRepository;
import com.project.MilitaryManagement.repository.TieuDoanRepository;
import com.project.MilitaryManagement.service.DaiDoiService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class DaiDoiServiceImpl implements DaiDoiService {
    private final DaiDoiRepository daiDoiRepository;
    private final DaiDoiMapper daiDoiMapper;
    private final TieuDoanRepository tieuDoanRepository;
    @Override
    public ResponseEntity<DaiDoiResponse> save(DaiDoiRequest request) throws Exception {
        DaiDoi daiDoi = daiDoiMapper.toDaiDoi(request);

        // Tìm và set TieuDoan cho DaiDoi dựa vào id gửi lên từ select field
        if (request.tieuDoan() != null) {
            TieuDoan tieuDoan = tieuDoanRepository.findById(request.tieuDoan())
                    .orElseThrow(() -> new Exception("Tiểu đoàn không tồn tại"));
            daiDoi.setTieuDoan(tieuDoan);
        }

        daiDoi.setStatus(1);
        DaiDoi result = daiDoiRepository.save(daiDoi);
        return ResponseEntity.accepted().body(daiDoiMapper.toDaiDoiResponse(result));
    }

    @Override
    public List<DaiDoi> findAllByStatus(int status) {
        return daiDoiRepository.findAllByStatus(status);
    }

    @Override
    public List<DaiDoi> findByTieuDoanId(Long tieuDoanId) {

        return daiDoiRepository.findByTieuDoanIdAndStatus(tieuDoanId, 1);
    }
}
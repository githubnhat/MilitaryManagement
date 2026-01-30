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
import org.springframework.http.HttpStatus;
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
    // Trong DaiDoiServiceImpl.java

    @Override
    public ResponseEntity<DaiDoiResponse> update(DaiDoiRequest request) throws Exception {
        // 1. Kiểm tra ID trực tiếp từ Record
        if (request.id() == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

        // 2. Tìm bản ghi hiện tại trong DB để đảm bảo nó tồn tại
        DaiDoi existing = daiDoiRepository.findById(request.id())
                .orElseThrow(() -> new Exception("Đại đội không tồn tại"));

        // 3. Map dữ liệu từ request sang entity
        DaiDoi entity = daiDoiMapper.toDaiDoi(request);

        // 4. QUAN TRỌNG: Gán lại ID thủ công vì Record không có getId() cho Mapper
        entity.setId(request.id());
        entity.setStatus(existing.getStatus()); // Giữ nguyên trạng thái cũ

        // 5. Xử lý gán Tiểu đoàn (nếu trong request có id tiểu đoàn)
        if (request.tieuDoan() != null) {
            TieuDoan tieuDoan = tieuDoanRepository.findById(request.tieuDoan())
                    .orElseThrow(() -> new Exception("Tiểu đoàn không tồn tại"));
            entity.setTieuDoan(tieuDoan);
        }

        DaiDoi result = daiDoiRepository.save(entity);
        return ResponseEntity.accepted().body(daiDoiMapper.toDaiDoiResponse(result));
    }

    @Override
    public boolean delete(long[] ids) {
        try {
            for (long id : ids) {
                daiDoiRepository.findById(id).ifPresent(dd -> {
                    dd.setStatus(0); // Xóa mềm
                    daiDoiRepository.save(dd);
                });
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
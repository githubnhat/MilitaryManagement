package com.project.MilitaryManagement.service.impl;


import com.project.MilitaryManagement.entity.TieuDoan;
import com.project.MilitaryManagement.mapper.TieuDoanMapper;
import com.project.MilitaryManagement.payload.request.TieuDoanRequest;
import com.project.MilitaryManagement.payload.response.TieuDoanResponse;
import com.project.MilitaryManagement.repository.TieuDoanRepository;
import com.project.MilitaryManagement.service.TieuDoanService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
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

    public ResponseEntity<TieuDoanResponse> update(TieuDoanRequest request) throws Exception {
        // 1. Kiểm tra ID trực tiếp từ Record request
        if (request.id() == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

        // 2. Map từ Request sang Entity
        TieuDoan entity = tieuDoanMapper.toTieuDoan(request);

        // 3. CƯỠNG ÉP gán ID (Vì Mapper có thể đang không hiểu Record getter)
        entity.setId(request.id());

        // 4. Tìm kiếm trong DB
        TieuDoan existing = tieuDoanRepository.findTieuDoanByIdAndStatus(entity.getId(), 1);

        if (existing == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

        // 5. Cập nhật các thông tin khác
        existing.setTenTieuDoan(request.tenTieuDoan());

        // 6. Lưu và trả về
        TieuDoan tieuDoanUpdated = tieuDoanRepository.save(existing);
        return ResponseEntity.accepted().body(tieuDoanMapper.toTieuDoanResponse(tieuDoanUpdated));
    }

    @Override
    public boolean delete(long[] ids) {
        boolean flag = true;
        for (long id : ids) {
            TieuDoan tieuDoan = tieuDoanRepository.findTieuDoanByIdAndStatus(id, 1);
            TieuDoan tieuDoanUpdated = new TieuDoan();
            if (tieuDoan != null) {
                tieuDoan.setStatus(0);
                tieuDoanUpdated = tieuDoanRepository.save(tieuDoan);
            }
            if (tieuDoanUpdated == null) {
                flag = false;
                return flag;
            }
        }
        return flag;
    }
}

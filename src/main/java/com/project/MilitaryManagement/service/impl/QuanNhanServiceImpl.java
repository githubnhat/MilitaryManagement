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
import org.springframework.http.HttpStatus;
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

    @Override
    public ResponseEntity<QuanNhanResponse> update(QuanNhanRequest request) throws Exception {
        QuanNhan entity = quanNhanMapper.toQuanNhan(request);
        QuanNhan quanNhan = quanNhanRepository.findQuanNhanByIdAndStatus(entity.getId(),1);
        entity.setStatus(quanNhan.getStatus());
        QuanNhan quanNhanUpdated = new QuanNhan();
        if (quanNhan != null) {
            quanNhanUpdated = quanNhanRepository.save(entity);
        }
        if (quanNhanUpdated != null) {
            QuanNhanResponse quanNhanResponse = quanNhanMapper.toQuanNhanResponse(quanNhanUpdated);
            return ResponseEntity.accepted().body(quanNhanResponse);
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    }

    @Override
    public boolean delete(long[] ids) {
        boolean flag = true;
        for (long id : ids) {
            QuanNhan quanNhan = quanNhanRepository.findQuanNhanByIdAndStatus(id, 1);
            QuanNhan quanNhanUpdated = new QuanNhan();
            if (quanNhan != null) {
                quanNhan.setStatus(0);
                quanNhanUpdated = quanNhanRepository.save(quanNhan);
            }
            if (quanNhanUpdated == null) {
                flag = false;
                return flag;
            }
        }
        return flag;
    }

}

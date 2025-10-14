package com.project.MilitaryManagement.service.impl;

import com.project.MilitaryManagement.entity.Military;
import com.project.MilitaryManagement.mapper.MilitaryMapper;
import com.project.MilitaryManagement.payload.request.MilitaryRequest;
import com.project.MilitaryManagement.payload.response.MilitaryResponse;
import com.project.MilitaryManagement.repository.MilitaryRepository;
import com.project.MilitaryManagement.service.MilitaryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MilitaryServiceImpl implements MilitaryService {

    private final MilitaryRepository militaryRepository;
    private final MilitaryMapper militaryMapper;
    @Override
    public ResponseEntity<MilitaryResponse> save(MilitaryRequest request) throws Exception {
        Military military = militaryMapper.toMilitary(request);
        military.setStatus(1);
        MilitaryResponse militaryResponse = militaryMapper.toMilitaryResponse(militaryRepository.save(military));
        return ResponseEntity.accepted().body(militaryResponse);
    }

    @Override
    public List<Military> findAllByStatus(int status) {
        List<Military> militaries = militaryRepository.findAllByStatus(status);
        return militaries;
    }

    @Override
    public Military findMilitaryById(Long id) {
        return militaryRepository.findMilitaryByIdAndStatus(id,1);
    }

    @Override
    public ResponseEntity<MilitaryResponse> update(MilitaryRequest request) throws Exception {
        Military entity = militaryMapper.toMilitary(request);
        Military military = militaryRepository.findMilitaryByIdAndStatus(entity.getId(),1);
        entity.setStatus(military.getStatus());
        Military militaryUpdated = new Military();
        if (military != null) {
            militaryUpdated = militaryRepository.save(entity);
        }
        if (militaryUpdated != null) {
            MilitaryResponse militaryResponse = militaryMapper.toMilitaryResponse(militaryUpdated);
            return ResponseEntity.accepted().body(militaryResponse);
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    }

    @Override
    public List<Military> searchByKeyword(String keyword) {
        return militaryRepository.searchByKeyword(keyword);
    }

    @Override
    public boolean delete(long[] ids) {
        boolean flag = true;
        for (long id : ids) {
            Military military = militaryRepository.findMilitaryByIdAndStatus(id, 1);
            Military militaryUpdated = new Military();
            if (military != null) {
                military.setStatus(0);
                militaryUpdated = militaryRepository.save(military);
            }
            if (militaryUpdated == null) {
                flag = false;
                return flag;
            }
        }
        return flag;
    }
}

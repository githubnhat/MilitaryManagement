package com.project.MilitaryManagement.service;

import com.project.MilitaryManagement.entity.Military;
import com.project.MilitaryManagement.payload.request.MilitaryRequest;
import com.project.MilitaryManagement.payload.response.MilitaryResponse;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface MilitaryService {
    ResponseEntity<MilitaryResponse> save(MilitaryRequest request) throws Exception;
    List<Military> findAllByStatus(int status);
    Military findMilitaryById(Long id);
    ResponseEntity<MilitaryResponse> update(MilitaryRequest request) throws Exception;

}

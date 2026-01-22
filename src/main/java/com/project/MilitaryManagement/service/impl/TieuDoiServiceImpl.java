package com.project.MilitaryManagement.service.impl;

import com.project.MilitaryManagement.entity.TieuDoi;
import com.project.MilitaryManagement.repository.TieuDoiRepository;
import com.project.MilitaryManagement.service.TieuDoiService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TieuDoiServiceImpl implements TieuDoiService {

    private final TieuDoiRepository tieuDoiRepository;

    @Override
    public List<TieuDoi> findAll() {
        List<TieuDoi> tieuDoiList = new ArrayList<>();
        tieuDoiList = tieuDoiRepository.findAll();
        return tieuDoiList.isEmpty() ? null : tieuDoiList;
    }
}


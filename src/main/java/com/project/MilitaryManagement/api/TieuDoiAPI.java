package com.project.MilitaryManagement.api;

import com.project.MilitaryManagement.entity.TieuDoan;
import com.project.MilitaryManagement.entity.TieuDoi;
import com.project.MilitaryManagement.entity.TrungDoi;
import com.project.MilitaryManagement.mapper.TieuDoanMapper;
import com.project.MilitaryManagement.mapper.TieuDoiMapper;
import com.project.MilitaryManagement.payload.request.TieuDoiRequest;
import com.project.MilitaryManagement.payload.response.TieuDoiResponse;
import com.project.MilitaryManagement.payload.response.TrungDoiResponse;
import com.project.MilitaryManagement.service.TieuDoiService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/tieu-doi")
public class TieuDoiAPI {
    private final TieuDoiService tieuDoiService;
    private final TieuDoanMapper tieuDoanMapper;
    private final TieuDoiMapper tieuDoiMapper;

    @PostMapping("/tao-tieu-doi")
    public ResponseEntity<TieuDoiResponse> taoTieuDoi(@RequestBody TieuDoiRequest request) throws Exception {
        return tieuDoiService.save(request);
    }
    @PostMapping("/cap-nhat-tieu-doi")
    public ResponseEntity<TieuDoiResponse> capNhatTieuDoi(@RequestBody TieuDoiRequest request) throws Exception {
        return tieuDoiService.update(request);
    }

    @PostMapping("/xoa-tieu-doi")
    public ResponseEntity<?> xoaTieuDoi(@RequestBody TieuDoiRequest request) throws Exception {
        boolean result = tieuDoiService.delete(request.ids());
        return ResponseEntity.ok(result);
    }

    @GetMapping("/lay-theo-trung-doi/{trungDoiId}")
    public ResponseEntity<List<TieuDoiResponse>> getByTrungDoi(@PathVariable Long trungDoiId) {
        List<TieuDoi> list = tieuDoiService.findByTrungDoi_IdAndStatus(trungDoiId);
        return ResponseEntity.ok(list.stream().map(tieuDoiMapper::toTieuDoiResponse).toList());
    }
}
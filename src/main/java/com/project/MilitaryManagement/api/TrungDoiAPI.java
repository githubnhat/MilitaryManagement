package com.project.MilitaryManagement.api;

import com.project.MilitaryManagement.entity.TrungDoi;
import com.project.MilitaryManagement.mapper.TrungDoiMapper;
import com.project.MilitaryManagement.payload.request.TrungDoiRequest;
import com.project.MilitaryManagement.payload.response.TrungDoiResponse;
import com.project.MilitaryManagement.service.TrungDoiService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/trung-doi")
public class TrungDoiAPI {
    private final TrungDoiService trungDoiService;
    private final TrungDoiMapper trungDoiMapper;

    @PostMapping("/tao-trung-doi")
    public ResponseEntity<TrungDoiResponse> taoTrungDoi(@RequestBody TrungDoiRequest request) throws Exception {
        return trungDoiService.save(request);
    }

    @GetMapping("/lay-theo-dai-doi/{daiDoiId}")
    public ResponseEntity<List<TrungDoiResponse>> getByDaiDoi(@PathVariable Long daiDoiId) {
        List<TrungDoi> list = trungDoiService.findByDaiDoi_IdAndStatus(daiDoiId);
        return ResponseEntity.ok(list.stream().map(trungDoiMapper::toTrungDoiResponse).toList());
    }
}
package com.project.MilitaryManagement.api;

import com.project.MilitaryManagement.entity.DaiDoi;
import com.project.MilitaryManagement.mapper.DaiDoiMapper;
import com.project.MilitaryManagement.payload.request.DaiDoiRequest;
import com.project.MilitaryManagement.payload.response.DaiDoiResponse;
import com.project.MilitaryManagement.service.DaiDoiService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/dai-doi")
public class DaiDoiAPI {

    private final DaiDoiService daiDoiService;
    private final DaiDoiMapper daiDoiMapper;

    @PostMapping("/tao-dai-doi")
    public ResponseEntity<DaiDoiResponse> taoDaiDoi(@RequestBody DaiDoiRequest request) throws Exception {
        return daiDoiService.save(request);
    }

    @GetMapping("/lay-theo-tieu-doan/{tieuDoanId}")
    public ResponseEntity<List<DaiDoiResponse>> getByTieuDoan(@PathVariable Long tieuDoanId) {
        List<DaiDoi> list = daiDoiService.findByTieuDoanId(tieuDoanId);
        // Chuyển đổi sang Response DTO bằng Mapper và trả về
        return ResponseEntity.ok(list.stream().map(daiDoiMapper::toDaiDoiResponse).toList());
    }
}
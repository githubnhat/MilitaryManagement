package com.project.MilitaryManagement.api;

import com.project.MilitaryManagement.payload.request.TieuDoiRequest;
import com.project.MilitaryManagement.payload.response.TieuDoiResponse;
import com.project.MilitaryManagement.service.TieuDoiService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/tieu-doi")
public class TieuDoiAPI {
    private final TieuDoiService tieuDoiService;

    @PostMapping("/tao-tieu-doi")
    public ResponseEntity<TieuDoiResponse> taoTieuDoi(@RequestBody TieuDoiRequest request) throws Exception {
        return tieuDoiService.save(request);
    }
}
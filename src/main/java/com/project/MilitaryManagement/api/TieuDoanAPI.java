package com.project.MilitaryManagement.api;

import com.project.MilitaryManagement.payload.request.QuanNhanRequest;
import com.project.MilitaryManagement.payload.request.TieuDoanRequest;
import com.project.MilitaryManagement.payload.response.QuanNhanResponse;
import com.project.MilitaryManagement.payload.response.TieuDoanResponse;
import com.project.MilitaryManagement.service.TieuDoanService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/tieu-doan")
public class TieuDoanAPI {
    private final TieuDoanService tieuDoanService;
    @PostMapping("/tao-tieu-doan")
    public ResponseEntity<TieuDoanResponse> taoTieuDoan(@RequestBody TieuDoanRequest request) throws Exception
    {
        return tieuDoanService.save(request);
    }

    @PostMapping("/cap-nhat-tieu-doan")
    public ResponseEntity<TieuDoanResponse> capNhatTieuDoan(@RequestBody TieuDoanRequest request) throws Exception
    {
        return tieuDoanService.update(request);
    }
    @PostMapping("/xoa-tieu-doan")
    public ResponseEntity<?> xoaTieuDoan(@RequestBody TieuDoanRequest request) throws Exception
    {
        Object data = tieuDoanService.delete(request.ids());
        return ResponseEntity.status(HttpStatus.OK).body(data);
    }
}

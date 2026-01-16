package com.project.MilitaryManagement.api;

import com.project.MilitaryManagement.entity.QuanNhan;
import com.project.MilitaryManagement.payload.request.MilitaryRequest;
import com.project.MilitaryManagement.payload.request.QuanNhanRequest;
import com.project.MilitaryManagement.payload.response.MilitaryResponse;
import com.project.MilitaryManagement.payload.response.QuanNhanResponse;
import com.project.MilitaryManagement.service.MilitaryService;
import com.project.MilitaryManagement.service.QuanNhanService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/quan-nhan")
public class QuanNhanAPI {
    private final QuanNhanService quanNhanService;
    @PostMapping("/tao-quan-nhan")
    public ResponseEntity<QuanNhanResponse> taoQuanNhan(@RequestBody QuanNhanRequest request) throws Exception
    {
        return quanNhanService.save(request);
    }

    @PostMapping("/cap-nhat-quan-nhan")
    public ResponseEntity<QuanNhanResponse> capNhatQuanNhan(@RequestBody QuanNhanRequest request) throws Exception
    {
        return quanNhanService.update(request);
    }

    @PostMapping("/xoa-quan-nhan")
    public ResponseEntity<?> xoaQuanNhan(@RequestBody QuanNhanRequest request) throws Exception
    {
        Object data = quanNhanService.delete(request.ids());
        return ResponseEntity.status(HttpStatus.OK).body(data);
    }
}

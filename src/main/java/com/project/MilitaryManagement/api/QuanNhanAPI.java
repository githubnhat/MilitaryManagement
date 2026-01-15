package com.project.MilitaryManagement.api;

import com.project.MilitaryManagement.payload.request.MilitaryRequest;
import com.project.MilitaryManagement.payload.response.MilitaryResponse;
import com.project.MilitaryManagement.service.MilitaryService;
import com.project.MilitaryManagement.service.QuanNhanService;
import lombok.RequiredArgsConstructor;
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
    @PostMapping("/tao-moi")
    public ResponseEntity<MilitaryResponse> taoQuanNhan(@RequestBody MilitaryRequest request) throws Exception
    {
        return quanNhanService.save(request);
    }
}

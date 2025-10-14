package com.project.MilitaryManagement.api;

import com.project.MilitaryManagement.payload.request.MilitaryRequest;
import com.project.MilitaryManagement.payload.response.MilitaryResponse;
import com.project.MilitaryManagement.service.MilitaryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/military")
public class MilitaryApi {

    private final MilitaryService militaryService;
    @PostMapping("/create")
    public ResponseEntity<MilitaryResponse> createMilitary(@RequestBody MilitaryRequest request) throws Exception
    {
        return militaryService.save(request);
    }
    @PostMapping("/modify")
    public ResponseEntity<MilitaryResponse> modifyMilitary(@RequestBody MilitaryRequest request) throws Exception
    {
        return militaryService.update(request);
    }

    @PostMapping("/delete")
    public ResponseEntity<?> deleteMilitary(@RequestBody MilitaryRequest request) throws Exception
    {
        Object data = militaryService.delete(request.ids());
        return ResponseEntity.status(HttpStatus.OK).body(data);
    }
}

package com.project.MilitaryManagement.mapper;

import com.project.MilitaryManagement.entity.Military;
import com.project.MilitaryManagement.entity.QuanNhan;
import com.project.MilitaryManagement.payload.request.MilitaryRequest;
import com.project.MilitaryManagement.payload.request.QuanNhanRequest;
import com.project.MilitaryManagement.payload.response.MilitaryResponse;
import com.project.MilitaryManagement.payload.response.QuanNhanResponse;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface QuanNhanMapper {
    QuanNhan toQuanNhan(QuanNhanRequest quanNhanRequest);
    QuanNhanResponse toQuanNhanResponse(QuanNhan quanNhan);
}

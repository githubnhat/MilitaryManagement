package com.project.MilitaryManagement.mapper;

import com.project.MilitaryManagement.entity.TieuDoan;
import com.project.MilitaryManagement.payload.request.TieuDoanRequest;
import com.project.MilitaryManagement.payload.response.TieuDoanResponse;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface TieuDoanMapper {
    TieuDoan toTieuDoan(TieuDoanRequest TieuDoanRequest);
    TieuDoanResponse toTieuDoanResponse(TieuDoan TieuDoan);
}

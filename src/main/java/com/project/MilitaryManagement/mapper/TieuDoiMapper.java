package com.project.MilitaryManagement.mapper;

import com.project.MilitaryManagement.entity.TieuDoi;
import com.project.MilitaryManagement.payload.request.TieuDoiRequest;
import com.project.MilitaryManagement.payload.response.TieuDoiResponse;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface TieuDoiMapper {
    @Mapping(target = "trungDoi", ignore = true)
    TieuDoi toTieuDoi(TieuDoiRequest request);
    TieuDoiResponse toTieuDoiResponse(TieuDoi entity);
}
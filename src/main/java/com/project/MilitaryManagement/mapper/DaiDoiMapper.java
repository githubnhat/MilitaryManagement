package com.project.MilitaryManagement.mapper;

import com.project.MilitaryManagement.entity.DaiDoi;
import com.project.MilitaryManagement.payload.request.DaiDoiRequest;
import com.project.MilitaryManagement.payload.response.DaiDoiResponse;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;


@Mapper(componentModel = "spring")
public interface DaiDoiMapper {
    @Mapping(target = "tieuDoan", ignore = true)
    DaiDoi toDaiDoi(DaiDoiRequest request);
    DaiDoiResponse toDaiDoiResponse(DaiDoi entity);
}
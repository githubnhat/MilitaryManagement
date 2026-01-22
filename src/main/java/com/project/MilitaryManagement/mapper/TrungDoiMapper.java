package com.project.MilitaryManagement.mapper;

import com.project.MilitaryManagement.entity.TrungDoi;
import com.project.MilitaryManagement.payload.request.TrungDoiRequest;
import com.project.MilitaryManagement.payload.response.TrungDoiResponse;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface TrungDoiMapper {

    @Mapping(target = "daiDoi", ignore = true)
    TrungDoi toTrungDoi(TrungDoiRequest request);

    TrungDoiResponse toTrungDoiResponse(TrungDoi entity);
}
package com.project.MilitaryManagement.mapper;

import com.project.MilitaryManagement.entity.Military;
import com.project.MilitaryManagement.payload.request.MilitaryRequest;
import com.project.MilitaryManagement.payload.response.MilitaryResponse;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface MilitaryMapper {
    Military toMilitary(MilitaryRequest militaryRequest);
    MilitaryResponse toMilitaryResponse(Military military);
}

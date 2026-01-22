package com.project.MilitaryManagement.payload.response;

import lombok.With;

@With
public record DaiDoiResponse (
        Long id,
        String tenDaiDoi
) {
}
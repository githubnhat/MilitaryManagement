package com.project.MilitaryManagement.payload.request;

import lombok.With;

@With
public record DaiDoiRequest(
        Long id,
        String tenDaiDoi,
        Long tieuDoan,
        long[] ids
) {
}
package com.project.MilitaryManagement.payload.response;

import lombok.With;

@With
public record TieuDoiResponse (
        Long id,
        String tenTieuDoi
) {
}
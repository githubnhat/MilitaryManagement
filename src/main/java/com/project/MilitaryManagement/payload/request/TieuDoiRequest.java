package com.project.MilitaryManagement.payload.request;

import lombok.With;

@With
public record TieuDoiRequest (
        Long id,
        String tenTieuDoi,
        Long trungDoi,
        long [] ids
) {
}
package com.project.MilitaryManagement.payload.request;

import lombok.With;

@With
public record TieuDoanRequest (
        Long id,
        String tenTieuDoan,
        long [] ids) {
}

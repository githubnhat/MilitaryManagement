package com.project.MilitaryManagement.payload.response;

import lombok.With;

@With
public record TieuDoanResponse (
        Long id,
        String tenTieuDoan) {
}

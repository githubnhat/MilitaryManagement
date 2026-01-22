package com.project.MilitaryManagement.payload.request;

import lombok.With;

@With
public record TieuDoiRequest (
        String tenTieuDoi,
        Long trungDoi // ID của Trung đội trực thuộc
) {
}
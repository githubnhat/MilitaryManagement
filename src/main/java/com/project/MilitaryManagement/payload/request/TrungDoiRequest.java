package com.project.MilitaryManagement.payload.request;

import lombok.With;

@With
public record TrungDoiRequest (
        String tenTrungDoi,
        Long daiDoi // ID của Đại đội trực thuộc
) {
}
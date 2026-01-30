package com.project.MilitaryManagement.payload.request;

import lombok.With;

@With
public record TrungDoiRequest (
        Long id,
        String tenTrungDoi,
        Long daiDoi,
        long [] ids
) {
}
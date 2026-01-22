package com.project.MilitaryManagement.payload.response;

import lombok.With;

@With
public record TrungDoiResponse (
        Long id,
        String tenTrungDoi
) {
}
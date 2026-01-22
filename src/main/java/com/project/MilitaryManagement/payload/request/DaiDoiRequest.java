package com.project.MilitaryManagement.payload.request;

import lombok.With;

@With
public record DaiDoiRequest (
    String tenDaiDoi,
    Long tieuDoan
){}
package com.project.MilitaryManagement.config;

import com.project.MilitaryManagement.mapper.MilitaryMapper;
import org.mapstruct.factory.Mappers;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

    @Bean
    public MilitaryMapper militaryMapper() {
        return Mappers.getMapper(MilitaryMapper.class);
    }
}
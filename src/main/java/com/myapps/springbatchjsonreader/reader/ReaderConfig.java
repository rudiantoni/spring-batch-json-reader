package com.myapps.springbatchjsonreader.reader;

import com.myapps.springbatchjsonreader.domain.Trade;
import org.springframework.batch.item.json.JacksonJsonObjectReader;
import org.springframework.batch.item.json.JsonItemReader;
import org.springframework.batch.item.json.builder.JsonItemReaderBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;

@Configuration
public class ReaderConfig {

    private final String resourceFilePath;

    public ReaderConfig(@Value("${source.data.file.path}") String resourceFilePath) {
        this.resourceFilePath = resourceFilePath;
    }

    @Bean
    public JsonItemReader<Trade> jsonReader() {
        return new JsonItemReaderBuilder<Trade>()
            .jsonObjectReader(new JacksonJsonObjectReader<>(Trade.class))
            .resource(new FileSystemResource(resourceFilePath))
            .name("jsonReader")
            .build();
    }
}

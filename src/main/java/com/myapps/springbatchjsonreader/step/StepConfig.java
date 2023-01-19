package com.myapps.springbatchjsonreader.step;

import com.myapps.springbatchjsonreader.domain.Trade;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.item.ItemWriter;
import org.springframework.batch.item.json.JsonItemReader;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class StepConfig {

    private final StepBuilderFactory stepBuilderFactory;

    public StepConfig(StepBuilderFactory stepBuilderFactory) {
        this.stepBuilderFactory = stepBuilderFactory;
    }

    @Bean
    public Step step(JsonItemReader<Trade> jsonReader, ItemWriter<Trade> jsonWriter) {
        return stepBuilderFactory
            .get("step")
            .<Trade, Trade>chunk(1)
            .reader(jsonReader)
            .writer(jsonWriter)
            .build();
    }
}

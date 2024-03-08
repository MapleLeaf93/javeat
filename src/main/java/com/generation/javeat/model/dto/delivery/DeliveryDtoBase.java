package com.generation.javeat.model.dto.delivery;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder

public class DeliveryDtoBase {
    private int distance;
    private LocalDateTime expected_arrival;
    private String payment_method;
    private String notes;
}

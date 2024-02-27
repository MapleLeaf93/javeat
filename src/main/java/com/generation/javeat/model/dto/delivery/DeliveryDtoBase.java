package com.generation.javeat.model.dto.delivery;

import java.time.LocalTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder

public class DeliveryDtoBase 
{
    private int distance;
    private LocalTime expected_arrival;
    private String paymentMethod;
    private String notes;
}

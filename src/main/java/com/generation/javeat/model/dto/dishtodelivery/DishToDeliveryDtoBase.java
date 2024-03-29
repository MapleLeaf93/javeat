package com.generation.javeat.model.dto.dishtodelivery;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder

public class DishToDeliveryDtoBase {
    private int quantity;
    private String added_ingredients;
    private String removed_ingredients;
}

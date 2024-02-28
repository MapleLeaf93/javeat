package com.generation.javeat.model.dto.dishtodelivery;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class DishToDeliveryDtoR extends DishToDeliveryDtoBase {

    private Integer dish_id;
    private Integer delivery_id;
}

package com.generation.javeat.model.dto.dishtodelivery;

import lombok.Data;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@Data

public class DishToDeliveryDtoR extends DishToDeliveryDtoBase
{
    public DishToDeliveryDtoR(){}
    private Integer id;
}

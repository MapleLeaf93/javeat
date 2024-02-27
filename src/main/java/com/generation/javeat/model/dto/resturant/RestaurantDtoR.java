package com.generation.javeat.model.dto.resturant;

import lombok.Data;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@Data

public class RestaurantDtoR extends ResturantDtoBase
{
    public RestaurantDtoR(){}
    private Integer id;
}

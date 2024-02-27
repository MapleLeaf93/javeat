package com.generation.javeat.model.dto.dish;

import lombok.Data;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@Data

public class DishDtoR extends DishDtoBase
{
    public DishDtoR(){}
    private Integer id;
}

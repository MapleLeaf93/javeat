package com.generation.javeat.model.dto.delivery;

import lombok.Data;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@Data

public class DeliveryDtoR extends DeliveryDtoBase
{
    public DeliveryDtoR(){}
    private Integer id;
}

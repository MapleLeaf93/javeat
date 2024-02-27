package com.generation.javeat.model.dto.resturant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder

public class ResturantDtoBase 
{
    private String name,phone;
    private int openingHour,closingHour,positionX,positionY;
    
}

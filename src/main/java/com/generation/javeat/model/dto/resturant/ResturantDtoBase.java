package com.generation.javeat.model.dto.resturant;

import java.time.LocalTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder

public class ResturantDtoBase {
    private String name, phone, imgUrl;
    private LocalTime openingHour, closingHour;
    private int positionX, positionY;

}

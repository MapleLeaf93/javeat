package com.generation.javeat.model.dto.resturant;

import java.time.LocalTime;
import java.util.List;
import java.util.Set;

import com.generation.javeat.entities.Dish;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class RestaurantDtoWFull extends ResturantDtoBase {

    Integer id;
    String name, phone, imgUrl;
    private List<String> foodTypes;
    LocalTime openingHour, closingHour;
    int distance;
    Set<Dish> menu;

}

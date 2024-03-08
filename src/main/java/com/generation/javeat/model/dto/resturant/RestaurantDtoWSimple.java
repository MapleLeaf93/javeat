package com.generation.javeat.model.dto.resturant;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class RestaurantDtoWSimple {

    Integer id;
    String name, imgUrl;
    private List<String> foodTypes;
    boolean isOpen;
    private int maxDeliveryDistance;
    int distance;

}

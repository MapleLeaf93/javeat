package com.generation.javeat.model.dtoservices;

import org.springframework.stereotype.Service;

import com.generation.javeat.entities.Restaurant;
import com.generation.javeat.model.dto.resturant.RestaurantDtoWSimple;

@Service
public class RestaurantConverter {

    public RestaurantDtoWSimple restaurantToDtoWSimple(Restaurant r) {

        return RestaurantDtoWSimple
                .builder()
                .name(r.getName())
                .imgUrl(r.getImgUrl())
                .foodTypes(r.getFoodTypes())
                .isOpen(isOpen(r))
                .distance(calculateDistance(r))
                .build();
    }

    private int calculateDistance(Restaurant r) {

        return 10;
    }

    private boolean isOpen(Restaurant r) {

        return true;
    }
}

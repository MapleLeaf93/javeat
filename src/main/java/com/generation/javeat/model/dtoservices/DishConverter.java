package com.generation.javeat.model.dtoservices;

import org.springframework.stereotype.Service;

import com.generation.javeat.model.dto.dish.DishDtoR;
import com.generation.javeat.model.entities.Dish;

@Service
public class DishConverter {

    public Dish dtoRToDish(DishDtoR dto) {

        return Dish
                .builder()
                .id(dto.getId())
                .ingredients(dto.getIngredients())
                .build();
    }
}

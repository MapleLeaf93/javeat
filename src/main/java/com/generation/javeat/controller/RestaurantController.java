package com.generation.javeat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.generation.javeat.model.dto.resturant.RestaurantDtoWSimple;
import com.generation.javeat.model.dtoservices.RestaurantConverter;
import com.generation.javeat.repositories.RestaurantRepository;

@RestController
public class RestaurantController {

    @Autowired
    RestaurantRepository rRepo;

    @Autowired
    RestaurantConverter rConv;

    @GetMapping("/restaurants")
    public List<RestaurantDtoWSimple> getAllRestaurants() {

        return rRepo.findAll().stream().map(i -> rConv.restaurantToDtoWSimple(i)).toList();
    }
}

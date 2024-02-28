package com.generation.javeat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.generation.javeat.model.dto.dish.DishDtoR;
import com.generation.javeat.model.dto.dishtodelivery.DishToDeliveryDtoR;
import com.generation.javeat.model.dtoservices.DishConverter;
import com.generation.javeat.model.dtoservices.DishToDeliveryConverter;
import com.generation.javeat.model.entities.Dish;
import com.generation.javeat.model.entities.DishToDelivery;
import com.generation.javeat.repositories.DishRepository;
import com.generation.javeat.repositories.DishToDeliveryRepository;

@RestController
public class DishToDeliverycontroller {

    @Autowired
    DishRepository dRepo;

    @Autowired
    DishToDeliveryRepository dtdRepo;

    @Autowired
    DishConverter dConv;

    @Autowired
    DishToDeliveryConverter dtdConv;

    @PostMapping("/dishestodelivery")
    public ResponseEntity<?> addDishToDelivery(@RequestBody DishToDeliveryDtoR dto) {

        DishToDelivery dtd = dtdConv.dtoToDishToDelivery(dto);

        return new ResponseEntity<DishToDelivery>(dtdRepo.save(dtd), HttpStatus.OK);
    }

}

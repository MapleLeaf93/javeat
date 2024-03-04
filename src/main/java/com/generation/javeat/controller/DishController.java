package com.generation.javeat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.generation.javeat.model.dto.dish.DishDtoR;
import com.generation.javeat.model.dtoservices.DishConverter;
import com.generation.javeat.model.entities.Dish;
import com.generation.javeat.repositories.DishRepository;

@RestController
public class DishController {

    @Autowired
    DishRepository dRepo;

    @Autowired
    DishConverter dConv;

    @PutMapping("/dishes")
    public ResponseEntity<?> customizeDish(@RequestBody DishDtoR dto) {

        Dish d = dConv.dtoRToDish(dto);
        dRepo.save(d);
        return new ResponseEntity<Dish>(d, HttpStatus.OK);
    }
}

package com.generation.javeat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;

import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.generation.javeat.model.dto.delivery.DeliveryDtoRPost;
import com.generation.javeat.model.dtoservices.DeliveryConverter;
import com.generation.javeat.model.entities.Delivery;
import com.generation.javeat.repositories.DeliveryRepository;

@RestController
public class DeliveryController {

    @Autowired
    DeliveryConverter dConv;

    @Autowired
    DeliveryRepository dRepo;

    @PostMapping("/delivery") // prende id ristorante, id user e lista piatti
    public ResponseEntity<?> insertDelivery(@RequestBody DeliveryDtoRPost dto) {

        Delivery d = dConv.DtoRToDelivery(dto);
        return new ResponseEntity<Delivery>(dRepo.save(d), HttpStatus.OK);
    }

}
